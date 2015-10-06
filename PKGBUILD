# Maintainer: François Garillot <francois[@]garillot.net>

pkgname=drip-git
pkgver=20151006
pkgrel=1
pkgdesc="Drip is a launcher for the Java Virtual Machine that provides much faster startup times than the java command. The drip script is intended to be a drop-in replacement for the java command, only faster."
license="GPL"
url='https://github.com/flatland/drip'
arch=('i686' 'x86_64')
provides=('drip')
conflicts=('drip')
depends=('java-runtime')
makedepends=('git')
options=(!libtool)

_gitroot="git://github.com/flatland/drip.git"
_gitname="drip"

build() {
        cd $srcdir
        msg "Connecting to the GIT server...."

        if [[ -d $srcdir/$_gitname ]] ; then
                cd $_gitname
                git pull origin
                msg "The local files are updated."
        else
                git clone $_gitroot $_gitname
        fi

        msg "GIT checkout done"
        msg "Starting make..."
        rm -rf $srcdir/$pkgname-build
        git clone $srcdir/$_gitname $srcdir/$pkgname-build
        cd $srcdir/$pkgname-build
        make all
}

package() {
        cd $srcdir/$pkgname-build
        install -dm755 "$pkgdir/usr/bin"
        install -Dm755 "$srcdir/$pkgname-build/bin/drip" "$srcdir/$pkgname-build/bin/drip_daemon" "$srcdir/$pkgname-build/bin/drip_proxy" "$pkgdir/usr/bin"
        rm -rf $srcdir/$pkgname-build
}
