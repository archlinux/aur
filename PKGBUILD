pkgbase=calligra-frameworks-git
pkgname=(
#         'calligra-braindump-frameworks-git'
         'calligra-devtools-frameworks-git'
         'calligra-extras-frameworks-git'
         'calligra-filters-frameworks-git'
#         'calligra-flow-frameworks-git'
         'calligra-gemini-frameworks-git'
#         'calligra-handbook-frameworks-git'
         'calligra-karbon-frameworks-git'
#         'calligra-kexi-frameworks-git'
         'calligra-krita-frameworks-git'
         'calligra-libs-frameworks-git'
         'calligra-plan-frameworks-git'
         'calligra-plugins-frameworks-git'
         'calligra-sheets-frameworks-git'
         'calligra-stage-frameworks-git'
         'calligra-words-frameworks-git')
pkgver=3.0_Pre_Alpha.r97194.469aabd
pkgrel=1
arch=('i686' 'x86_64')
license=('FDL1.2' 'GPL2' 'LGPL')
url='http://www.calligra-suite.org/'
makedepends=('cmake' 'boost-libs' 'marble-git' 'kdelibs4support' 'libkdcraw-frameworks-git' 'poppler-qt5'
             'knotifyconfig' 'qca-qt5' 'qt5-quick1' 'kdiagram-git'
             'lcms2' 'libmariadbclient' 'freetds' 'xbase' 'libwpg' 'libwps' 'opencolorio' 'gsl' 'glew' 'fftw' 'libodfgen'
             'openjpeg' 'pstoedit' 'vc' 'libvisio' 'hicolor-icon-theme'
             'libetonyek' 'libpqxx' 'libspnav' 'eigen' 'postgresql' 'cauchy-hg') # 'okular-frameworks-git'
groups=('calligra-frameworks-git')
source=('git://anongit.kde.org/calligra#branch=frameworks'
        'http://pkgs.fedoraproject.org/cgit/calligra.git/plain/0001-adapt-to-libwps-0.4.patch')
sha1sums=('SKIP'
          '7f338b6f68582ea4639d45e1794707b56e368433')

pkgver() {
  cd calligra
  _ver="$(cat CMakeLists.txt | grep CALLIGRA_VERSION_STRING | head -n1 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' _ | tr - _).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  # fix build with libwps-0.4
  patch -d calligra -p1 -i ../0001-adapt-to-libwps-0.4.patch

  # fix detection marble qt5/KF5 port
  sed 's|marblewidget|marblewidget-qt5|g' -i calligra/cmake/modules/FindCalligraMarble.cmake
}

