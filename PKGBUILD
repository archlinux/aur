# Merged with official ABS calligra PKGBUILD by João, 2021/05/30 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Maintainer: Solomon Choina <shlomochoina@gmail.com

pkgname=calligra-git
pkgdesc="A set of applications for productivity and creative usage"
pkgver=3.2.89_r101526.g785c52d202b
pkgrel=1
arch=($CARCH)
url='https://www.calligra-suite.org/'
license=(FDL1.2 GPL2 LGPL)
depends=(kcmutils-git knotifyconfig-git kross-git kactivities-git kdiagram-git libspnav kdelibs4support-git
         gsl openexr kcontacts-git qca-qt5-git poppler-qt5 libodfgen khtml-git cauchy)
makedepends=(git extra-cmake-modules-git kdoctools-git kdesignerplugin-git kinit-git libwpg okular-git eigen marble-common-git boost pstoedit libvisio libetonyek libwps vc libgit2 kcalendarcore-git akonadi-git)
optdepends=('libwpg: Corel WordPerfect Graphics image importer'
            'libwps: Microsoft Works file word processor format import'
            'libvisio: Microsoft Visio import filter'
            'libetonyek: Apple Keynote import filter'
            'pstoedit: EPS to SVG filter'
            'poppler: PDF to SVG filter'
            'libgit2: Calligra Gemini git plugin'
            'kirigami2-git: for Calligra Gemini'
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
