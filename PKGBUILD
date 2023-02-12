# Maintainer: Nathan Craddock <contact@nathancraddock.com>
pkgname=zf
pkgver=0.7.0
pkgrel=1
pkgdesc="A commandline fuzzy finder that prioritizes matches on filenames"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'zig')
provides=(zf)
url="https://github.com/natecraddock/zf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"https://github.com/jecolon/ziglyph/archive/8d347309cef3c9ad210ff001f43f1b332d5e615f.tar.gz")

sha256sums=('f4207489ff85f5d7f75983531230e6c417d8eb66c5587d79e9a564a090a60272'
	    'bca8adee96bb87c28d75516d13a56ba0c0a3cba0e8979c95a636141ccc589792')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p lib/ziglyph
    mv "${srcdir}"/ziglyph-8d347309cef3c9ad210ff001f43f1b332d5e615f/* lib/ziglyph/
}

build() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-fast=true
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m755 zig-out/bin/zf "$pkgdir/usr/bin/zf"
    install -D -m644 doc/zf.1 "$pkgdir/usr/share/man/man1/zf.1"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -D -m644 complete/zf "$pkgdir/usr/share/bash-completion/completions/zf"
    install -D -m644 complete/_zf "$pkgdir/usr/share/zsh/site-functions/_zf"
    install -D -m644 complete/zf.fish "$pkgdir/usr/share/fish/completions/zf.fish"
}
