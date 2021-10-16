# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=zydis
pkgname=$_pkgname-git
pkgver=3.1.0.r131.g746faa4
pkgrel=1
pkgdesc='Fast and lightweight x86/x86-64 disassembler library'
arch=('x86_64')
url='https://zydis.re/'
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git' 'ninja' 'zycore-c>=1.0.0.r19.g6c93d9a')
provides=("$_pkgname=$pkgver" 'libZydis.so')
conflicts=("$_pkgname")
source=(
	"git+https://github.com/zyantific/$_pkgname.git"
	"0001-zydis-unbundle-zycore.patch::https://github.com/zyantific/$_pkgname/pull/250.patch"
)
b2sums=(
	'SKIP'
	'4ea5883a235572cb2e090900c4a52ae41b54d2219eafc3336df8b3e4e2ac85247a216770ffdb64261873b53aaa5414fbdd67a5798c7cbec13e9fb3943ff3ff8e'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -d $_pkgname -Np1 < 0001-zydis-unbundle-zycore.patch
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DZYDIS_BUILD_SHARED_LIB=ON \
		-DZYDIS_FEATURE_AVX512=OFF \
		-DZYDIS_FEATURE_KNC=OFF \
		-DZYDIS_SYSTEM_ZYCORE=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libZycore.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
