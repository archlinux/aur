# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: David Wu <xdavidwuph@gmail.com>
pkgname='lightspark'
pkgver='0.8.7'
pkgrel='2'
pkgdesc='An open source flash player implementation'
arch=('x86_64' 'i486' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/$pkgname/$pkgname"
license=('LGPL-3.0-only')
depends=('cairo' 'curl' 'ffmpeg' 'freetype2' 'glew' 'glib2' 'libgl' 'libjpeg' 'libpng' 'pango' 'rtmpdump' 'sdl2' 'xz' 'zlib')
makedepends=('cmake' 'nasm' 'ninja')
conflicts=('pepper-flash')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-nasm-1.diff::$url/commit/31b18a959ab5f1822e2bd86a9e8527c2f95e706f.diff"
	"$pkgname-$pkgver-nasm-2.diff::$url/commit/732f11b80142b53d7f843dae17021016551046d6.diff"
)
b2sums=('53486183672c35a8b8040177ebc738e588c3ea39a316d2dd10fc4868393b0befea5ac9f411cdb87aad608f02df2f04e07b4a7f8a0635c0f6e0dee465469709f4'
        'aa509a77e9a2bd4ebc90a4ea2475b916ecf9a9ad2d9a74ac5877a3e30b1e0bea47007d109de3e62501e7dc2470324fabdc22ff30f979516c4a59301199f994db'
        '367657e1e66c536ec571299b1b15d525699257abe1904686e587057fa60d893fe8a7849d0a00c08c1c6850a0a80aa70f92f77f7e44836af72da0103a765bf96f')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	mkdir -p "$srcdir/$_sourcedirectory/build/"

	# Apply patches
	cd "$srcdir/$_sourcedirectory/"

	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-nasm-1.diff"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-nasm-2.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	cmake -S '.' -B 'build/' -G Ninja -DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build 'build/'
}

# The test suite depends on python2 and a bunch of abandoned software, which I wasn't able to get working

package() {
	cd "$srcdir/$_sourcedirectory/"
	DESTDIR="$pkgdir" cmake --install 'build/'
}
