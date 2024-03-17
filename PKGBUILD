# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Yamakaky <yamakaky@yamaworld.fr>
pkgname=bloaty-git
pkgver=1.1.r264.g22a83c0
pkgrel=1
pkgdesc='A size profiler for binaries'
arch=(x86_64 i686)
url=https://github.com/google/bloaty
license=(Apache)
depends=(re2 capstone protobuf abseil-cpp)
makedepends=(git cmake ninja)
conflicts=(bloaty)
source=("${pkgname}::git+${url}"
        bloaty-no-bundled-sources.patch)
b2sums=('SKIP'
        '4093cf847b4c42e5a82b7e3e5e801cc81bb8f9d4a4e431ba35e6edb7079891096ab3675aac6ca5b409560d00a8755fdbfd9a53978280f71cb84aaa5ba009d46a')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	git apply "${srcdir}/bloaty-no-bundled-sources.patch"
}

build() {
    rm -rf build
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=OFF \
        -DBLOATY_ENABLE_CMAKETARGETS=OFF \
        -S"${srcdir}/${pkgname}" -Bbuild
	ninja -Cbuild
}

package() {
    cd "${srcdir}/build"
    install -Dm755 "${srcdir}/build/bloaty" \
        "${pkgdir}/usr/bin/bloaty"
    install -Dm644 "${srcdir}/${pkgname}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
