# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.4.3
pkgrel=2
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

b2sums=('28a63a5117695d32a07042b87e0e0bf89d2922fa1c7904374ee602bf32a14534ec89dc3c5ce09ea7f135bf97b3b42a7206eb1a229b8f4f8fbe8432224727ee5a')

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
