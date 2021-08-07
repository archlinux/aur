# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=dynarmic
pkgname=$_pkgname-git
pkgver=5.r100.g07b5734f
pkgrel=1
pkgdesc='An ARM dynamic recompiler'
arch=('x86_64')
url="https://github.com/MerryMage/$_pkgname"
license=('BSD')
makedepends=(
	'boost>=1.57'
	'catch2>=2.13.1'
	'cmake>=3.8'
	'fmt>=8'
	'git'
	'robin-map>=0.6.2'
	'xbyak>=5.991'
	'zydis>=3.1'
)
provides=("$_pkgname=$pkgver" 'libdynarmic.so')
conflicts=("$_pkgname")
source=(
	"git+$url.git"
	'dynarmic-add-cmake-install-rules.patch::https://github.com/MerryMage/dynarmic/pull/636.patch'
	'unbundle-catch2.patch'
	'unbundle-fmt.patch'
	'unbundle-robin-map.patch'
	'unbundle-xbyak.patch'
	'unbundle-zydis.patch'
)
b2sums=(
	'SKIP'
	'027a8eae057b4b4aeb1cd278719c49cc824206a9b1ab9ee1e2c2dd2b194efc114fde3f7c74d12f2b7d6dc199d208cdadf2c3da9575542b01c14536fe0335b5e9'
	'7047d87826551417b188afc0d0fef5768840b4110c556c3471411a3ba94a0c270b5996e49a3e97211bc076f80b652a9995c26023a3559976d0eb708ffc4f8436'
	'e17436a93047f2b43de9aa5013d48daafe924a1c177c0c76d5fb61887ff250ca97262d10c54239e0b5558a4bba191230041b82f93529e5039da53bccb7111fbf'
	'0d88d24bc5b44a9a67b4054ccd1ab4da87a1b954ea85c14f010a3aa9684d198360fcded8c12a9865c621ca841e95da119fe32948e51bbc954b1f0ff8f366d11e'
	'9779ade0bf6ea5bc25d9c762cf140edeb114af8bc9c2e19d97898181ae0d523eb3aa43c19f5d5035fadef1b64a328e3bc1364e97bedbc5797202e5076e5c534f'
	'c948e6a94df3352114f174f3876974785b96ddd530ae43811acf0f6e59626628f8197f59d523ef93f82a658331ba5f2721f3f6d9f09c38c25172558c720a9c8f'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	patch -Np1 < ../dynarmic-add-cmake-install-rules.patch
	patch -Np1 < ../unbundle-catch2.patch
	patch -Np1 < ../unbundle-fmt.patch
	patch -Np1 < ../unbundle-robin-map.patch
	patch -Np1 < ../unbundle-xbyak.patch
	patch -Np1 < ../unbundle-zydis.patch
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDYNARMIC_ENABLE_CPU_FEATURE_DETECTION=OFF \
		-Wno-dev
	cmake --build build
}

check() {
	cmake --build build --target test
}

package() {
	depends+=('libfmt.so' 'libZydis.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.txt
}
