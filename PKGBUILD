# Maintainer: Ananas <ananas[at]ananas.moe>

pkgname=aeternum
_pkgver="v0.1.2-beta.1"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A simple and minimal upscaler built in 🦀 rust (WIP)"
url="https://github.com/cloudy-org/aeternum"
license=(GPL-3.0-only)
provides=("aeternum")
conflicts=("aeternum-bin")
makedepends=("git" "cargo")
depends=("libxcb" "libxkbcommon" "openssl" "upscayl-ncnn")
arch=("x86_64")
source=("git+$url.git#tag=$_pkgver")
sha256sums=('d5fed1e41ef2fdef465b2059bd447a463aa2cf00d9c8ddb9a4a6d76462021b9e')

prepare() {
    cd $srcdir/$pkgname
    git submodule update --init --recursive

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n "s/host: //p")"
}

build() {
    cd $srcdir/$pkgname

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects'

    cargo build --release
}

package() {
    cd $srcdir/$pkgname

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd $srcdir/$pkgname/assets/models
    for file in *; do
        if [[ "$file" != "realesrgan"* ]]; then
            install -Dm644 "$file" "$pkgdir/usr/lib/upscayl/models/$file"
        fi
    done

    cd $srcdir/$pkgname/assets
    install -Dm644 aeternum.desktop "$pkgdir/usr/share/applications/aeternum.desktop"
    install -Dm644 sparkles.png "$pkgdir/usr/share/pixmaps/aeternum.png"
}