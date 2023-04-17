# Maintainer: ccat3z <c0ldcat3z@gmail.com>
# Maintainer: heavysink <winstonwu91 at gmail>
# Maintainer: trance233 <trance233@outlook.com>

pkgname=miktex-fix
_pkgname=miktex
pkgver=23.4
pkgrel=1
pkgdesc="a distribution of the TeX/LaTeX typesetting system(Fix the issue of command not found)"
arch=('x86_64')
url="https://miktex.org"
license=('custom')
depends=('apr' 'boost-libs' 'apr-util' 'bzip2' 'cairo' 'expat' 'fontconfig' 'freetype2'
         'fribidi' 'gd' 'gmp' 'graphite' 'harfbuzz-icu' 'hunspell' 'icu'
         'libjpeg' 'log4cxx<=0.13.0' 'xz' 'mpfr' 'libmspack' 'openssl' 'pixman' 'libpng'
         'poppler' 'popt' 'potrace' 'uriparser' 'hicolor-icon-theme' 'zziplib' 'poppler-qt5' 'qt5-script' 'qt5-declarative')
makedepends=('cmake' 'coreutils' 'fop' 'sed' 'libxslt' 'qt5-tools' 'boost')
source=("https://github.com/MiKTeX/miktex/archive/${pkgver}.tar.gz")
provides=(miktex texlive-bin)
conflicts=(miktex texlive-bin)
md5sums=('85010ca98be292b849cb93b73a92ffd0')
options=('!buildflags')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/opt/miktex -DWITH_UI_QT=ON -DUSE_SYSTEM_POPPLER=TRUE -DUSE_SYSTEM_POPPLER_QT=TRUE -S "$srcdir/$_pkgname-$pkgver" -B "$srcdir/$_pkgname-$pkgver/build"
    make -C "$srcdir/$_pkgname-$pkgver/build" -j2
}

package() {
    make -C "$srcdir/$_pkgname-$pkgver/build" install DESTDIR="$pkgdir/"
    
    mkdir -p "$pkgdir/usr/bin"
    find "$pkgdir/opt/miktex/bin/" -type f -exec chmod 755 {} \;
    find "$pkgdir/opt/miktex/bin/" -type f -exec basename {} \; | xargs -i ln -s /opt/miktex/bin/{} "$pkgdir/usr/bin/"
    install -Dm644 "$pkgdir/opt/miktex/share/applications/miktex-console.desktop" "$pkgdir/usr/share/applications/miktex-console.desktop"
    cp -R "$pkgdir/opt/miktex/share/applications/icons" "$pkgdir/usr/share/"
    find "$pkgdir/usr/share/icons" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} \;
    mv "$pkgdir/opt/miktex/man" "$pkgdir/usr/share/man"
    find "$pkgdir/usr/share/man" -type d -exec chmod 755 {} \;
    find "$pkgdir/usr/share/man" -type f -exec chmod 644 {} \;
}
