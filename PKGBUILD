# Maintainer: fanfly <fanfly at pm dot me>
pkgname=mjai-reviewer
pkgver=1.5.10.r0.g8ffc1ea
pkgrel=1
pkgdesc="A mahjong game log reviewer"
arch=('any')
url="https://github.com/Equim-chan/mjai-reviewer"
license=('APACHE')
makedepends=('git' 'cargo')
optdepends=('akochan: a review engine')
source=('git+https://github.com/Equim-chan/mjai-reviewer')
sha256sums=('SKIP')

prepare() {
    printf '#!/bin/sh\n%s %s %s %s %s %s\n' \
        "/opt/$pkgname/mjai-reviewer" \
        '--akochan-dir' "'/opt/$pkgname/akochan'" \
        '--akochan-tactics' "'/opt/$pkgname/akochan/tactics.json'" \
        '"$@"' \
        > "$pkgname/mjai-reviewer-script"
}

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/mjai-reviewer" "$pkgdir/opt/$pkgname/mjai-reviewer"
    install -Dm644 \
        "$srcdir/$pkgname/tactics.json" "$srcdir/$pkgname/LICENSE" \
        "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/opt/$pkgname/akochan"
    ln -s /opt/akochan/system.exe "$pkgdir/opt/$pkgname/akochan/system.exe"
    ln -s /opt/akochan/params "$pkgdir/opt/$pkgname/akochan/params"
    ln -s "/opt/$pkgname/tactics.json" "$pkgdir/opt/$pkgname/akochan/tactics.json"
    install -Dm755 "$srcdir/$pkgname/mjai-reviewer-script" "$pkgdir/usr/bin/mjai-reviewer"
}
