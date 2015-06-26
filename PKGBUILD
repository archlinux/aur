# Maintainer: Benoit Favre <benoit.favre@gmail.com>
# TODO: change to original project when pull requests applied
pkgname=openlat-git
pkgver=20120524
pkgrel=1
pkgdesc="Toolkit for manipulating word lattices built on top of openfst"
arch=(i686 x86_64)
#url="https://github.com/valabau/openlat"
url="https://github.com/benob/openlat"
license=('Apache')
depends=('openfst')
makedepends=('git' 'bison' 'flex')
optdepends=('boost: support for gz/bz2 input filters')
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/benob/openlat.git"
_gitname="openlat"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    #
    # BUILD HERE
    #

    sh autogen.sh
    ./configure --prefix=/usr LDFLAGS="-Wl,--no-as-needed"
    make
}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
} 
