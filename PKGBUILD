# Maintainer: osch <oliver@luced.de>

_rockname=cipher
pkgname=lua-$_rockname
pkgver=0.0.1
pkgrel=1
_rockrel=1
pkgdesc="AES, RC4, ChaCha20 and DES ciphers for Lua strings and carrays (cipher.aes, cipher.rc4, cipher.chacha20, cipher.des)"
arch=('x86_64' 'aarch64')
url="https://github.com/osch/lua-$_rockname"
license=('MIT')
depends=('lua')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osch/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('520f9dd9a6823f621b3e00213b4b4c7fce4e62cb7c86edb26f8135633c02699d')

package() {
    cd "lua-$_rockname-$pkgver"
    local luaver spec
    luaver=$(lua -e 'io.write(_VERSION:match("%d+%.%d+"))')
    # one rockspec per C module, then the meta rock (the pure Lua module
    # `cipher`, which loads them on demand); the rocks' dependencies are the
    # other modules of this package
    for spec in cipher.aes cipher.rc4 cipher.chacha20 cipher.des cipher; do
        luarocks --lua-version "$luaver" --tree="$pkgdir/usr" make --deps-mode none \
            "rockspecs/$spec-$pkgver-$_rockrel.rockspec"
    done
    # the rock manifest and its copies of the docs are not part of a package
    rm -rf "$pkgdir/usr/lib/luarocks"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
