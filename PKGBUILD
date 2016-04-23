# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=luaunbound-hg
pkgver=r180.f270a1cf86ce
pkgrel=2
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound")
conflicts=("luaunbound")
provides=("luaunbound")
makedepends=("mercurial" "unbound" "lua")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}::hg+https://code.zash.se/luaunbound")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
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
