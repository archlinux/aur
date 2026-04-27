# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zoomvtools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r368.550f87b
pkgrel=1
pkgdesc='Zoomy reimplementation of VapourSynth MVTools'
arch=('x86_64')
url='https://gitlab.com/shssoichiro/vapoursynth-zoomvtools'
license=('MIT')
depends=('vapoursynth' 'fftw')
makedepends=('git' 'cargo')
optdepends=('fftw-amd: optimized version for AMD CPUs')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("$_plug::git+https://gitlab.com/shssoichiro/vapoursynth-zoomvtools.git")
sha256sums=('SKIP')

pkgver() {
	cd $_plug
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_plug
	echo 'If the build fails with “no default toolchain configured”, you may need to set up rust.
When using rustup, this can be done via
rustup install stable && rustup default stable'
	RUSTFLAGS="$RUSTFLAGS -C target-cpu=native" cargo build --release --features static_simd --locked
}

package() {
	cd $_plug
	install -Dm755 "target/release/libvapoursynth_zoomvtools.so" "$pkgdir/usr/lib/vapoursynth/libzoomvtools.so"
}
