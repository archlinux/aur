# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: jhass <me@jhass.eu>
pkgname=luaunbound
pkgver=2016.01.10
pkgrel=3
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound")
makedepends=("mercurial" "unbound" "lua")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}::hg+https://code.zash.se/luaunbound" "use_cc.patch")
sha512sums=('SKIP'
            '6b11dfe9f5de743f101463fb3fb2144fe3aff75e7e19036f67d0e0b8adc8c36db73cf73d0aba483d651f8f5b2773093adc27e788354b165314c777e8de45bf28')

prepare() {
    cd "$srcdir/$pkgname"
    # fixed commit
    hg checkout f270a1cf86ce
    patch -p1 < "$srcdir/use_cc.patch"
}

build() {
    cd "$srcdir/$pkgname"
    make all
}
 
package() {
    cd "$srcdir/$pkgname"
    install -Dm644 use_unbound.lua "$pkgdir/etc/prosody/use_unbound.lua"
    install -Dm755 lunbound.so "$pkgdir/usr/lib/prosody/util/lunbound.so"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
