# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.4.0
pkgrel=2
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL-3.0-or-later')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

b2sums=('47422d4a4c971814cedbff7a647c3e910998fe199c5c21b709174bdfdfebb9161c62c060599a71b3ada0a0ceaacb99f3df74e2c95fe65ed4dde4f720b610594f')

prepare() {
  mkdir -v "${srcdir}/build"
}

build() {
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOMODCACHE="${srcdir}/go-mod"
  export GOFLAGS="-v -x -work -modcacherw -trimpath -buildmode=pie -mod=readonly"

  cd "${srcdir}"
  go build -o "${srcdir}/build" \
    -ldflags "-w -s -linkmode external -X 'github.com/juicity/juicity/config.Version=${pkgver}-${pkgrel}'" \
    ./cmd/{server,client}
}

_package() {
  pkgdesc+=" (${pkgname#*-})"
  provides=("${pkgname}")
  conflicts=("${pkgname}")
  backup=("etc/${pkgbase}/${pkgname#*-}.json")

  install -Dm755 "${srcdir}/build/${pkgname#*-}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/install/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/install/example-${pkgname#*-}.json" "${pkgdir}/etc/${pkgbase}/${pkgname#*-}.json"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
