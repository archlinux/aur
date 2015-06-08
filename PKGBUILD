pkgbase=calligra-git
pkgname=('calligra-braindump-git'
         'calligra-devtools-git'
         'calligra-extras-git'
         'calligra-filters-git'
         'calligra-flow-git'
         'calligra-handbook-git'
         'calligra-karbon-git'
         'calligra-kexi-git'
         'calligra-krita-git'
         'calligra-libs-git'
         'calligra-plan-git'
         'calligra-plugins-git'
         'calligra-sheets-git'
         'calligra-stage-git'
         'calligra-words-git'
         'calligra-gemini-git')
pkgver=r95678.9bf0d3a
pkgrel=1
arch=('i686' 'x86_64')
license=('FDL1.2' 'GPL2' 'LGPL')
url='http://www.calligra-suite.org/'
makedepends=('cmake' 'automoc4' 'boost' 'kdepimlibs' 'kdeedu-marble'
             'lcms2' 'libmariadbclient' 'freetds' 'xbase' 'libwpg' 'opencolorio'
             'libwps' 'gsl' 'glew' 'fftw' 'poppler-qt' 'libkdcraw' 'libodfgen'
             'openjpeg' 'kdegraphics-okular' 'pstoedit' 'vc' 'libvisio'
             'libetonyek' 'libpqxx' 'libspnav' 'eigen' 'postgresql')
groups=('calligra-git')
source=('calligra::git+git://anongit.kde.org/calligra#branch=calligra/2.9')
md5sums=('SKIP')

pkgver() {
  cd calligra
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  cmake  ../calligra -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_active=OFF \
    -DWITH_Soprano=OFF  -Wno-dev 
  make    
}
package_calligra-filters-git() {
  pkgdesc="Filters for the Calligra office suite"
  depends=('libodfgen')
  optdepends=('libwpg: Corel WordPerfect Graphics image importer'
              'libwps: Microsoft Works file word processor format import'
              'libvisio: Microsoft Visio import filter'
              'libetonyek: Apple Keynote import filter')
  conflicts=('koffice-filters' 'calligra-filters')
  replaces=('koffice-filters' 'calligra-filters')
  install=calligra.install

  cd build/filters
  make DESTDIR="${pkgdir}" install
}

package_calligra-libs-git() {
  pkgdesc="Libraries for the Calligra office suite"
  depends=('kdepimlibs' 'kactivities' 'libkactivities4')
  conflicts=('koffice-interfaces' 'koffice-libs' 'koffice-pics'
             'koffice-servicetypes' 'calligra-interfaces'
             'calligra-pics' 'calligra-servicetypes' 'calligra-libs')
  replaces=('koffice-interfaces' 'koffice-libs' 'koffice-pics'
             'koffice-servicetypes' 'calligra-interfaces'
             'calligra-pics' 'calligra-servicetypes' 'calligra-libs')

  for d in interfaces libs pics servicetypes; do
    cd "${srcdir}"/build/${d}
    make DESTDIR="${pkgdir}" install
  done
}

package_calligra-plugins-git() {
  pkgdesc="Plugins for the Calligra office suite"
  depends=('calligra-libs-git' 'calligra-filters-git' 'libspnav')
  optdepends=('kdeedu-marble: map shape for Calligra')
  conflicts=('koffice-plugins' 'koffice-kchart' 'calligra-plugins')
  replaces=('koffice-plugins' 'koffice-kchart' 'koffice-kformula' 'calligra-plugins')
  install=calligra.install

  cd build/plugins
  make DESTDIR="${pkgdir}" install

  cd ../3rdparty/kdchart
  make DESTDIR="${pkgdir}" install
}

package_calligra-karbon-git() {
  pkgdesc="Create scalable vector drawings"
  depends=('calligra-libs-git' 'kdebase-runtime' 'pstoedit')
  optdepends=('calligra-filters-git: import/export filters'
              'calligra-extras: extra calligra tools')
  conflicts=('koffice-karbon' 'koffice-karbon-doc' 'calligra-karbon-doc' 'calligra-karbon')
  replaces=('koffice-karbon' 'koffice-karbon-doc' 'calligra-karbon-doc' 'calligra-karbon')
  install=calligra.install

  cd build/karbon
  make DESTDIR="${pkgdir}" install
}

package_calligra-kexi-git() {
  pkgdesc="Develop desktop database applications"
  depends=('calligra-libs-git' 'glew' 'fftw')
  optdepends=('libmariadbclient: MariaDB driver'
              'libpqxx: PostgreSQL driver'
              'freetds: Sybase & MS SQL driver'
              'xbase: XBase driver'
              'calligra-sheets: Spreadsheet-to-Kexi-table import plugin'
              'kdeedu-marble: map form widget'
              'calligra-plugins: extra calligra plugins')
  conflicts=('koffice-kexi' 'koffice-kexi-doc' 'calligra-kexi-doc' calligra-kexi'')
  replaces=('koffice-kexi' 'koffice-kexi-doc' 'calligra-kexi-doc' 'calligra-kex')
  install=calligra.install

  cd build/kexi
  make DESTDIR="${pkgdir}" install
  cd ../doc/kexi
  make DESTDIR="${pkgdir}" install
}

