# Maintainer: fuero <fuerob@gmail.com>

pkgname=ketall-git
pkgver=1.3.8.r7.16390bd
pkgrel=1
pkgdesc='Kubectl plugin to show really all kubernetes resources'
arch=('x86_64')
_repo_prefix='github.com/corneliusweig'
_repo_name="${pkgname%-git}"
url="https://${_repo_prefix}/${_repo_name}"
source=("${_repo_name}::git+https://${_repo_prefix}/${_repo_name}")
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=('ketall')
provides=('ketall')
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

prepare () {
  mkdir -p "${srcdir}/src/${_repo_prefix}"
  ln -snf "${srcdir}/${_repo_name}" "${srcdir}/src/${_repo_prefix}/${_repo_name}"
}

clean() {
  # Clean up symlink
  rm -f "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  rm -f "${_repo_name}.bin"
}

build () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  export GOPATH="${srcdir}"
  export PATH="${PATH}:${GOPATH}/bin"
  go build -x -v -modcacherw -ldflags "-extldflags '${LDFLAGS}' -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)" -o "${_repo_name}.bin"
}

package () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  install -Dm755 "${srcdir}/src/${_repo_prefix}/${_repo_name}/${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm644 "${srcdir}/src/${_repo_prefix}/${_repo_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
