# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtimageformats
pkgname="mingw-w64-qt5-imageformats"
pkgver=5.7.0
pkgrel=1
arch=('any')
pkgdesc="Plugins for additional image formats: TIFF, MNG, TGA, WBMP (mingw-w64)"
depends=('mingw-w64-qt5-base')
# these dependencies will enable further functionality
#depends+=('mingw-w64-jasper') # for JPEG-2000 Part-1
#depends+=('mingw-w64-libmng') # for MNG
#depends+=('mingw-w64-libwebp') # for WebP
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('50e4086be4f1f8a0897f1ed8e1a00f09')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make

    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT="${pkgdir}" install

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/qt/plugins/imageformats/"*.dll

    popd
  done
}
