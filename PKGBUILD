_UpstreamPkgName=VCEEnc
pkgname=${_UpstreamPkgName,,}
pkgver=8.28
pkgrel=1
pkgdesc="AMD Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
depends=('ffmpeg' 'libass' 'vapoursynth' 'libdovi' 'libhdr10plus-rs')
makedepends=('git' 'gcc' 'cargo-c')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        git+https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git
        git+https://github.com/clMathLibraries/clRNG.git
        git+https://github.com/cubicdaiya/dtl
        ldflags-adjustments.patch)
sha256sums=('fe038b67d06cd3e90156fe707b33cb051f6eba7c3e0464ad908182c1f561d51c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8e6a15e88584bf1bdaa931d010c877b627c706086e449da141dedde95efc8aa4')

prepare() {
	cd $_UpstreamPkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
	git config --local submodule.clRNG "$srcdir/clRNG"
	git config --local submodule.dtl "$srcdir/dtl"
	git config --local submodule.AMF "$srcdir/AMF"
	git -c protocol.file.allow=always submodule update

	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
}

build() {
	cd $_UpstreamPkgName

	./configure --prefix=/usr \
		--enable-lto
	make
}

package() {
	cd $_UpstreamPkgName
	make PREFIX="$pkgdir/usr" install
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${_UpstreamPkgName}_license.txt
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" ${_UpstreamPkgName}C_Options.* Readme.*
}
