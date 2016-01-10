pkgbase=calligra-git
pkgname=('calligra-braindump-git'
         'calligra-devtools-git'
         'calligra-extras-git'
         'calligra-filters-git'
#         'calligra-flow-git'
#         'calligra-handbook-git'
         'calligra-karbon-git'
         'calligra-libs-git'
         'calligra-plan-git'
         'calligra-plugins-git'
         'calligra-sheets-git'
         'calligra-stage-git'
         'calligra-words-git'
         'calligra-gemini-git')
pkgver=r99515.ae439d4
pkgrel=1
arch=('i686' 'x86_64')
license=('FDL1.2' 'GPL2' 'LGPL')
url='http://www.calligra-suite.org/'
makedepends=('khtml' 'kross' 'kreport-git' 'kproperty-git' 'kdiagram-git' 'okular-frameworks-git' 'kxmlgui' 'qt5-webkit' 
             'kdelibs4support' 'poppler' 'qca-qt5' 'libvisio' 'libetonyek' 'kactivities' 'kio' 'ilmbase' 'lcms2'  'kxmlgui'
             'marble' 'kcalcore' 'akonadi-contact' 'knotifyconfig' 'okular-frameworks-git' 'poppler-qt5' 'qt5-quick1' 'libodfgen' 'threadweaver')
groups=('calligra-git')
source=('calligra::git+git://anongit.kde.org/calligra')
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
  cmake  ../calligra -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DLIB_INSTALL_DIR=lib \
      -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
      -DBUILD_TESTING=OFF  -Wno-dev 
  make    
}

package_calligra-filters-git() {
  pkgdesc="Filters for the Calligra office suite"
  depends=('kdelibs4support' 'poppler' 'qca-qt5' 'khtml' 'libodfgen')
  optdepends=('libvisio: Microsoft Visio import filter'
              'libetonyek: Apple Keynote import filter')
  conflicts=('koffice-filters' 'calligra-filters')
  replaces=('koffice-filters' 'calligra-filters')
  install=calligra.install

  cd build/filters
  make DESTDIR="${pkgdir}" install
}

package_calligra-libs-git() {
  pkgdesc="Libraries for the Calligra office suite"
  depends=('kactivities' 'qca-qt5' 'ilmbase')
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
  depends=('calligra-libs-git' 'calligra-filters-git' 'kio' 'kdiagram-git' 'ilmbase' 'lcms2' 'libspnav')
  optdepends=('marble: map shape for Calligra')
  conflicts=('koffice-plugins' 'koffice-kchart' 'calligra-plugins')
  replaces=('koffice-plugins' 'koffice-kchart' 'koffice-kformula' 'calligra-plugins')
  install=calligra.install

  cd build/plugins
  make DESTDIR="${pkgdir}" install
}

package_calligra-karbon-git() {
  pkgdesc="Create scalable vector drawings"
  depends=('calligra-libs-git' 'kxmlgui')
  optdepends=('calligra-filters-git: import/export filters'
              'calligra-extras: extra calligra tools')
  conflicts=('koffice-karbon' 'koffice-karbon-doc' 'calligra-karbon-doc' 'calligra-karbon')
  replaces=('koffice-karbon' 'koffice-karbon-doc' 'calligra-karbon-doc' 'calligra-karbon')
  install=calligra.install

  cd build/karbon
  make DESTDIR="${pkgdir}" install
}

package_calligra-plan-git() {
  pkgdesc="Calligra Project Management Component"
  depends=('calligra-words-git' 'kcalcore' 'kreport-git' 'akonadi-contact' 'khtml' 'kdiagram-git' 'kdelibs4support')
  conflicts=('koffice-kplato' 'calligra-kplato' 'calligra-plan')
  replaces=('koffice-kplato' 'calligra-kplato' 'calligra-plan')
  install=calligra.install

  cd build/plan
  make DESTDIR="${pkgdir}" install
}

package_calligra-stage-git() {
  pkgdesc="Write presentation documents"
  depends=('calligra-plugins-git' 'qt5-webkit' 'kio')
  conflicts=('koffice-kpresenter' 'koffice-kpresenter-doc' 'calligra-stage-doc' 'calligra-stage')
  replaces=('koffice-kpresenter' 'koffice-kpresenter-doc' 'calligra-stage-doc' 'calligra-stage')
  install=calligra.install

  cd build/stage
  make DESTDIR="${pkgdir}" install
}

package_calligra-sheets-git() {
  pkgdesc="Write spreadsheet documents"
  depends=('calligra-libs-git' 'gsl' 'kdelibs4support' 'knotifyconfig')
  optdepends=('calligra-filters-git: import/export filters'
              'calligra-plugins: extra calligra plugins'
              'calligra-extras: extra calligra tools')
  conflicts=('koffice-kspread' 'koffice-kspread-doc' 'calligra-tables-doc' 'calligra-tables' 'calligra-sheets')
  replaces=('koffice-kspread' 'koffice-kspread-doc' 'calligra-tables-doc' 'calligra-tables' 'calligra-sheets')
  install=calligra.install

  cd build/sheets
  make DESTDIR="${pkgdir}" install
}

package_calligra-words-git() {
  pkgdesc="Word Processor"
  depends=('calligra-plugins-git' 'okular-frameworks-git' 'kxmlgui')
  optdepends=('calligra-extras: extra calligra tools')
  conflicts=('koffice-kword' 'calligra-words')
  replaces=('koffice-kword' 'calligra-words')
  install=calligra.install

  cd build/words
  make DESTDIR="${pkgdir}" install
}

# package_calligra-handbook-git() {
#   pkgdesc="Documentation for Calligra"
#   conflicts=('koffice-handbook' 'calligra-handbook')
#   replaces=('koffice-handbook' 'calligra-handbook')
#   options=('docs')
# 
#   cd build/doc/calligra
#   make DESTDIR="${pkgdir}" install
# }

package_calligra-braindump-git() {
  pkgdesc="Notes and idea gathering"
  depends=('calligra-libs-git'  'kxmlgui' 'qt5-webkit')
  conflicts=('calligra-braindump')
  replaces=('calligra-braindump')
  install=calligra.install

  cd build/braindump
  make DESTDIR="${pkgdir}" install
}

# package_calligra-flow-git() {
#   pkgdesc="Flowchart & Diagram Editing"
#   depends=('calligra-words-git')
#   optdepends=('calligra-karbon: to export the charts in various formats')
#   conflicts=('calligra-flow-doc' 'calligra-flow')
#   replaces=('calligra-flow-doc' 'calligra-flow')
#   install=calligra.install
# 
#   cd build/flow
#   make DESTDIR="${pkgdir}" install
# }

package_calligra-extras-git() {
  pkgdesc="Calligra suite extras"
  depends=('calligra-libs-git' 'calligra-words-git' 'okular-frameworks-git')
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
  depends=('calligra-libs-git' 'calligra-words-git' 'calligra-sheets-git' 'poppler-qt5' 'kdelibs4support')
  conflicts=('calligra-devtools')
  replaces=('calligra-devtools')
  cd build/devtools
  make DESTDIR="${pkgdir}" install
}

package_calligra-gemini-git() {
  pkgdesc="QML interface for Calligra Words and Stage"
  depends=('calligra-words-git' 'calligra-stage-git' 'kxmlgui' 'qt5-quick1')
  install=calligra.install
  conflicts=('calligra-gemini')
  replaces=('calligra-gemini')
  cd build/qtquick
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"/build/gemini
  make DESTDIR="${pkgdir}" install
}
