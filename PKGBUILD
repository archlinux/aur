# Maintainer: Daniel González Cabanelas <dgcbueu@gmail.com>
# Contributor: Tudhalyas <tudhalyas_AT_gmail_DOT_com>

pkgname=amulegui-upnp
pkgver=11106
pkgrel=4
pkgdesc="Remote GUI for the aMule Daemon, an eMule-like client for the ed2k p2p network"
arch=('i686' 'x86_64')
url="http://www.amule.org/"
license=('GPL')
depends=(wxwidgets-gtk3 gd geoip libupnp)
makedepends=(crypto++)
conflicts=('amule' 'amule-svn' 'amule-noupnp-svn' 'amule-noupnp')
provides=("amulegui=${pkgver}")
source=(http://amule.sourceforge.net/tarballs/aMule-SVN-r${pkgver}.tar.bz2
        fix-locale-translations.patch)
md5sums=('1f9308e2354c684e7ec38abb819f9a1a'
         '151f4c91955df643f339c31a244a8271')

prepare() {
  patch -d aMule-SVN-r${pkgver} -p1 < fix-locale-translations.patch
}

build() {
  cmake -B build -S aMule-SVN-r${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_ALC=OFF \
    -DBUILD_ALCC=OFF \
    -DBUILD_AMULECMD=OFF \
    -DBUILD_CAS=OFF \
    -DBUILD_DAEMON=OFF \
    -DBUILD_REMOTEGUI=ON \
    -DBUILD_WEBSERVER=OFF \
    -DBUILD_WXCAS=OFF \
    -DBUILD_FILEVIEW=OFF \
    -DBUILD_MONOLITHIC=OFF \
    -DBUILD_ED2K=OFF \
    -DENABLE_NLS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/aMule-SVN-r${pkgver}"/amulegui.xpm "$pkgdir"/usr/share/pixmaps/amulegui.xpm
}
