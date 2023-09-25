# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.3.0
pkgrel=1
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

sha512sums=('868590c7ade61a369ba6449ac59bd72a350ec46a09ec7b627cdf3926e6244f05251965027359590db2c0c88625c5e77657e2a581601417a593a0cb829388abf1')

build() {
  GOFLAGS='-trimpath -modcacherw' GOMODCACHE="${srcdir}/go-mod" VERSION="${pkgver}-${pkgrel}" make -C "${srcdir}" all
}

_package() {
  pkgdesc+=" (${pkgname#*-})"
  provides=("${pkgname}")
  conflicts=("${pkgname}")
  backup=("etc/${pkgbase}/${pkgname#*-}.json")

  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/install/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/install/example-${pkgname#*-}.json" "${pkgdir}/etc/${pkgbase}/${pkgname#*-}.json"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() {
    $(declare -f "_package")
    _package
  }"
done
