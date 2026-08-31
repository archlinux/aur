# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=NVEnc
pkgname=${_UpstreamPkgName,,}
pkgver=9.33
pkgrel=1
pkgdesc="NVIDIA Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
# While cuda and nvidia are not strictly necessary accoring the ldd
# the program will not work at all without them installed.
depends=('cuda>=10' 'ffmpeg' 'libass' 'vapoursynth' 'libdovi' 'onnxruntime-opt-cuda')
makedepends=('git' 'gcc15' 'cargo-c' 'meson' 'ninja')
source=(git+${url}.git#tag=${pkgver} onnxruntime-find.patch)
sha256sums=('e21b01939e6ed65627d01a18f34bb1d6baee9ab9244d6d5201b635e2e33a7383'
            '206794b06a69ee057638efeaa124e1ca92282ce8a2efa8799cfd4094b4819bd5')

build() {
	export CXX='g++-15' CC='gcc-15' 
	unset LDFLAGS
	cd $_UpstreamPkgName
	patch -p1 <$srcdir/onnxruntime-find.patch
	git submodule init
	git submodule update
	meson setup ./build --prefix=/usr --buildtype=release -Denable_vapoursynth=false -Dlibass_static=false
	ninja -C build
}

package() {
	cd $_UpstreamPkgName
	DESTDIR="$pkgdir" meson install -C build
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" NVEnc_license.txt
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" NVEncC_Options.* Readme.*
}
