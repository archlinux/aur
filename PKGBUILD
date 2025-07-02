# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.5.0
pkgrel=1
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

b2sums=('0b5b676ceccb2d518797f13818e6bca5f317b93724e2a76603d3e769e90a6cfe5952fbbe6c456dd3477acbc6a8fca3005300556122688a98800b13b4f1eb07bd')

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
