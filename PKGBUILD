# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Leslie P. Polzer <polzer@stardawn.org>
# Contributor: RaxG

pkgname=ede
pkgver=2.1
pkgrel=1
pkgdesc="The lightweight Equinox Desktop Environment"
arch=('i686' 'x86_64')
url="http://equinox-project.org/"
_watch="http://equinox-project.org/wiki/Download"
license=('LGPL')
depends=('edelib')
provides=('pekwm')
conflicts=('pekwm')
makedepends=('ftjam' 'asciidoc')
source=(http://downloads.sourceforge.net/project/ede/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('232300328557a75ad2aef5fdc064002e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python$|/usr/bin/env python2|'
    CFLAGS="-mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC"
    CXXFLAGS="-mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC"
    MAKEFLAGS="-j1"
    ./autogen.sh
    ./configure --prefix=/usr
    # http://sourceforge.net/projects/ede/forums/forum/249616/topic/5288645
    sed -i '15i unset XDG_{DATA,CONFIG,CACHE,MENUS}_{HOME,DIRS,PREFIX}' data/startede
    # jam is weird, likes to error
    jam || true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    jam prefix="$pkgdir/usr" install || true
    # use official pekwm eventually
    #rm -rf "$pkgdir/usr/etc/pekwm"
    #rm -rf "$pkgdir/usr/bin/pekwm"
    #rm -rf "$pkgdir/usr/share/pekwm"
}