package_calligra-plan-git() {
  pkgdesc="Calligra Project Management Component"
  depends=('calligra-words-git')
  conflicts=('koffice-kplato' 'calligra-kplato' 'calligra-plan')
  replaces=('koffice-kplato' 'calligra-kplato' 'calligra-plan')
  install=calligra.install

  cd build/plan
  make DESTDIR="${pkgdir}" install

  cd ../3rdparty/kdgantt
  make DESTDIR="${pkgdir}" install
}

package_calligra-stage-git() {
  pkgdesc="Write presentation documents"
  depends=('calligra-plugins-git' 'kdebase-runtime')
  conflicts=('koffice-kpresenter' 'koffice-kpresenter-doc' 'calligra-stage-doc' 'calligra-stage')
  replaces=('koffice-kpresenter' 'koffice-kpresenter-doc' 'calligra-stage-doc' 'calligra-stage')
  install=calligra.install

  cd build/stage
  make DESTDIR="${pkgdir}" install
  cd ../doc/stage
  make DESTDIR="${pkgdir}" install
}

package_calligra-krita-git() {
  pkgdesc="Edit and paint images"
  depends=('calligra-plugins-git' 'kdebase-runtime' 'opencolorio' 'libkdcraw'
           'fftw' 'glew')
  conflicts=('koffice-krita' 'calligra-krita-doc' )
  replaces=('koffice-krita' 'calligra-krita-doc' )
  install=calligra.install

  cd build/krita
  make DESTDIR="${pkgdir}" install
}

package_calligra-sheets-git() {
  pkgdesc="Write spreadsheet documents"
  depends=('calligra-libs-git' 'gsl' 'kdebase-runtime')
  optdepends=('calligra-filters-git: import/export filters'
              'calligra-plugins: extra calligra plugins'
              'calligra-extras: extra calligra tools')
  conflicts=('koffice-kspread' 'koffice-kspread-doc' 'calligra-tables-doc' 'calligra-tables' 'calligra-sheets')
  replaces=('koffice-kspread' 'koffice-kspread-doc' 'calligra-tables-doc' 'calligra-tables' 'calligra-sheets')
  install=calligra.install

  cd build/sheets
  make DESTDIR="${pkgdir}" install
  cd ../doc/sheets
  make DESTDIR="${pkgdir}" install
}

package_calligra-words-git() {
  pkgdesc="Word Processor"
  depends=('calligra-plugins-git' 'kdegraphics-okular')
  optdepends=('calligra-extras: extra calligra tools')
  conflicts=('koffice-kword' 'calligra-words')
  replaces=('koffice-kword' 'calligra-words')
  install=calligra.install

  cd build/words
  make DESTDIR="${pkgdir}" install
}

package_calligra-handbook-git() {
  pkgdesc="Documentation for Calligra"
  conflicts=('koffice-handbook' 'calligra-handbook')
  replaces=('koffice-handbook' 'calligra-handbook')
  options=('docs')

  cd build/doc/calligra
  make DESTDIR="${pkgdir}" install
}

package_calligra-braindump-git() {
  pkgdesc="Notes and idea gathering"
  depends=('calligra-libs-git' 'kdebase-runtime')
  conflicts=('calligra-braindump')
  replaces=('calligra-braindump')
  install=calligra.install

  cd build/braindump
  make DESTDIR="${pkgdir}" install
}

package_calligra-flow-git() {
  pkgdesc="Flowchart & Diagram Editing"
  depends=('calligra-words-git')
  optdepends=('calligra-karbon: to export the charts in various formats')
  conflicts=('calligra-flow-doc' 'calligra-flow')
  replaces=('calligra-flow-doc' 'calligra-flow')
  install=calligra.install

  cd build/flow
  make DESTDIR="${pkgdir}" install
}

package_calligra-extras-git() {
  pkgdesc="Calligra suite extras"
  depends=('calligra-libs-git')
  optdepends=('kdegraphics-okular')
  conflicts=('calligra-tools' 'koffice-templates' 'calligra-templats' 'calligra-extras')
  replaces=('calligra-tools' 'koffice-templates' 'calligra-templats' 'calligra-extras')
  install=calligra.install

  cd build/extras
  make DESTDIR="${pkgdir}" install

  cd ../data
  make DESTDIR="${pkgdir}" install
}

package_calligra-devtools-git() {
  pkgdesc="Calligra developer tools"
  depends=('calligra-libs-git')
  conflicts=('calligra-devtools')
  replaces=('calligra-devtools')
  cd build/devtools
  make DESTDIR="${pkgdir}" install
}

package_calligra-gemini-git() {
  pkgdesc="QML interface for Calligra Words and Stage"
  depends=('calligra-words-git' 'calligra-stage-git')
  install=calligra.install
  conflicts=('calligra-gemini')
  replaces=('calligra-gemini')
  cd build/qtquick
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"/build/gemini
  make DESTDIR="${pkgdir}" install
}
