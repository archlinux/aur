_UpstreamPkgName=VCEEnc
pkgname=${_UpstreamPkgName,,}
pkgver=8.30
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
        ldflags-adjustments.patch
        fix-finding-hdr10plus.patch)
sha256sums=('1171df53f8dd2a983d820d7a027fb0270b432c0b1a0ed3c213f08fe41e25c34c'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8e6a15e88584bf1bdaa931d010c877b627c706086e449da141dedde95efc8aa4'
            '58d3b689ef7fa067d5023c44793774661bf12d65514e69136dfc79fc102bd771')

prepare() {
	cd $_UpstreamPkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
	git config --local submodule.clRNG "$srcdir/clRNG"
	git config --local submodule.dtl "$srcdir/dtl"
	git config --local submodule.AMF "$srcdir/AMF"
	git -c protocol.file.allow=always submodule update

	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
	patch --forward --strip=1 --input="${srcdir}/fix-finding-hdr10plus.patch"
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
