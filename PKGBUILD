# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=sdrtop-git
pkgver=0.6.6.r25.g7ee397f
pkgrel=4
pkgdesc="Terminal monitor for SDR hardware"
arch=("x86_64")
url="https://github.com/musithang/sdrtop"
license=("GPL-3.0")
depends=("gcc-libs")
optdepends=(
    'hackrf: HackRF support'
    'rtl-sdr: RTL-SDR support'
    'soapysdr: SoapySDR support'
)
makedepends=("cargo" "git")
provides=("sdrtop")
conflicts=("sdrtop")
source=("$pkgname::git+$url")
sha256sums=("SKIP")
options=(!lto)

pkgver() {
    cd "$pkgname" || exit 1
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --config 'profile.release.opt-level="z"' --config 'profile.release.lto=true' --config 'profile.release.codegen-units=1' --config 'profile.release.panic="abort"'
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 "target/release/sdrtop" "$pkgdir/usr/bin/sdrtop"
    install -Dm644 "LICENSE"               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md"             "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CHANGELOG.md"          "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "CREDITS.md"            "$pkgdir/usr/share/doc/$pkgname/CREDITS.md"
    install -Dm644 "SECURITY.md"           "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
    cp -r          "user_docs"             "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "target/man/sdrtop.1"   "$pkgdir/usr/share/man/man1/sdrtop.1"
}
