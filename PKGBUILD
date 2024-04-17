# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.4.1
pkgrel=1
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL-3.0-or-later')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

b2sums=('bd1d0b886f6d1cd73fc6f054815cef5a6977697752a214467266a9698f12e48e8a66ec0b8049f3ad3d9a1823d446ba6aca7b37d42ae41cee0777f4b3336560b2')

prepare() {
  mkdir -v "${srcdir}/build"
}

build() {
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOMODCACHE="${srcdir}/go-mod"
  export GOFLAGS="-v -x -work -modcacherw -trimpath -buildmode=pie -mod=readonly"

  go build \
    -C "${srcdir}" \
    -o "${srcdir}/build" \
    -ldflags "-w -s -linkmode external -X 'github.com/juicity/juicity/config.Version=v${pkgver}-arch${pkgrel}'" \
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
