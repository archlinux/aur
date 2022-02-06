# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=crex
pkgver=0.2.5
pkgrel=4
pkgdesc='Explore, test, and check regular expressions in the terminal'
arch=('x86_64')
url='https://octobanana.com/software/crex'
license=('MIT')
makedepends=('cmake')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/octobanana/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	'0001-ArchLinux-changes-to-CMakeLists.txt.patch')
sha256sums=('c6a166b7a1e696a7babeaf7c5728eece1624704a18357f827129fc95ef2ecc56'
            '407177d9486ca4758b0853114cfaa88aeafdb862c07c3ba683f017fbc79c9c18')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch --forward --strip=1 \
          --input="${srcdir}/0001-ArchLinux-changes-to-CMakeLists.txt.patch"
}

build() {
    # -DNDEBUG prevents (assert) file paths being compiled into the binary
    # See: https://wiki.archlinux.org/title/CMake_package_guidelines#CMake_undesired_behaviors
    CFLAGS="${CFLAGS} -DNDEBUG" CXXFLAGS="${CXXFLAGS} -DNDEBUG" \
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_RPATH='TRUE'
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
