# Maintainer: fuero <fuerob@gmail.com> 

pkgname=pdkgo-git
pkgver=0.2.0.r19.b774328
pkgrel=1
pkgdesc='Produce content for any Puppet Product'
arch=('x86_64')
_repo_prefix='github.com/puppetlabs'
_repo_name="${pkgname%-git}"
_bin_name="pct"
url="https://${_repo_prefix}/${_repo_name}"
source=("${_repo_name}::git+https://${_repo_prefix}/${_repo_name}")
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=('pdkgo')
provides=('pdkgo')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

#prepare () {
#  mkdir -p "${srcdir}/src/${_repo_prefix}"
#  ln -snf "${srcdir}/${_repo_name}" "${srcdir}/src/${_repo_prefix}/${_repo_name}"
#}

build () {
  cd "${srcdir}/${_repo_name}"
  export GOPATH="${srcdir}"
  go get -v ./...
  go fmt ./...
  git clone -b main --depth 1 --single-branch https://github.com/puppetlabs/baker-round "templates"
  go build -x -i -v -ldflags "-extldflags '${LDFLAGS}' -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)" -o "${_repo_name}.bin"
}

package () {
  cd "${srcdir}/${_repo_name}"
  install -Dm755 "${_repo_name}.bin" "${pkgdir}/usr/bin/${_bin_name}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
