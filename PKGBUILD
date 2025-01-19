_UpstreamPkgName=VCEEnc
pkgname=${_UpstreamPkgName,,}
pkgver=8.27
pkgrel=1
pkgdesc="AMD Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
depends=('ffmpeg' 'libass' 'vapoursynth' 'libdovi')
makedepends=('git' 'gcc' 'cargo-c')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        git+https://github.com/GPUOpen-LibrariesAndSDKs/AMF.git
        ldflags-adjustments.patch)
sha256sums=('db97ac497c849fc51bf1c15fc3932e06305862c783ca2bcc987ecf9fb6d17bab'
            'SKIP'
            'SKIP'
            '8e6a15e88584bf1bdaa931d010c877b627c706086e449da141dedde95efc8aa4')

prepare() {
	cd $_UpstreamPkgName
	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
}

build() {
	cd $_UpstreamPkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
	git config --local submodule.AMF "$srcdir/AMF"

  git submodule update
	./configure --prefix=/usr
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
