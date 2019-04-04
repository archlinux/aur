pkgname=fontforge-git
pkgver=20150824.r32.geda9fc9
pkgrel=1
epoch=1

pkgdesc='Full-featured outline and bitmap font editor.'
url='https://fontforge.github.io/'
arch=('i686' 'x86_64')
license=('GPL3' 'BSD')

depends=('libxkbui' 'libxi' 'pango' 'giflib' 'libltdl' 'libspiro' 'desktop-file-utils'
         'gtk-update-icon-cache' 'libuninameslist' 'gc' 'python' 'shared-mime-info'
         'zeromq')
makedepends=('git')

provides=('fontforge')
conflicts=('fontforge')

install='fontforge-git.install'

source=('git://github.com/fontforge/fontforge.git'
        'http://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.bz2')

sha256sums=('SKIP'
            '2f6e9a7de3ae8e85bdd2fe237e27d868d3ba7a27495e65906455c27722dd1a17')

pkgver() {
    cd fontforge
    git describe | sed 's/-/.r/; s/-/./'
}

build() {
    cd fontforge
    ./bootstrap
    ./configure \
        --with-x \
        --prefix=/usr \
        --enable-shared \
        --enable-gtk2-use \
        --mandir=/usr/share/man \
        --with-freetype-source="$srcdir"/freetype-2.6.1
    make
}

package() {
    cd fontforge
    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    install -Dm644 desktop/fontforge.desktop "$pkgdir"/usr/share/applications/fontforge.desktop

    # Remove unneeded osx binaries
    rm -rf "$pkgdir"/usr/share/fontforge/osx

    # Remove docs if required.  This is roughly 10MiB
    #rm -rf "$pkgdir/usr/share/doc/fontforge"
}
