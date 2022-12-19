# Maintainer: Anima <contact@animafps.xyz>
pkgname=teres
pkgver=0.3.2
pkgrel=1
pkgdesc="Easily and efficiently add motion blur and or framerate to videos through interpolation and frameblending"
depends=('vapoursynth-plugin-mvtools' 'vapoursynth-plugin-havsfunc' 'vapoursynth' 'ffmpeg' 'vapoursynth-plugin-svpflow1' 'ffms2' 'vapoursynth-plugin-svpflow2-bin' 'vapoursynth-plugin-mvsfunc-git' 'vapoursynth-plugin-frameblender')
optdepends=('vapoursynth-plugin-rife-ncnn-vulkan-git: RIFE-NCNN Vulkan support'
'vapoursynth-plugin-vsrife-git: RIFE CUDA support')
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

    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$pkgname" 

    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
sha256sums=('6fc746e23cd6b011f7d25e3f137da98090f9a46deac90a7bd25a736e64475a97')
