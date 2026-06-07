# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=NVEnc
pkgname=${_UpstreamPkgName,,}
pkgver=9.17
pkgrel=1
pkgdesc="NVIDIA Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
# While cuda and nvidia are not strictly necessary accoring the ldd
# the program will not work at all without them installed.
depends=('cuda>=10' 'ffmpeg' 'libass' 'vapoursynth' 'libdovi')
makedepends=('git' 'gcc15' 'cargo-c' 'meson' 'ninja')
source=(git+${url}.git#tag=${pkgver})
sha256sums=('190f63709fc89fef22ac302134031efbebe3146726b7d2693082a8b5a202b442')

build() {
	export CXX='g++-15' CC='gcc-15' 
	unset LDFLAGS
	cd $_UpstreamPkgName
	git submodule init
	git submodule update
	meson setup ./build --prefix=/usr --buildtype=release -Denable_vapoursynth=false
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
