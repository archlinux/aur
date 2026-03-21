# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zen-c-git
_pkgname=zen-c
pkgver=0.4.4.r5.ge210bc0
pkgrel=1
pkgdesc='Write like a high-level language, run like C.'
url='https://github.com/zenc-lang/zenc'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
optdepends=('gcc: gcc backend support'
    'clang: clang backend support'
    'zig: zig backend support')
makedepends=(gcc make git)
provides=(zc)
conflicts=('zen-c' 'zen-c-bin')
replaces=('zenc-git')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make CC=gcc -j
}

package() {
    cd "$_pkgname"
    install -Dm755 zc "$pkgdir/usr/bin/zc"
    install -d "$pkgdir/usr/local/share/zenc"
    cp -r std/ "$pkgdir/usr/local/share/zenc/std"
    install -Dm644 src/zen/facts.json "$pkgdir/usr/local/share/zenc/facts.json"
    install -Dm644 src/repl/docs.json "$pkgdir/usr/local/share/zenc/docs.json"
    install -Dm644 src/misc/zenc.json "$pkgdir/usr/local/share/zenc/zenc.json"
    install -Dm644 plugins/zprep_plugin.h "${pkgdir}"/usr/local/include/zprep_plugin.h
    install -Dm644 std.zc "$pkgdir/usr/local/share/zenc/std.zc"
    install -Dm644 man/zc.1 "$pkgdir/usr/share/man/man1/zc.1"
    install -Dm644 man/zc.5 "$pkgdir/usr/share/man/man5/zc.5"
    install -Dm644 man/zc.7 "$pkgdir/usr/share/man/man7/zc.7"
    install -Dm644 man/zc-stdlib.7 "$pkgdir/usr/share/man/man7/zc-stdlib.7"
    command -v gzip >/dev/null 2>&1 && {
        gzip -9 "$pkgdir/usr/share/man/man1/zc.1"
        gzip -9 "$pkgdir/usr/share/man/man5/zc.5"
        gzip -9 "$pkgdir/usr/share/man/man7/zc.7"
        gzip -9 "$pkgdir/usr/share/man/man7/zc-stdlib.7"
    }
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
