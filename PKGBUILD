pkgname=fontforge-git
pkgver=20190801.r29.gf40e1fbc5
pkgrel=1
epoch=1

pkgdesc='Full-featured outline and bitmap font editor.'
url='https://fontforge.github.io/'
arch=('i686' 'x86_64')
license=('GPL3' 'BSD')

depends=('libxkbui' 'libxi' 'pango' 'giflib' 'libltdl' 'libspiro' 'desktop-file-utils'
         'gtk-update-icon-cache' 'libuninameslist' 'gc' 'python' 'shared-mime-info'
         'zeromq')
makedepends=('git' 'cmake' 'ninja')

provides=('fontforge')
conflicts=('fontforge')

source=('git://github.com/fontforge/fontforge.git')

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
        -D"CMAKE_INSTALL_PREFIX:PATH=/usr" \
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
