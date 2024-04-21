# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.4.2
pkgrel=1
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL-3.0-or-later')
arch=('x86_64' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

b2sums=('564b3520d79c3fc322fce852ff35cc5db15e2884764a4f6d9b2d09122db0207617ece349c92e5d91d1464466a2e435e965a53a5c2fbcd51b0c1cc74cc1eec8bf')

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
