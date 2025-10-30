# Maintainer: taotieren <admin@taotieren.com>

pkgname=linglong-pica-git
pkgver=1.2.6.r3.g65a2ede
pkgrel=1
pkgdesc='deb package to Linglong package tool.'
arch=($CARCH)
url='https://github.com/linuxdeepin/linglong-pica'
license=('LGPL-3.0-or-later')
provides=(
  ${pkgname%-git}
)
conflicts=(
  ${pkgname%-git}
)
replaces=()
depends=(
  sh
  linyaps
)
makedepends=(
  git
  go
  pkgconf
)
# checkdepends=(
#   apt
# )
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}"/${pkgname}/
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GO111MODULE=on
  export GOPROXY=https://goproxy.cn,direct
  
  sed -i 's|${PREFIX}/libexec|${PREFIX}/lib|g' Makefile
   make build
}

# check() {
#   cd "${srcdir}"/${pkgname}/
#   make test
# }

package() {
  cd "${srcdir}"/${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
