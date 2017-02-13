# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=akari
pkgver=1.0.35
_timestamp=20161229
_extramodules=extramodules-4.9-ARCH
_ccstoolsver=1.8.5
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Module for the Linux kernel'
arch=('i686' 'x86_64')
url='http://akari.sourceforge.jp/'
license=('GPL')
makedepends=('linux' 'linux-headers>=4.9' 'linux-headers<4.10')
optdepends=("ccs-tools>=${_ccstoolsver}")
conflicts=("ccs-tools<${_ccstoolsver}")
install=akari.install
source=(http://sourceforge.jp/frs/redir.php?f=/akari/49272/${pkgname}-${pkgver}-${_timestamp}.tar.gz
        activation_trigger.patch)
sha256sums=('57630f2a3c342ad60b2dce4ab4846ac6a1f03d4bc343185fe5796dcb12a83665'
            '55d86a0d602631129298887fa63c1396ed6c6229965efcdbdc549ee159a39702')
noextract=("${pkgname}-${_pkgver}-${_timestamp}.tar.gz")

prepare() {
  _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
  cp -a "/usr/lib/modules/${_kernver}/build" "${srcdir}"
  cd "${srcdir}/build"
  tar -xf "${srcdir}/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
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
