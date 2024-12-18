# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgfont=Rustcraft
_pkgfont_regular=RustCraftRegular
pkgname=rustcraft
pkgver=0.8
pkgrel=3
pkgdesc='Minecraft game clone written in Rust'
arch=('x86_64')
url="https://github.com/c2i-junia/$pkgname"
license=('MIT' 'CC BY-SA-4.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c9173396429072f514e944867b9ca4ee274c3ed17f5b5d9a79179a5fb5af0f8')
depends=('gcc-libs' 'vulkan-driver' 'vulkan-icd-loader' 'alsa-lib')
makedepends=('rustup' 'just' 'git' 'bash' 'mold' 'clang' 'vulkan-tools')

prepare() {
    export RUSTUP_TOOLCHAIN=nightly
    cd "$pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -dm777 "$pkgdir/opt/$pkgname"
    cp -a data "$pkgdir/opt/$pkgname/data"

    install -Dm0755 "target/release/client" "$pkgdir/opt/$pkgname/bin/$pkgname"
    install -Dm0755 "target/release/server" "$pkgdir/opt/$pkgname/bin/$pkgname-server"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    ln -s "/opt/$pkgname/bin/$pkgname-server" "$pkgdir/usr/bin/$pkgname-server"

    install -d "$pkgdir/usr/share/fonts/opentype"
    ln -s "/opt/$pkgname/data/fonts/$_pkgfont_regular-Bmg3.otf" "$pkgdir/usr/share/fonts/opentype/$_pkgfont_regular.otf"
    ln -s "/opt/$pkgname/data/fonts/${_pkgfont}Bold-nMK1.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Bold.otf"
    ln -s "/opt/$pkgname/data/fonts/${_pkgfont}BoldItalic-1y1e.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}BoldItalic.otf"
    ln -s "/opt/$pkgname/data/fonts/${_pkgfont}Italic-R8Mo.otf" "$pkgdir/usr/share/fonts/opentype/${_pkgfont}Italic.otf"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
