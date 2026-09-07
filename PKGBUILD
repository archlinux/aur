pkgname=ifcplusplus-git
pkgver=2.5.r28.g964fa6008
pkgrel=2
pkgdesc="IFC++ is an open source C++ class model, as well as a reader and writer for IFC files in STEP format."
url="http://www.ifcquery.com/"
arch=('x86_64')
license=('MIT')
depends=('openscenegraph' 'boost-libs' 'qt6-base' 'onetbb')
optdepends=()
makedepends=('cmake' 'boost' 'onetbb')
provides=('IFC++')
conflicts=()
replaces=()
backup=()
source=('git+https://github.com/ifcquery/ifcplusplus.git'
        '001-build-fixes.patch')
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
  patch -Np1 -i "${srcdir}/001-build-fixes.patch"
}

build() {
  cd "${srcdir}/${clonefolder}"
  cmake ./ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_VIEWER_APPLICATION=ON \
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DCMAKE_CXX_FLAGS="-DQT_NO_EMIT -ffile-prefix-map=${srcdir}=." \
      -DCMAKE_SKIP_BUILD_RPATH=ON \
      -DCMAKE_EXE_LINKER_FLAGS=-ltbb \
      -DCMAKE_SHARED_LINKER_FLAGS=-ltbb
  make
}

package() {
  cd "${srcdir}/${clonefolder}"
  install -Dm755 Release/SimpleViewerExampleQt "${pkgdir}"/usr/bin/SimpleIFCViewer
  install -d "${pkgdir}/usr/lib"
  install -m755 -D Release/*.so "${pkgdir}/usr/lib"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('SKIP' 'SKIP')
