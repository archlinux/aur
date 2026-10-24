#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=mc-schem
pkgname=${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc="A rust/c++ library to generate, load, manipulate and save minecraft schematic files."
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/mc_schem"
license=('GPL-3.0-only')
options=(!debug)

makedepends=(
	rust # Any rust, either official rust/rustup/rust-nightly is ok
	cmake
	gcc
)
depends=(
	glibc
	gcc-libs
)
optdepends=(
)
source=(
	https://github.com/SlopeCraft/mc_schem/releases/download/v1.3.0/mc_schem-v1.3.0.tar.xz
	001-fix-install.patch
)
sha512sums=(
	'94ebcf014a119d3459da8133d9dedb39b368fa76c69bebcd39c6f4933b82225df0d34792906c3ef967dd9e0757c7c9adc305743a2252ecb856738863abccebd2'
	'ab397956618d5314d614c02bb42441b0b62a4c2c36835111d9fda84910dc6b4ee7c82fd0a1b9d1ac558a7d1bfc7c700eef9902e34cc24a263b8eb74393daa22a'
)

prepare() {
	cd mc_schem-$pkgver
	patch -N -p1 -i "$srcdir/001-fix-install.patch"
}

build() {
	cmake -S mc_schem-$pkgver -B build \
		-G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMC_SCHEM_ENABLE_TESTS=OFF \


	cmake --build build --parallel
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
