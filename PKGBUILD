# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany
_gitnameplug=geany-plugins
pkgname=geany-gtk3-git
pkgver=1.24.1.287.gd2ce3d6
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="https://github.com/b4n/geany/tree/wip/gtk3-support"
license=('GPL2')

depends=('desktop-file-utils' 'gtk3')
makedepends=('git' 'automake' 'autoconf' 'intltool' 'libtool' 'lua')
conflicts=('geany')
provides=('geany')
install='geany-gtk3-git.install'
source=('git://github.com/geany/geany.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "$srcdir/$_gitname"

    # Syntax highlighting for PKGBUILD files
    sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
}

build() {
    cd "$srcdir/$_gitname"
	export CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64"
    ./autogen.sh --enable-gtk3 --disable-html-docs --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
