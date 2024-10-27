# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=NVEnc
pkgname=${_UpstreamPkgName,,}
pkgver=7.71
pkgrel=2
pkgdesc="NVIDIA Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
# While cuda and nvidia are not strictly necessary accoring the ldd
# the program will not work at all without them installed.
depends=('cuda>=10' 'ffmpeg' 'libass' 'vapoursynth' 'libdovi')
makedepends=('git' 'gcc13')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        ldflags-adjustments.patch
        support-system-libdovi.patch)
sha256sums=('6499bdaaeb3275426b0824e10b2b93c6b7d6ece70ef8c61c4fb8c62a31c069d3'
            'SKIP'
            '9032a642a66219efe9413cee1cb371ca3f46de254c6b50f3605df3f385ec53a5'
            '89141a2e80edc6fa11de6d116d9d4577c5b8864ebcf59fcf68ddbde34c369a6b')

prepare() {
	cd $_UpstreamPkgName
	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
	patch --forward --strip=0 --input="${srcdir}/support-system-libdovi.patch"
}

build() {
	cd $_UpstreamPkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
        git submodule update cppcodec
	CXX=g++-13 ./configure --prefix=/usr
	make
}

package() {
	cd $_UpstreamPkgName
	make PREFIX="$pkgdir/usr" install
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" NVEnc_license.txt
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" NVEncC_Options.* Readme.*
}
