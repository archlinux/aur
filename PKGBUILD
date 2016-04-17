# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qttools
pkgname="mingw-w64-qt5-tools"
pkgver=5.6.0
pkgrel=2
arch=('any')
pkgdesc="A cross-platform application and UI framework (Development Tools, QtHelp; mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'mingw-w64-qt5-declarative')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('5dd6204df7c81c684607f2fc8a5d351a')

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
