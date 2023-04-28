# Maintainer: ccat3z <c0ldcat3z@gmail.com>

pkgname=miktex-git
pkgver=23.4.r0.176302357
pkgrel=1
pkgdesc="a distribution of the TeX/LaTeX typesetting system"
arch=('x86_64')
url="https://miktex.org"
license=('custom')
depends=('apr' 'boost-libs' 'apr-util' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2'
         'fribidi' 'gd' 'gmp' 'graphite' 'harfbuzz-icu' 'hunspell' 'icu'
         'libjpeg' 'log4cxx' 'xz' 'mpfr' 'libmspack' 'openssl' 'pixman' 'libpng'
         'poppler' 'popt' 'potrace' 'uriparser' 'hicolor-icon-theme' 'zziplib' 'poppler-qt5' 'qt5-script' 'qt5-declarative')
makedepends=('cmake' 'coreutils' 'fop' 'sed' 'libxslt' 'qt5-tools'  'boost')
source=('miktex::git+https://github.com/MiKTeX/miktex.git')
provides=(miktex texlive-bin)
conflicts=(miktex texlive-bin)
md5sums=('SKIP')
options=('!buildflags')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"	
    [ -d build ] || mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/opt/miktex -DWITH_UI_QT=ON \
        -DUSE_SYSTEM_POPPLER=TRUE -DUSE_SYSTEM_POPPLER_QT=TRUE \
        -DUSE_SYSTEM_LOG4CXX=FALSE ..
}

build() {
    cd "$srcdir/${pkgname%-git}/build"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    
    cd $pkgdir

    install -Dm644 opt/miktex/share/applications/miktex-console.desktop usr/share/applications/miktex-console.desktop
    sed -i 's/^Exec=miktex-console$/Exec=\/opt\/miktex\/bin\/miktex-console/' usr/share/applications/miktex-console.desktop
    cp -R opt/miktex/share/applications/icons usr/share/

    mv opt/miktex/man usr/share/man
}
