# Maintainer: Anima <contact@animafps.xyz>

pkgname=teres-git
pkgver=0.3.2.r0.gebd3134
pkgrel=2
pkgdesc="Utility for realistic motion blur through frame intepolation and blending"
depends=('vapoursynth-plugin-mvtools' 
	'vapoursynth-plugin-havsfunc' 
	'vapoursynth' 
	'ffmpeg' 
	'vapoursynth-plugin-svpflow1' 
	'ffms2' 
	'vapoursynth-plugin-svpflow2-bin' 
	'vapoursynth-plugin-mvsfunc' 
	'vapoursynth-plugin-frameblender'
    'vapoursynth-plugin-adjust')
optdepends=('vapoursynth-plugin-rife-ncnn-vulkan: RIFE-NCNN Vulkan support'
'vapoursynth-plugin-vsrife: RIFE CUDA support')
makedepends=('rust' 'cargo' 'python' 'gtk3' 'git')
arch=('x86_64')
license=('GPL3')
url="https://github.com/animafps/teres"
source=("${pkgname}::git+https://github.com/animafps/teres.git")
provides=("teres")
conflicts=('teres')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    cd "${pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -Dt "$pkgdir$site_packages/" plugins/weighting.py
    install -Dt "$pkgdir$site_packages/" plugins/filldrops.py

    install -Dm0755 -t "$pkgdir/usr/bin" "target/release/teres" 

    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
