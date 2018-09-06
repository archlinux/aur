# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: jhass <me@jhass.eu>
pkgname=luaunbound
pkgver=1.7.3
epoch=1
pkgrel=1
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound" "expat")
makedepends=("mercurial" "unbound" "lua" "libxslt" "ccache")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NLnetLabs/unbound/archive/release-${pkgver}.tar.gz" "use_cc.patch")
sha512sums=('ec25b1617a83e543ef61e10f01741af61e9af671c2d585b3953e17140c36f4defa46cee6bb0e588a3e65404a8ddc86b08f015037d91b92ba8a5bb3d13274018a'
            '6b11dfe9f5de743f101463fb3fb2144fe3aff75e7e19036f67d0e0b8adc8c36db73cf73d0aba483d651f8f5b2773093adc27e788354b165314c777e8de45bf28')

prepare() {
    cd "$srcdir/unbound-release-$pkgver"
    #patch -p1 < "$srcdir/use_cc.patch"
}

build() {
    cd "$srcdir/unbound-release-$pkgver"
    ./configure --enable-pie
    make
}
 
package() {
    cd "$srcdir/unbound-release-$pkgver"
    make DESTDIR="$pkgdir" \
         prefix="/usr" \
         exec_prefix="/usr" \
         configfile="/etc/unbound/unbound.conf" \
         sbindir="/usr/bin" \
         install
    install -Dm644 doc/README "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
