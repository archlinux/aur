# Maintainer: mickele <mimocciola[at]yahoo[dot]com>
pkgname=ifcplusplus-git
pkgver=0.r161.g73d0b99
pkgrel=1
pkgdesc="Port of IfcPlusPlus on linux. IfcPlusPlus is an open source C++ class model, as well as a reader and writer for IFC files in STEP format."
url="https://github.com/berndhahnebach/IfcPlusPlus"
arch=('x86_64' 'i686')
license=('custom:OSGPL')
depends=('openscenegraph' 'boost-libs' 'qt5-base')
optdepends=()
makedepends=('boost' 'chrpath')
conflicts=()
replaces=()
backup=()
source=('IfcPlusPlus::git://github.com/berndhahnebach/IfcPlusPlus.git' 'qt5.patch' 'osg340.patch')

pkgver() {
  cd IfcPlusPlus

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  cd "${srcdir}/IfcPlusPlus"
  patch -Np1 -i "${srcdir}/qt5.patch"
  patch -Np1 -i "${srcdir}/osg340.patch"
}

build() {
  cd "${srcdir}/IfcPlusPlus"
  cmake ./ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package() {
  cd "${srcdir}/IfcPlusPlus"
  install -Dm755 Debug/SimpleViewerExample "${pkgdir}"/usr/bin/SimpleIFCViewer
  chrpath -d "${pkgdir}"/usr/bin/SimpleIFCViewer
  install -d "${pkgdir}/usr/lib"
  install -m755 -D Debug/*.so "${pkgdir}/usr/lib"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('SKIP'
         '3df56628d79a15799aede92466db77a3'
         '70c0472dac19f4be7c8984cfcdbe54f2')
