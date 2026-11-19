# Maintainer: osch <oliver@luced.de>

_rockname=compress
pkgname=lua-$_rockname
pkgver=0.0.1
pkgrel=1
_rockrel=1
pkgdesc="zlib, brotli, lzma and bzip2 compression for Lua strings and carrays (compress.zlib, compress.brotli, compress.lzma, compress.bzip2)"
arch=('x86_64' 'aarch64')
url="https://github.com/osch/lua-$_rockname"
license=('MIT')
depends=('lua' 'zlib' 'brotli' 'xz' 'bzip2')
makedepends=('luarocks')
source=("$pkgname-$pkgver.tar.gz::https://github.com/osch/lua-$_rockname/archive/v$pkgver.tar.gz")
sha256sums=('581b4fd071575c91959d9d0a53b036d594775a66f96f1c4fc96de60ba08a2596')

package() {
    cd "lua-$_rockname-$pkgver"
    local luaver spec
    luaver=$(lua -e 'io.write(_VERSION:match("%d+%.%d+"))')
    # one rockspec per C module against the system libraries, then the
    # meta rock (the pure Lua module `compress`, which loads them on demand);
    # the rocks' dependencies are the other modules of this package
    for spec in compress.zlib compress.brotli compress.lzma compress.bzip2 compress; do
        luarocks --lua-version "$luaver" --tree="$pkgdir/usr" make --deps-mode none \
            "rockspecs/$spec-$pkgver-$_rockrel.rockspec" \
            ZLIB_LIBDIR=/usr/lib BROTLIDEC_LIBDIR=/usr/lib BROTLIENC_LIBDIR=/usr/lib LZMA_LIBDIR=/usr/lib BZIP2_LIBDIR=/usr/lib
    done
    # the rock manifest and its copies of the docs are not part of a package
    rm -rf "$pkgdir/usr/lib/luarocks"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
