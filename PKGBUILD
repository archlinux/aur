# Merged with official ABS calligra PKGBUILD by João, 2021/05/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Maintainer: Solomon Choina <shlomochoina@gmail.com

pkgname=calligra-git
pkgdesc="A set of applications for productivity and creative usage"
pkgver=3.3.89_r102254.g64875b0e836
pkgrel=1
arch=($CARCH)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kcmutils5 knotifyconfig5 kross kactivities5 kdiagram5 libspnav kdelibs4support
  gsl openexr kcontacts5 qca-qt5 poppler-qt5 libodfgen khtml cauchy)
  makedepends=(git extra-cmake-modules-git kdoctools5 kdesignerplugin libwpg okular eigen marble-common boost pstoedit libvisio libetonyek libwps vc libgit2 kcalendarcore5 akonadi)
optdepends=('libwpg: Corel WordPerfect Graphics image importer'
            'libwps: Microsoft Works file word processor format import'
            'libvisio: Microsoft Visio import filter'
            'libetonyek: Apple Keynote import filter'
            'pstoedit: EPS to SVG filter'
            'poppler: PDF to SVG filter'
            'libgit2: Calligra Gemini git plugin'
            'kirigami2-: for Calligra Gemini'
            'qt5-quickcontrols: for Calligra Gemini'
            'qt5-webengine: for Calligra Gemini')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(CALLIGRA_VERSION_STRING' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

# Remove utterly broken thumbnailers
  rm "$pkgdir"/usr/lib/qt/plugins/calligra*thumbnail.so
}
