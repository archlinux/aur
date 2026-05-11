# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: henry0w <hwelles@protonmail.com>
pkgname=clspv-git
pkgver=r1107.119770b
_pkgname=clspv
pkgrel=1
pkgdesc="A prototype compiler for a subset of OpenCL C to Vulkan compute shaders"
arch=('x86_64')
url="https://github.com/google/clspv.git"
license=('Apache-2.0')
depends=('glibc' 'libstdc++' 'zlib' 'libgcc' 'zstd')
makedepends=('cmake'  'python' 'git' 'spirv-tools' 'spirv-headers' 'ninja' 'clang'
	     'lld')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("git+https://github.com/google/clspv.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname::-4}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname::-4}"
	# Temp set git identity in repo to avoid errors
	GIT_AUTHOR_NAME="fart" \
	GIT_AUTHOR_EMAIL="fart@swag.org" \
	GIT_COMMITTER_NAME="swag" \
	GIT_COMMITTER_EMAIL="swag@fart.org" \
	python utils/fetch_sources.py --shallow
}

build() {
	cd "${srcdir}"
	cmake -B build -S ${pkgname::-4} -GNinja \
        -DCMAKE_BUILD_TYPE= \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_FLAGS="${CFLAGS} -flto=thin" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
        -Wno-dev

	cmake --build build
}


package() {
	DESTDIR="${pkgdir}" cmake --install build
}
