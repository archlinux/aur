# Maintainer: Norbert Preining <norbert@preining.info>
_UpstreamPkgName=NVEnc
pkgname=${_UpstreamPkgName,,}
pkgver=9.08
pkgrel=1
pkgdesc="NVIDIA Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/$_UpstreamPkgName"
license=('MIT')
# While cuda and nvidia are not strictly necessary accoring the ldd
# the program will not work at all without them installed.
depends=('cuda>=10' 'ffmpeg' 'libass' 'vapoursynth' 'libdovi')
makedepends=('git' 'gcc14' 'cargo-c')
source=(git+${url}.git#tag=${pkgver}
        git+https://github.com/tplgy/cppcodec.git
        ldflags-adjustments.patch)
sha256sums=('56589180bef6781a934ccddb7ddddf569e39c6902211e3db1f26ed6e831bdb28'
            'SKIP'
            '9032a642a66219efe9413cee1cb371ca3f46de254c6b50f3605df3f385ec53a5')

prepare() {
	cd $_UpstreamPkgName
	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
}

build() {
	cd $_UpstreamPkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
        git submodule update cppcodec
	CXX=g++-14 ./configure --prefix=/usr
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
