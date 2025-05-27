# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: wackbyte <wackbyte@protonmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
pkgname=discord-rpc
pkgver=3.4.0+r10+g963aa9f
pkgrel=1
epoch=1
pkgdesc="Discord Rich Presence library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/discord/discord-rpc"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git' 'rapidjson>=1.1')
provides=('libdiscord-rpc.so')
_commit=963aa9f3e5ce81a4682c6ca3d136cddda614db33
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('aac24567989ab9fc4dd74d10f66987ac6c555efea0332acc122d775f4a660285c609fe394b1cc9d0b7510630973f08b9208ff4dd5a1357cb5113280805f89c7b')

pkgver() {
	cd $pkgname
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
	local options=(
		-D BUILD_SHARED_LIBS=ON
		-D CLANG_FORMAT_SUFFIX=ignore
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $pkgname
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $pkgname/LICENSE
}
