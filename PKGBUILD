# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=nvenc
_PkgName=NVEnc
pkgver=5.43
pkgrel=1
pkgdesc="NVIDIA Video Codec based command line encoder"
arch=('x86_64')
url="https://github.com/rigaya/NVEnc"
license=('MIT')
# While cuda and nvidia are not strictly necessary accoring the ldd
# the program will not work at all without them installed.
depends=('cuda>=10' 'ffmpeg' 'libass' 'nvidia>=435.21' 'vapoursynth')
makedepends=('git')
_commit="c187b1a5a432bad65a598dd8c47a072be8155f3b"
source=(git+https://github.com/rigaya/NVEnc.git#commit=$_commit
        git+https://github.com/tplgy/cppcodec.git
        ldflags-adjustments.patch)
sha256sums=('SKIP'
            'SKIP'
            '9032a642a66219efe9413cee1cb371ca3f46de254c6b50f3605df3f385ec53a5')

prepare() {
	cd $_PkgName
	patch --forward --strip=1 --input="${srcdir}/ldflags-adjustments.patch"
}

build() {
	cd $_PkgName
	git submodule init
	git config --local submodule.cppcodec "$srcdir/cppcodec"
        git submodule update cppcodec
	./configure --prefix=/usr
	make
}

package() {
	cd NVEnc
	make PREFIX="$pkgdir/usr" install
	# since it is MIT we need to install a license file
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp NVEnc_license.txt $pkgdir/usr/share/licenses/$pkgname/
	# install documentation
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp NVEncC_Options.* Readme.* $pkgdir/usr/share/doc/$pkgname
}
