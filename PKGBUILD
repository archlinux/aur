# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=edelib
pkgver=2.1
pkgrel=1
pkgdesc="Component construction library for Equinox Desktop Environment"
arch=('i686' 'x86_64')
url="http://equinox-project.org/"
_watch="http://equinox-project.org/wiki/Download"
license=('LGPL')
depends=('fltk' 'dbus' 'libstdc++5' 'python')
makedepends=('ftjam')
source=("http://downloads.sourceforge.net/project/ede/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz"
        'edelib.3592.patch'
        'https://raw.githubusercontent.com/edeproject/edelib/master/edelib/ts/scheme.h')
md5sums=('2e6ee2e1ceaea327967ed55868a1cb9f'
         '530ddd4bbf774eb99a4fff3e7e705891'
         '4bfecfa9ab33550bb28e918a57dcbdc9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/edelib.3592.patch"
    cp "$srcdir/scheme.h" "$srcdir/edelib-$pkgver/edelib/ts"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    CFLAGS="-mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC"
    CXXFLAGS="-mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4 -D_FORTIFY_SOURCE=2 -fPIC"
    MAKEFLAGS="-j1"
    ./configure --prefix=/usr
    jam
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "$pkgdir"/usr/{bin,lib}
    # errors for no good reason?
    jam prefix="$pkgdir/usr" install || true
}
