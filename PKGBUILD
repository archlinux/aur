# Maintainer: David P. <megver83@parabola.nu>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgbase=kate
pkgbase=kate-root
pkgname=('kwrite-root'
         'kate-root')
pkgver=17.04.2
pkgrel=1
arch=('armv7h' 'i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
makedepends=('extra-cmake-modules' 'kdoctools' 'python' 'plasma-framework' 'knewstuff' 'ktexteditor'
             'threadweaver' 'kitemmodels' 'kactivities')
source=("https://download.kde.org/stable/applications/${pkgver}/src/${_pkgbase}-${pkgver}.tar.xz"{,.sig}
        "https://gitlab.com/Megver83/kdebase-root-patches/raw/master/0001-Defuse-root-block.patch"{,.sig})
sha256sums=('1045c5bee48ade8c229096eeaa8696eba4dac118bccc2a535f9ac553602fcaaf'
            'SKIP'
            '97926a28409205bff73df7788afcbce5229a60734db26704ffb10535c74bb96c'
            'SKIP')
validpgpkeys=('CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
              '6DB9C4B4F0D8C0DC432CF6E4227CA7C556B2BA78' # David P.
)
options=(!emptydirs)

prepare() {
  mkdir -p build
  cd $srcdir/${_pkgbase}-${pkgver}
  patch -p1 -i $srcdir/0001-Defuse-root-block.patch
}

build() {
  cd build
  cmake ../${_pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package_kwrite-root() {
  pkgdesc="Text Editor, patched to be able to run as root"
  url="https://www.kde.org/applications/utilities/kwrite/"
  depends=('ktexteditor' 'kactivities' 'hicolor-icon-theme')
  replaces=('kdebase-kwrite' 'kwrite')
  conflicts=('kdebase-kwrite' 'kwrite')
  provides=('kdebase-kwrite' 'kwrite')

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
  pkgdesc="Advanced Text Editor, patched to be able to run as root"
  url="https://www.kde.org/applications/utilities/kate/"
  depends=('knewstuff' 'ktexteditor' 'threadweaver' 'kitemmodels' 'kactivities' 'hicolor-icon-theme')
  replaces=('kdesdk-kate' 'kate')
  conflicts=('kdesdk-kate' 'kate')
  provides=('kdesdk-kate' 'kate')
  optdepends=('konsole: open a terminal in Kate')

  cd build
  make DESTDIR="${pkgdir}" install

  find "$pkgdir" -type f -name '*kwrite*' -exec rm {} \;
  rm -r "$pkgdir"/usr/share/doc/HTML/*/kwrite
}
