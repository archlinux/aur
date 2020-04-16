pkgname=fontforge-git
pkgver=20190801.r246.gf28b9e6b5
pkgrel=1
epoch=1

pkgdesc='Full-featured outline and bitmap font editor.'
url='https://fontforge.github.io/'
arch=('i686' 'x86_64')
license=('GPL3' 'BSD')

depends=('libtool' 'pango' 'giflib' 'libtiff' 'libxml2' 'libspiro' 'python'
         'potrace' 'woff2' 'gtk3' 'libuninameslist')
makedepends=('git' 'cmake' 'ninja')

provides=('fontforge')
conflicts=('fontforge')

source=('git+https://github.com/fontforge/fontforge.git')

sha256sums=('SKIP')

pkgver() {
    cd fontforge
    git describe | sed 's/-/.r/; s/-/./'
}

build() {
    cd fontforge
    rm -rf build
    mkdir build
    cd build
    cmake \
        -G"Ninja" \
	-D"CMAKE_BUILD_TYPE:STRING=Release" \
        -D"CMAKE_INSTALL_PREFIX:PATH=/usr" \
        -D"ENABLE_MAINTAINER_TOOLS:BOOL=TRUE" \
        -D"ENABLE_FONTFORGE_EXTRAS:BOOL=TRUE" \
        -D"UNIX:BOOL=TRUE" \
        ..
    ninja
}

package() {
    cd fontforge/build
    DESTDIR="$pkgdir" ninja install

    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

    # Remove docs if required.  This is roughly 10MiB
    #rm -rf "$pkgdir/usr/share/doc/fontforge"
}
