# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgbase=digikam
pkgname=(digikam kipi-plugins)
_pkgver=5.9.0
pkgver=${_pkgver//-/_} # for beta versions
pkgrel=4
pkgdesc="An advanced digital photo management application"
arch=(x86_64)
license=(GPL)
url="http://www.digikam.org/"
makedepends=(extra-cmake-modules libkipi libksane liblqr opencv doxygen lensfun eigen boost kdoctools marble-common
             kfilemetadata akonadi-contacts qtav threadweaver kcalcore knotifyconfig libmediawiki libkvkontakte glu qt5-xmlpatterns)
source=("http://download.kde.org/stable/${pkgname}/${pkgname}-${_pkgver}.tar.xz"
        kdebug-395875.patch::"https://cgit.kde.org/digikam.git/patch/core?id=486e34a0"
        digikam-opencv4.patch)
sha256sums=('660d32eedcfd6fe1a75170a651fab068ae62f7f092ae710771a2f32a1c550d1b'
            'c63f177950c4a1728699c59cf670fec1353955bdc4a7b4ac6c844aec15871fa8'
            '621faf691d081239d792616ea40bac7a1cc07c3adf1bc74b4adc9107eacb4232')

prepare() {
  mkdir -p build

  cd $pkgbase-$pkgver
  patch -p1 -i ../kdebug-395875.patch   # Fix window state saving on close
  patch -p1 -i ../digikam-opencv4.patch # fix build with openCV 4
}

build() {
  cd build

  cmake ../$pkgname-${_pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_OPENCV3=ON \
    -DENABLE_APPSTYLES=ON
  make
}

package_digikam() {
  depends=(liblqr libkipi lensfun opencv akonadi-contacts knotifyconfig libksane kfilemetadata
           qt5-webkit qtav marble-common threadweaver kcalcore)
  optdepends=('kipi-plugins: export to various online services'
              'hugin: panorama tool' 'qt5-imageformats: support for additional image formats (WEBP, TIFF)')

  cd build/core
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/doc
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by kipi-plugins
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/kipiplugin*.mo
}

package_kipi-plugins() {
  pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam"
  depends=(kio libkipi)
  optdepends=('libmediawiki: MediaWiki Export plugin'
              'libkvkontakte: VKontakte.ru Exporter plugin'
              'qt5-xmlpatterns: rajce.net plugin')

  cd build/extra
  make DESTDIR="$pkgdir" install
  cd $srcdir/build/po
  make DESTDIR="$pkgdir" install

# Provided by digikam
  rm "$pkgdir"/usr/share/locale/*/LC_MESSAGES/digikam.mo
}
