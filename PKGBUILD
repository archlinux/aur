# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=akari
pkgver=1.0.54
_timestamp=20260415
_ccstoolsver=1.8.5
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Module for the Linux kernel'
arch=('x86_64')
url='https://tomoyo.sourceforge.net/akari/'
license=('GPL')
makedepends=('linux' 'linux-headers')
conflicts=("ccs-tools<${_ccstoolsver}")
install=${pkgname}.install
source=("https://sourceforge.net/projects/tomoyo/files/akari-patch/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
        "https://sourceforge.net/projects/tomoyo/files/akari-patch/${pkgname}-${pkgver}-${_timestamp}.tar.gz.asc"
        activation_trigger.patch)
sha256sums=('ef8ef57967f383e2eed460cd766daae6ac0d4a8771071266d1e955926852a6c3'
            'SKIP'
            '55d86a0d602631129298887fa63c1396ed6c6229965efcdbdc549ee159a39702')
noextract=("${pkgname}-${pkgver}-${_timestamp}.tar.gz")
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A')

prepare() {
  _kernver="$(uname -r)"
  cp -a "/usr/lib/modules/${_kernver}/build" "${srcdir}"
  cd "${srcdir}/build"
  tar -zxf "${srcdir}/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
  patch -p2 -i "${srcdir}/activation_trigger.patch"
}

build() {
  cd "${srcdir}/build/"
  make M=akari modules
}

package() {
  _kernver="$(uname -r)"
  install -D -m644 "${srcdir}/build/akari/akari.ko" \
    "${pkgdir}/usr/lib/modules/${_kernver}/extramodules/akari.ko"
  gzip "${pkgdir}/usr/lib/modules/${_kernver}/extramodules/"*.ko
}
