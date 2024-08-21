# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=v2dat
pkgname=${_pkgname}-git
pkgver=r2.47b8ee5
pkgrel=1
pkgdesc="A cli tool that can unpack v2ray data packages"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/urlesistiana/v2dat"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -o "${_pkgname}" \
    -v \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode external -s -w" \
    -mod=readonly \
    -modcacherw \
    ../
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