build() {
  cd build
  cmake  ../calligra \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package_calligra-kexi-frameworks-git() {
  pkgdesc="Develop desktop database applications. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs' 'glew' 'fftw')
  optdepends=('libmariadbclient: MariaDB driver'
              'libpqxx: PostgreSQL driver'
              'freetds: Sybase & MS SQL driver'
              'xbase: XBase driver'
              'calligra-sheets-frameworks-git: Spreadsheet-to-Kexi-table import plugin'
              'marble-git: map form widget'
              'calligra-plugins-frameworks-git: extra calligra plugins')
  conflicts=('calligra-kexi')
  install=calligra-frameworks-git.install

  make -C build/kexi DESTDIR="${pkgdir}" install
#  make -C build/doc/kexi DESTDIR="${pkgdir}" install
}

package_calligra-handbook-frameworks-git() {
  pkgdesc="Documentation for Calligra. KF5 Frameworks branch. (GIT version)"
  conflicts=('calligra-handbook')
  options=('docs')

  make -C calligra/doc/calligra DESTDIR="${pkgdir}" install
}

package_calligra-braindump-frameworks-git() {
  pkgdesc="Notes and idea gathering. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git')
  conflicts=('calligra-braindump')
  install=calligra-frameworks-git.install

  make -C build/braindump DESTDIR="${pkgdir}" install
}

package_calligra-flow-frameworks-git() {
  pkgdesc="Flowchart & Diagram Editing. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-words-frameworks-git')
  optdepends=('calligra-karbon-frameworks-git: to export the charts in various formats')
  conflicts=('calligra-flow')
  install=calligra-frameworks-git.install

  make -C build/flow DESTDIR="${pkgdir}" install
}


package_calligra-devtools-frameworks-git() {
  pkgdesc="Calligra developer tools. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git' 'poppler-qt5')
  conflicts=('calligra-devtools')

  make -C build/devtools DESTDIR="${pkgdir}" install
}

package_calligra-extras-frameworks-git() {
  pkgdesc="Calligra suite extras. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git')
  optdepends=() # 'okular-frameworks-git'
  conflicts=('calligra-extras')
  install=calligra-frameworks-git.install

  make -C build/extras DESTDIR="${pkgdir}" install
  make -C build/data DESTDIR="${pkgdir}" install
}

package_calligra-filters-frameworks-git() {
  pkgdesc="Filters for the Calligra office suite. KF5 Frameworks branch. (GIT version)"
  depends=('libodfgen' 'khtml')
  optdepends=('libwpg: Corel WordPerfect Graphics image importer'
              'libwps: Microsoft Works file word processor format import'
              'libvisio: Microsoft Visio import filter'
              'libetonyek: Apple Keynote import filter'
              'poppler: PDF import filter')
  conflicts=('calligra-filters')
  install=calligra-frameworks-git.install

  make -C build/filters DESTDIR="${pkgdir}" install
}

package_calligra-gemini-frameworks-git() {
  pkgdesc="QML interface for Calligra Words and Stage. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-words-frameworks-git' 'calligra-stage-frameworks-git' 'qt5-quick1')
  conflicts=('calligra-gemini')
  install=calligra-frameworks-git.install

  make -C build/qtquick DESTDIR="${pkgdir}" install
  make -C build/gemini DESTDIR="${pkgdir}" install
}

package_calligra-karbon-frameworks-git() {
  pkgdesc="Create scalable vector drawings. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git' 'pstoedit' 'hicolor-icon-theme')
  optdepends=('calligra-filters-frameworks-git: import/export filters'
              'calligra-extras-frameworks-git: extra calligra tools')
  conflicts=('calligra-karbon')
  install=calligra-frameworks-git.install

  make -C build/karbon DESTDIR="${pkgdir}" install
}

package_calligra-krita-frameworks-git() {
  pkgdesc="Edit and paint images. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-plugins-frameworks-git' 'exiv2' 'openexr' 'glew' 'fftw' 'opencolorio' 'gsl' 'poppler-qt5')
  optdepends=('libkdcraw-frameworks-git: Open RAW images')
  conflicts=('calligra-krita-doc')
  install=calligra-frameworks-git.install

  make -C build/krita DESTDIR="${pkgdir}" install
}

package_calligra-libs-frameworks-git() {
  pkgdesc="Libraries for the Calligra office suite. KF5 Frameworks branch. (GIT version)"
  depends=('kdepimlibs-git' 'kactivities' 'qca-qt5' 'ilmbase') # kdepimlibs-akonadi-contact-git'
  conflicts=('calligra-libs')

  for i in interfaces libs pics servicetypes; do
    make -C "build/${i}" DESTDIR="${pkgdir}" install
  done
}

package_calligra-plan-frameworks-git() {
  pkgdesc="Calligra Project Management Component. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-words-frameworks-git')
  conflicts=('calligra-plan')
  install=calligra-frameworks-git.install

  make -C build/plan DESTDIR="${pkgdir}" install
}

package_calligra-plugins-frameworks-git() {
  pkgdesc="Plugins for the Calligra office suite. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git' 'calligra-filters-frameworks-git' 'kdiagram-git' 'libspnav')
  optdepends=('ilmbase: ILM for OpenEXR plugin'
              'cauchy-hg: Math plugin'
              'lcms2: Color management plugin')
  conflicts=('calligra-plugins')
  install=calligra-frameworks-git.install

  make -C build/plugins DESTDIR="${pkgdir}" install
}

package_calligra-sheets-frameworks-git() {
  pkgdesc="Write spreadsheet documents. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-libs-frameworks-git' 'knotifyconfig' 'gsl' 'hicolor-icon-theme')
  optdepends=('calligra-filters-frameworks-git: import/export filters'
              'calligra-plugins-frameworks-git: extra calligra plugins'
              'calligra-extras-frameworks-git: extra calligra tools')
  conflicts=('calligra-sheets')
  install=calligra-frameworks-git.install

  make -C build/sheets DESTDIR="${pkgdir}" install
#   make -C build/doc/sheets DESTDIR="${pkgdir}" install
}

package_calligra-stage-frameworks-git() {
  pkgdesc="Write presentation documents. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-plugins-frameworks-git' 'hicolor-icon-theme')
  conflicts=('calligra-stage')
  install=calligra-frameworks-git.install

  make -C build/stage DESTDIR="${pkgdir}" install
#   make -C build/doc/stage DESTDIR="${pkgdir}" install
}

package_calligra-words-frameworks-git() {
  pkgdesc="Word Processor. KF5 Frameworks branch. (GIT version)"
  depends=('calligra-plugins-frameworks-git' 'hicolor-icon-theme') # 'okular-frameworks-git'
  optdepends=('calligra-extras-frameworks-git: extra calligra tools')
  conflicts=('calligra-words')
  install=calligra-frameworks-git.install

  make -C build/words DESTDIR="${pkgdir}" install
}