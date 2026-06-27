# Maintainer: ORION MELAENO <midway64@proton.me>
# I am a rookie at these, so please let me know if there's any issues or redundancies to fix.

pkgname=elfbsp
pkgver=1.2
pkgrel=1
pkgdesc="Modern BSP tree builder for idTech1 games and source ports. Based on Andrew Apted's AJBSP."
arch=('x86_64')
url="https://elf-alchemist.github.io/elfbsp/"
license=('GPL-2.0-or-later')
depends=() # Don't know whether the dependencies should go here or at {makedepends}.
makedepends=('git' 'glibc' 'libgcc' 'libstdc++' 'cmake' 'make')
provides=('elfbsp')
conflicts=('elfbsp-bin' 'elfbsp-nightly-bin' 'elfbsp-git') # Future-proofing, if I or someone else ever do these.
source=("https://github.com/elf-alchemist/elfbsp/archive/refs/tags/${pkgname}_v${pkgver}.tar.gz")
sha256sums=('18849fdb845d7e5382bc9a69c1adcb0f49e151ffebed88437bbc90c912497997')

# Building with GCC (instead of Clang - as upstream prefers) since I struggle convincing CMake to read
# the environment flags, as it just skips the Clang compiler and uses GCC nevertheless. (GCC is cool, anyway.)
# Suggestions for this issue are welcome.
build() {
	local cmake_options=(
		-B build
		-D CMAKE_INSTALL_PREFIX=/usr
	)

	cd "${srcdir}/elfbsp-elfbsp_v${pkgver}"
	cmake "${cmake_options[@]}"
	make all -C build
}

package() {
	cd "${srcdir}/elfbsp-elfbsp_v${pkgver}"
	make DESTDIR="$pkgdir/" install -C build
}
