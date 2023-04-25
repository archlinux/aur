# Maintainer: éclairevoyant
# Contributor: Devin J dot  Pohly <djpohly+arch at gmail dot com>
# Contributor: Martin Kröning <m dot kroening at hotmail dot de>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2 at gmail dot com>
# Contributor: Lauri Niskanen <ape at ape3000 dot com>
# Contributor: Travis Nickles <ryoohki7 at yahoo dot com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: Dan Guzek <dguzek at gmail dot com>

_pkgname=stepmania
pkgname="$_pkgname-git"
pkgver=5.1.0.b2.r627.d55acb1ba2
pkgrel=1
pkgdesc="An advanced rhythm game designed for both home and arcade use"
arch=(x86_64)
url='https://www.stepmania.com'
license=(MIT)
depends=(ffmpeg glew gtk3 jsoncpp libmad libtomcrypt)
makedepends=(cmake git ninja)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"git+https://github.com/$_pkgname/$_pkgname.git"
	0001-remove-asm-requirement-for-ffmpeg.patch
	0002-fix-for-ffmpeg-4.patch
	0003-fix-for-ffmpeg-5.patch
)
b2sums=('SKIP'
        'e69f3ef01825965079df45da54f584def00772ae24b37e4e35d8bdb337b9ea358c943981b7ab6d0b134b0a298156db5d30db250ef285f1459040ed41dec3832b'
        '54ee2a1e5f54e915d7bed0a0b1cbceb7d01c788cb944cd4f9858f4044d40ed6fcec3c6ee460e9576188cbd40d7ca1c600fea30e5790df65927dd193e73cc0dd6'
        '2cb7adc515a50ca85a378a705c89e0c884e6594b4f1c661ee42e8e5e54d83a9dc1b06d0f722e5dae150262b253987a69d1ad633793bd25967d934f419de171de')

pkgver() {
	cd $_pkgname
	git describe --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname

	patch -Np1 -i ../0001-remove-asm-requirement-for-ffmpeg.patch
	patch -Np1 -i ../0002-fix-for-ffmpeg-4.patch
	patch -Np1 -i ../0003-fix-for-ffmpeg-5.patch
}

build() {
	cmake -G Ninja -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_C_FLAGS="$CPPFLAGS $CFLAGS" \
		-DCMAKE_CXX_FLAGS="$CPPFLAGS $CXXFLAGS" \
		-DCMAKE_INSTALL_PREFIX=/opt \
		-DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
		-DWITH_SYSTEM_FFMPEG=ON \
		-DWITH_SYSTEM_GLEW=ON \
		-DWITH_SYSTEM_JPEG=ON \
		-DWITH_SYSTEM_JSONCPP=ON \
		-DWITH_SYSTEM_MAD=ON \
		-DWITH_SYSTEM_OGG=ON \
		-DWITH_SYSTEM_PCRE=ON \
		-DWITH_SYSTEM_PNG=ON \
		-DWITH_SYSTEM_TOMCRYPT=ON \
		-DWITH_SYSTEM_TOMMATH=ON \
		-DWITH_SYSTEM_ZLIB=ON \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/$_pkgname-5.1/$_pkgname "$pkgdir/usr/bin/$_pkgname"

	cd $_pkgname
	install -Dm 644 $_pkgname.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir"/usr/share
	cp -r icons "$pkgdir"/usr/share/icons
}
