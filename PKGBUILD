# Maintainer: Rolv Apneseth <rolv.apneseth at gmail dot com>

_pkgname=gpu-usage-waybar
pkgname=${_pkgname}-git
pkgver=0.1.2.r3.gf852aa4
pkgrel=1
pkgdesc='A tool to display GPU usage in Waybar'
arch=('i686' 'x86_64')
url="https://github.com/PolpOnline/gpu-usage-waybar"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('gpu-usage-waybar')
conflicts=('gpu-usage-waybar')
source=("git+https://github.com/PolpOnline/gpu-usage-waybar.git")
md5sums=('SKIP')
options=(!debug)

pkgver()
{
    cd "$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare()
{
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build()
{
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    mkdir -p target/release/man
}

package()
{
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" \
        -t "$pkgdir/usr/bin"
    install -Dm644 LICEN?E \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
