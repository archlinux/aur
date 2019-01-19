pkgbase=calligra-git
pkgname=('calligra-git')
pkgver=3.1.0.r440.g7f40c71e674
pkgrel=1
arch=('i686' 'x86_64')
license=('FDL1.2' 'GPL2' 'LGPL')
url='http://www.calligra-suite.org/'
makedepends=('git' 'vc' 'libgit2' 'extra-cmake-modules' 'kdesignerplugin' 'kdoctools' 'kdelibs4support' 'cmake' 'khtml' 'kross' 'kreport' 'kproperty' 'kdiagram' 'okular' 'kxmlgui' 'qt5-webkit' 'poppler' 'qca-qt5' 'libvisio' 'libetonyek' 'kactivities' 'kio' 'ilmbase' 'lcms2'  'kxmlgui'
             'marble' 'kcalcore' 'akonadi-contacts' 'knotifyconfig' 'poppler-qt5' 'libodfgen' 'threadweaver' 'boost' 'eigen')
depends=('kcmutils'  'knotifyconfig' 'kross' 'kactivities' 'kdiagram' 'libspnav' 'kdelibs4support'
               'gsl' 'openexr' 'kcontacts' 'qca-qt5' 'poppler-qt5' 'libodfgen' 'qt5-webkit' 'cauchy' 'khtml')
optdepends=('libwpg: Corel WordPerfect Graphics image importer'
            'libwps: Microsoft Works file word processor format import'
            'libvisio: Microsoft Visio import filter'
            'libetonyek: Apple Keynote import filter'
            'pstoedit: EPS to SVG filter'
            'poppler: PDF to SVG filter'
            'openjpeg: PDF to SVG filer'
            'libgit2: Calligra Gemini git plugin'
            'kirigami2: for Calligra Gemini'
            'qt5-quickcontrols: for Calligra Gemini'
            'qt5-webengine: for Calligra Gemini')
source=('calligra::git+git://anongit.kde.org/calligra')
sha256sums=('SKIP')
conflicts=(calligra calligra-devtools-git calligra-extras-git calligra-filters-git calligra-karbon-git karbon calligra-libs-git
  calligra-plugins-git calligra-sheets-git calligra-stage-git calligra-words-git calligra-meta
  calligra-flow-git calligra-braindump-git calligra-gemin-git calligra-handbook-git)
replaces=(calligra calligra-devtools calligra-extras calligra-filters calligra-karbon karbon calligra-libs
  calligra-plugins calligra-sheets calligra-stage calligra-words calligra-l10n calligra-meta)

provides=('calligra')

pkgver() {
  cd calligra
   git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build
  fi
  mkdir ${srcdir}/build
}

build() {
 
   if [[ "${CARCH}" == "i686" ]]; then
     CFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
     CXXFLAGS="-march=i686 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"    
   else
     CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
     CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong --param=ssp-buffer-size=4"
   fi

  cd ${srcdir}/build
  cmake  ../calligra -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DBUILD_TESTING=OFF  -Wno-dev
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}

