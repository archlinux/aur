# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: jorge_barroso <jorge.barroso.11 at gmail dot com>

pkgname=akari
pkgver=1.0.47
_timestamp=20220222
_ccstoolsver=1.8.5
pkgrel=1
pkgdesc='TOMOYO Linux 1.8.x Module for the Linux kernel'
arch=('x86_64')
url='http://akari.osdn.jp/'
license=('GPL')
makedepends=('linux' 'linux-headers')
conflicts=("ccs-tools<${_ccstoolsver}")
install=${pkgname}.install
source=("http://osdn.jp/frs/redir.php?f=/akari/49272/${pkgname}-${pkgver}-${_timestamp}.tar.gz"
        "http://osdn.jp/frs/redir.php?f=/akari/49272/${pkgname}-${pkgver}-${_timestamp}.tar.gz.asc"
        activation_trigger.patch)
sha256sums=('71ec6ba451a84c9b0ec625bfa1f5e9560220df25b9b0376d1167989977e5a6da'
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
