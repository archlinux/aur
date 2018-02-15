# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=akari
pkgver=1.0.36
_timestamp=20170917
_extramodules=extramodules-4.15-ARCH
_ccstoolsver=1.8.5
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Module for the Linux kernel'
arch=('x86_64')
url='http://akari.osdn.jp/'
license=('GPL')
makedepends=('linux' 'linux-headers>=4.15' 'linux-headers<4.16')
depends=("ccs-tools>=${_ccstoolsver}")
conflicts=("ccs-tools<${_ccstoolsver}")
install=${pkgname}.install
source=("http://osdn.jp/frs/redir.php?f=/akari/49272/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
        "http://osdn.jp/frs/redir.php?f=/akari/49272/${pkgname}-${pkgver}-${_timestamp}.tar.gz.asc"
        activation_trigger.patch)
sha256sums=('5cabe2b31a50cb6b49f0ea089d6ecb4384fa00afc53f8bf825c54caffc1dfe2c'
            'SKIP'
            '55d86a0d602631129298887fa63c1396ed6c6229965efcdbdc549ee159a39702')
noextract=("${pkgname}-${pkgver}-${_timestamp}.tar.gz")
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A')

prepare() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cp -a "/usr/lib/modules/${_kernver}/build" "${srcdir}"
  cd "${srcdir}/build"
  tar -zxf "${srcdir}/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
  patch -p2 -i "${srcdir}/activation_trigger.patch"
}

build() {
  cd "${srcdir}/build/"
  make SUBDIRS=akari SYSSRC=/usr/lib/modules/${_kernver}/build modules
}

package() {
  install -D -m644 "${srcdir}/build/akari/akari.ko" \
    "${pkgdir}/usr/lib/modules/${_extramodules}/akari.ko"
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/"*.ko
}
