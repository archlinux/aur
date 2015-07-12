# Maintainer: Christer Stenbrenden <christer.stenbrenden@gmail.com>

pkgname=mdbus2
pkgver=2.3.0
pkgrel=2
epoch=1
pkgdesc='DBus introspection command utility'
url='http://www.freesmartphone.org/'
license=('GPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
makedepends=('vala')
depends=('dbus-glib')

_gitroot="git://anonscm.debian.org/pkg-fso/mdbus.git"
_gitname="mdbus"

build() {
	cd $srcdir
    
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin || return 1
    else
        git clone $_gitroot || return 1
    fi

    rm -rf $srcdir/$_gitname-build
    git clone $srcdir/$_gitname $srcdir/$_gitname-build

    cd $srcdir/$_gitname-build
    git checkout -b v2.3.0 upstream/2.3.0

    sed -e 's/valac/valac-0.12/' configure.ac > configure.ac.new
    mv configure.ac.new configure.ac
	./configure --prefix=/usr --enable-vala
	make
}

package() {
	cd $srcdir/$_gitname-build
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
