# Maintainer: Puqns67 <me@puqns67.icu>

pkgbase='juicity'
pkgname=(${pkgbase}-{client,server})
pkgver=0.2.1
pkgrel=1
pkgdesc='A quic-based proxy protocol and implementation, inspired by tuic.'
url='https://github.com/juicity/juicity'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv64')
depends=('glibc')
makedepends=('go')

source=("${pkgbase}-${pkgver}-full-src.zip"::"${url}/releases/download/v${pkgver}/${pkgbase}-full-src.zip")

sha512sums=('34df9792436ce5ddb34e415f8da50ea82b9a7728269db600438d40543b1c913dacaff4570ac4a636b485269cfaaa7327ff7e6289974e6ec6547ec162c14c2269')

build() {
  GOFLAGS='-trimpath -modcacherw' GOMODCACHE="${srcdir}/go-mod" VERSION="${pkgver}" make -C "${srcdir}" all
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
