# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

# This is the PKGBUILD from the main repos, but with a few mods to
# make it work with Qt5 (fairly simple patch I wrote). It can be 
# deleted if my patch is accepted upstream! -- Steven

pkgname=wpa_supplicant_gui-qt5
pkgver=2.2
pkgrel=1
pkgdesc="A Qt frontend to wpa_supplicant - ported to Qt5"
url="https://github.com/stevenhoneyman/wpa_gui"
arch=('i686' 'x86_64')
depends=('qt5-base' 'wpa_supplicant')
conflicts=('wpa_supplicant_gui')
license=('GPL')
source=("http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz"
	"wpa_gui2.2-add_qt5_support.patch")
sha256sums=('e0d8b8fd68a659636eaba246bb2caacbf53d22d53b2b6b90eb4b4fef0993c8ed'
	    '65d23a1eca85e46fb075b63406ebde10b61491c448311618bd60acb056c1639b')

prepare() {
  cd wpa_supplicant-${pkgver}/wpa_supplicant/wpa_gui-qt4
  patch -p1 -i "${srcdir}/wpa_gui2.2-add_qt5_support.patch"
}

build() {
  cd wpa_supplicant-${pkgver}
  cd wpa_supplicant/wpa_gui-qt4
  qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "${srcdir}/wpa_supplicant-${pkgver}/wpa_supplicant/wpa_gui-qt4"
  install -Dm755 wpa_gui "${pkgdir}/usr/bin/wpa_gui"
  install -Dm644 icons/wpa_gui.svg "${pkgdir}/usr/share/pixmaps/wpa_gui.svg"
  install -Dm644 wpa_gui.desktop "${pkgdir}/usr/share/applications/wpa_gui.desktop"
  install -Dm644 "${srcdir}/wpa_supplicant-${pkgver}/wpa_supplicant/doc/docbook/wpa_gui.8" \
     "${pkgdir}/usr/share/man/man8/wpa_gui.8"
}
