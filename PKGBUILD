# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zc
_pkgname=zen-c
pkgver=0.5.2.rc1.r107.g774e937
pkgrel=1
pkgdesc='Write like a high-level language, run like C; mysterious fork from the 5th dimension.'
url='https://github.com/zenc-lang-ce/zenc'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
optdepends=('gcc: gcc backend support'
    'clang: clang backend support'
    'zig: zig backend support')
makedepends=(gcc make git)
provides=(zc zen-c)
conflicts=('zen-c' 'zen-c-bin')
replaces=('zenc-git')
source=("$_pkgname::git+$url.git#branch=main")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"

    for z in zc*;
        do install -Dm755 "$z" "$pkgdir/usr/bin/$z"; done
    for m in 1 5 7;
        do gzip man/*.$m && install -d "$pkgdir/usr/share/man/man$m" && install -Dm644 man/*.$m.gz "$pkgdir/usr/share/man/man$m"; done
    # install -dm644 -v "$pkgdir/usr/share/zenc/std" std // this is so sad alexa play despacito
    install -d "$pkgdir/usr/share/zenc"
    cp -r std "$pkgdir/usr/share/zenc/std"
    install -Dm644 src/repl/docs.json "$pkgdir/usr/share/zenc/docs.json"
    install -Dm644 src/misc/zenc.json "$pkgdir/usr/share/zenc/zenc.json"
    install -Dm644 plugins/zprep_plugin.h "${pkgdir}"/usr/include/zprep_plugin.h
    install -Dm644 std.zc "$pkgdir/usr/share/zenc/std.zc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
# vim: ts=4 sw=4 et:
