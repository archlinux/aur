# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=luaunbound
pkgver=2016.01.10
pkgrel=1
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound")
makedepends=("mercurial" "unbound" "lua")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}::hg+https://code.zash.se/luaunbound")
sha512sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    # fixed commit
    hg checkout f270a1cf86ce
}

build() {
    cd "$srcdir/$pkgname"
    ./squish.sh > use_unbound.lua
    unset LDFLAGS
    make lunbound.so
}
 
package() {
    cd "$srcdir/$pkgname"
    install -Dm644 use_unbound.lua "$pkgdir/etc/prosody/use_unbound.lua"
    install -Dm755 lunbound.so "$pkgdir/usr/lib/prosody/util/lunbound.so"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
