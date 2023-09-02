# Maintainer: Anima <contact@animafps.xyz>
pkgname=teres
pkgver=0.3.4
pkgrel=1
pkgdesc="Utility for realistic motion blur through frame intepolation and blending"
depends=('vapoursynth-plugin-mvtools' 'vapoursynth-plugin-havsfunc' 'vapoursynth' 'ffmpeg' 'vapoursynth-plugin-svpflow1' 'ffms2' 'vapoursynth-plugin-svpflow2-bin' 'vapoursynth-plugin-mvsfunc' 'vapoursynth-plugin-frameblender')
optdepends=('vapoursynth-plugin-rife-ncnn-vulkan: RIFE-NCNN Vulkan support'
'vapoursynth-plugin-vsrife: RIFE CUDA support')
makedepends=('rust' 'cargo' 'python' 'gtk3')
arch=('x86_64')
license=('GPL3')
url="https://github.com/animafps/teres"
source=("$pkgname-$pkgver.tar.gz::https://github.com/animafps/teres/archive/v$pkgver.tar.gz")

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -Dt "$pkgdir$site_packages/" plugins/weighting.py
    install -Dt "$pkgdir$site_packages/" plugins/filldrops.py
    install -Dt "$pkgdir$site_packages/" plugins/adjust.py

    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname" 

    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
sha256sums=('03dc3f4ac0691fa772308b830b11707402f8d4c36bc1cd3225c4c400c9405733')
