# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=kate
pkgname=('kwrite-root'
         'kate-root')
pkgver=17.04.1
pkgrel=1
arch=('armv7h' 'i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
makedepends=('extra-cmake-modules' 'kdoctools' 'python' 'plasma-framework' 'knewstuff' 'ktexteditor'
             'threadweaver' 'kitemmodels' 'kactivities')
source=("https://download.kde.org/stable/applications/${pkgver}/src/${pkgbase}-${pkgver}.tar.xz"{,.sig}
        "https://gitlab.com/Megver83/kdebase-root-patches/raw/master/0001-Defuse-root-block.patch"{,.sig})
sha256sums=('34eee6c384e2c2776c7d0ab65e7217e730cdbdecb82578c9dc90380cb82affd2'
            'SKIP'
            '97926a28409205bff73df7788afcbce5229a60734db26704ffb10535c74bb96c'
            'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
              '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
options=(!emptydirs)

prepare() {
  mkdir -p build
  cd $srcdir/${pkgbase}-${pkgver}
  patch -p1 -i $srcdir/0001-Defuse-root-block.patch
}

build() {
  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package_kwrite-root() {
  pkgdesc="Text Editor"
  groups=('kde-applications' 'kdebase')
  url="https://www.kde.org/applications/utilities/kwrite/"
  depends=('ktexteditor' 'kactivities' 'hicolor-icon-theme')
  replaces=('kdebase-kwrite')
  conflicts=('kdebase-kwrite')
  provides=('kdebase-kwrite')

  cd build
  make DESTDIR="${pkgdir}" install

  find "$pkgdir" -type f -name '*kate*' -exec rm {} \;
  rm -r "$pkgdir"/usr/lib/qt/plugins/ktexteditor \
        "$pkgdir"/usr/share/doc/HTML/*/{kate,katepart} \
        "$pkgdir"/usr/share/katexmltools \
        "$pkgdir"/usr/share/locale/*/LC_MESSAGES/{kterustcompletion,tabswitcherplugin}.mo \
        "$pkgdir"/usr/share/plasma/plasmoids
}

package_kate-root() {
  pkgdesc="Advanced Text Editor"
  groups=('kde-applications' 'kdebase')
  url="https://www.kde.org/applications/utilities/kate/"
  depends=('knewstuff' 'ktexteditor' 'threadweaver' 'kitemmodels' 'kactivities' 'hicolor-icon-theme')
  replaces=('kdesdk-kate')
  conflicts=('kdesdk-kate')
  provides=('kdesdk-kate')
  optdepends=('konsole: open a terminal in Kate')

  cd build
  make DESTDIR="${pkgdir}" install

  find "$pkgdir" -type f -name '*kwrite*' -exec rm {} \;
  rm -r "$pkgdir"/usr/share/doc/HTML/*/kwrite
}
