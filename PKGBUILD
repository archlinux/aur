# Maintainer : Dr-Shadow <xxdrshadowxx@gmail.com>
# Contributor: lastmikoi <lastmikoi at gmail dot com>

pkgname=netsoul-purple-git
pkgver=20141208
pkgrel=3
pkgdesc="Protocol Plugin (prpl) for libpurple, this plugin provide netsoul IM protocol"
url="https://github.com/Dr-Shadow/netsoul-purple"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libpurple')
provides=('netsoul-purple')
conflicts=('netsoul-purple')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/Dr-Shadow/netsoul-purple.git"
_gitname="netsoul-purple"

build() {
    cd "${srcdir}"
    msg "Retrieving current git shallow HEAD"

    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "Local copy updated"
    else
        git clone $_gitroot $_gitname --depth=1
        cd "$srcdir/$_gitname"
        git checkout
    fi

    msg "Retrieving finished"
    rm -rf "$srcdir/$_gitname-build"
    mkdir "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname" && ls -A | grep -v .git | xargs -d '\n' cp -r -t "$srcdir/$_gitname-build" # do not copy over the .git folder

    cd "$srcdir/$_gitname-build"
    ./autogen.sh
    ./configure --prefix=/usr

    make
}

package() {
    cd "${srcdir}/$_gitname-build"
    make DESTDIR="${pkgdir}" install
    libtool --finish /usr/lib/purple-2
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    rm -rf $(find "$pkgdir" -type d -name ".git")
}

# vim:set ts=2 sw=2 et:
