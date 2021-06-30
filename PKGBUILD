pkgname=mingw-w64-qwt-qt6
pkgver=6.2.0
pkgrel=1
pkgdesc="Qt Widgets for Technical Applications (mingw-w64)"
arch=('any')
license=('custom:qwt')
url="http://qwt.sourceforge.net"
depends=('mingw-w64-qt6-svg')
makedepends=('mingw-w64-gcc' 'qt6-base')
options=('staticlibs' '!strip' '!buildflags')
#source=("http://downloads.sourceforge.net/qwt/qwt-beta/6.2.0-rc2/qwt-6.2-rc2.tar.bz2")
#sha256sums=('2dc29d4bacae63e57732857eb4b18b8ac9a451c072817cbc1ee572ef4872f0ec')
source=("qwt-6.2-rc2::git+https://github.com/xantares/qwt-cmake.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qwt-6.2-rc2
  # Build release only
  sed -i 's|+= debug_and_release|+= release|' qwtbuild.pri
  sed -i '/+= build_all/d' qwtbuild.pri

  # No designer plugin:
  sed -i 's|+= QwtDesigner|-= QwtDesigner|' qwtconfig.pri

  # Make install locations consistent with Arch's native Qwt:
  sed -i 's|$${QWT_INSTALL_PREFIX}/doc|$${QWT_INSTALL_PREFIX}/share/doc/qwt|' qwtconfig.pri
  sed -i 's|$${QWT_INSTALL_PREFIX}/include|$${QWT_INSTALL_PREFIX}/include/qwt|' qwtconfig.pri

  # No need for docs:
  sed -i "s|= target doc|= target|" src/src.pro
}

build() {
  cd qwt-6.2-rc2
  for _arch in ${_architectures}; do
    #export QTDIR=/usr/${_arch}/lib/qt6
    #export PATH=${QTDIR}/bin:${PATH}
    #export QMAKESPEC=${QTDIR}/mkspecs/win32-g++

    #mkdir -p "${srcdir}/qwt-build-${_arch}"
    #cd "${srcdir}"
    #rm -rf qwt-build-${_arch}
    #cp -r "qwt-6.2-rc2" qwt-build-${_arch}
    #cd qwt-build-${_arch}

    # This is a mingw build, so Windows prefix is used. Let's change it:
    #sed -i "s|C:/Qwt-\$\$QWT_VERSION|/usr/${_arch}|" qwtconfig.pri

    #${QTDIR}/bin/qmake qwt.pro
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DUSE_QT6=ON ..
    make
    popd
  done
}

package() {

  for _target in ${_architectures}; do

    #cd "${srcdir}/qwt-build-${_target}/qwt-6.2-rc2"
    cd "${srcdir}/qwt-6.2-rc2/build-${_target}"
    make install DESTDIR="${pkgdir}" 
    #make INSTALL_ROOT=${pkgdir} QTDIR=/usr/${_target}/ install

    #install -m644 src/qwt_axis_id.h "$pkgdir"/usr/${_target}/include

    #cd "${pkgdir}/usr/${_target}"

    # Move DLLs from lib to bin
   # mkdir -p bin
   # mv lib/*.dll bin/
    ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
    ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
    # Move features to share/qt/mkspecs
    #rm -rf "$pkgdir"/usr/${_target}/share
    #mkdir -p lib/qt/mkspecs
    #mv features lib/qt/mkspecs
  done
}
