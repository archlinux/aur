# Maintainer: Nathan Craddock <contact@nathancraddock.com>
pkgname=zf
pkgver=0.8.0
pkgrel=1
pkgdesc="a commandline fuzzy finder designed for filtering filepaths"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'zig')
provides=(zf)
url="https://github.com/natecraddock/zf"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"https://github.com/jecolon/ziglyph/archive/8d347309cef3c9ad210ff001f43f1b332d5e615f.tar.gz")

sha256sums=('941cb1ed1d09ee5aeabe967c712ddc8f0bc0eafd0e0a583b797ce205ce4160a0'
	    'bca8adee96bb87c28d75516d13a56ba0c0a3cba0e8979c95a636141ccc589792')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p lib/ziglyph
    mv "${srcdir}"/ziglyph-8d347309cef3c9ad210ff001f43f1b332d5e615f/* lib/ziglyph/
}

build() {
    cd "$pkgname-$pkgver"
    zig build -Drelease-safe=true
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
