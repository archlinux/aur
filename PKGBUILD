# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: ccat3z <c0ldcat3z@gmail.com>

pkgname=miktex-git
_pkgname=miktex
pkgver=24.4.r9.07fb41ff2
pkgrel=1
pkgdesc="A distribution of the TeX/LaTeX typesetting system"
arch=('x86_64')
url="https://miktex.org"
license=('custom')
depends=('apr' 'boost-libs' 'apr-util' 'bzip2' 'cairo' 'expat' 'fontconfig'
         'freetype2' 'fribidi' 'gd' 'gmp' 'graphite' 'harfbuzz-icu' 'hunspell'
         'icu' 'libjpeg' 'log4cxx' 'xz' 'mpfr' 'libmspack' 'openssl' 'pixman'
         'libpng' 'poppler' 'popt' 'potrace' 'uriparser' 'hicolor-icon-theme'
         'zziplib' 'poppler-qt6' 'qt6-declarative' 'qt6-5compat' 'mpfi')
makedepends=('git' 'cmake' 'coreutils' 'fop' 'sed' 'libxslt' 'qt6-tools' 'boost')
_pkgsrc="$_pkgname"
source=("$_pkgsrc::git+https://github.com/MiKTeX/miktex.git")
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
    cd "$_pkgsrc"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/$_pkgsrc"

    find . -name "*.h"   -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +
    find . -name "*.cpp" -exec sed -i 's|log4cxx/rollingfileappender.h|log4cxx/rolling/rollingfileappender.h|g' {} +

    cp cmake/modules/FindPOPPLER_QT5.cmake cmake/modules/FindPOPPLER_QT6.cmake
    sed -i 's/QT5/QT6/g' cmake/modules/FindPOPPLER_QT6.cmake
    sed -i 's/qt5/qt6/g' cmake/modules/FindPOPPLER_QT6.cmake
}

build() {
    cd "$srcdir/$_pkgsrc"
    [ -d build ] || mkdir build
    cd build

    local _cmake_options=(
        -DCMAKE_INSTALL_PREFIX=/opt/miktex
        -DWITH_UI_QT=ON
        -DUSE_SYSTEM_POPPLER=TRUE
        -DUSE_SYSTEM_POPPLER_QT=TRUE
        -S "$srcdir/$_pkgsrc"
        -B "$srcdir/$_pkgsrc/build"
        -Wno-dev
    )

    cmake "${_cmake_options[@]}"
    make -j$(nproc)
}

package() {
    cd "$srcdir/$_pkgsrc/build"
    make DESTDIR="$pkgdir/" install

    cd "$pkgdir"
    install -Dm644 opt/miktex/share/applications/miktex-console.desktop usr/share/applications/miktex-console.desktop
    sed -i 's/^Exec=miktex-console$/Exec=\/opt\/miktex\/bin\/miktex-console/' usr/share/applications/miktex-console.desktop
    cp -R opt/miktex/share/applications/icons usr/share/
    mv opt/miktex/man usr/share/man
}
