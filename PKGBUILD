# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=zsmooth
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.20.0
pkgrel=1
pkgdesc="Plugin for VapourSynth: ${_plug}"
arch=('x86_64')
url='https://github.com/adworacz/zsmooth'
license=('MIT')
depends=('vapoursynth')
makedepends=('zig>=0.16' 'zig<0.17')
source=("https://github.com/adworacz/zsmooth/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('218d141fe0b0e1cac2c6a16f2d653dd2fb4ea6f0b8d0792232dbbe2107469600')

build() {
	cd "zsmooth-${pkgver}"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "zsmooth-${pkgver}"

	# Determine the dynamic plugin directory of the installed VapourSynth package
	PLUGINDIR=$(python -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")

	# Install the compiled plugin library
	install -Dm755 zig-out/lib/libzsmooth.so "${pkgdir}${PLUGINDIR}/libzsmooth.so"

	# Install documentation & licensing
	install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
