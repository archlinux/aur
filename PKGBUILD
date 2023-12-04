# Maintainer: fuero <fuerob@gmail.com>
pkgname=ls-lint-git
# renovate: pkgName=https://github.com/loeffel-io/ls-lint depName=ls-lint-git
_commit=d781eac794d02f3ef1b68f74331438144ca2dd74
pkgver=2.2.2.r20.d781eac
pkgrel=1
pkgdesc='directory and filename linter'
arch=('x86_64')
_repo_prefix='github.com/loeffel-io'
_repo_name="${pkgname%-git}"
url="https://${_repo_prefix}/${_repo_name}"
source=("${_repo_name}.git::git+https://${_repo_prefix}/${_repo_name}")
license=('MIT')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=("${_repo_name}")
provides=("${_repo_name}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}.git"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build () {
  cd "${srcdir}/${_repo_name}.git"
  go build -x -v \
    -ldflags "-extldflags '${LDFLAGS}' -X main.commit=$(git rev-parse --short HEAD) -X main.date=$(date -u +%Y%m%d.%H%M%S) -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)" \
    -o "${_repo_name}.bin" \
    ./cmd/ls_lint  
}

package () {
  cd "${srcdir}/${_repo_name}.git"
  install -Dm0755 "${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
