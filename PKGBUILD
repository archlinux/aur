# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany
pkgname=$_gitname-gtk3-git
pkgver=1.24.1.r925.gcea3473
pkgrel=1
pkgdesc="Fast and lightweight IDE (git version)"
arch=('x86_64' 'i686')
url="https://github.com/$_gitname/$_gitname"
license=('GPL2')
depends=('desktop-file-utils' 'gtk3')
makedepends=('git' 'intltool' 'lua')
optdepends=('vte290: For native terminal')
conflicts=("$_gitname")
provides=("$_gitname=$pkgver")
install="$pkgname.install"
source=($_gitname::git://github.com/$_gitname/$_gitname.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $_gitname

    # Syntax highlighting for PKGBUILD files
    sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
}

build() {
    cd $_gitname
    export CFLAGS="${CFLAGS} -D_FILE_OFFSET_BITS=64"
    ./autogen.sh --enable-gtk3 --disable-html-docs --prefix=/usr
    make
}

check() {
    cd $_gitname
    make check
}
package() {
    cd $_gitname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
