pkgname=ifcplusplus-git
pkgver=0.r278.g938d8523
pkgrel=1
pkgdesc="IFC++ is an open source C++ class model, as well as a reader and writer for IFC files in STEP format."
url="http://www.ifcquery.com/"
arch=('x86_64')
license=('MIT')
depends=('openscenegraph' 'boost-libs' 'qt5-base')
optdepends=()
makedepends=('cmake' 'boost' 'chrpath')
provides=('IFC++')
conflicts=()
replaces=()
backup=()
source=('git://github.com/berndhahnebach/ifcplusplus.git')
clonefolder='ifcplusplus'

pkgver() {
  cd ${clonefolder}

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  cd "${srcdir}/${clonefolder}"
}

build() {
  cd "${srcdir}/${clonefolder}"
  cmake ./ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -OSGDB_LIBRARY_DEBUG=/usr/lib
  make
}

package() {
  cd "${srcdir}/${clonefolder}"
  install -Dm755 Release/SimpleViewerExample "${pkgdir}"/usr/bin/SimpleIFCViewer
  chrpath -d "${pkgdir}"/usr/bin/SimpleIFCViewer
  install -d "${pkgdir}/usr/lib"
  install -m755 -D Release/*.so "${pkgdir}/usr/lib"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('SKIP')
