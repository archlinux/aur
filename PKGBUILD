# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

_qt_module=qttools
pkgname="mingw-w64-qt5-tools"
pkgver=5.4.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtTools module (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-glib2')  # glib2 can be removed once qt5-base has it in depends
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('2949a16131b54169119d1a14b891a10b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    
    # Something is messed up with Qt5Bootstrap
    make qmake_all
    
    find ./src -type f -exec sed -i "s|-L/usr/${_arch}/lib -lQt5Bootstrap|/usr/lib/libstdc++.so.6 -L/usr/${_arch}/lib -lQt5Bootstrap|g" {} \;
    find ./src -type f -exec sed -i "s|-L/usr/${_arch}/lib -lQt5QmlDevTools|/usr/lib/libstdc++.so.6 -L/usr/${_arch}/lib -lQt5QmlDevTools|g" {} \;
    make

    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT="${pkgdir}" install

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll

    # Make sure the executables don't conflict with their mingw-qt4 counterpart
    for fn in "${pkgdir}/usr/${_arch}/bin/"*.exe ; do
      fn_new=$(echo $fn | sed s/'.exe$'/'-qt5.exe'/)
      mv $fn $fn_new
    done

    # Symlink lrelease to /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    for tool in lconvert lupdate lrelease; do
      ln -s ../${_arch}/lib/qt/bin/${tool} "${pkgdir}/usr/bin/${_arch}-$tool-qt5"
    done
      
    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a

    popd
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
