# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=mistral-nightly
pkgver=20240411_d509238
pkgrel=1
epoch=1
pkgdesc="Cyclone V bitstream reverse-engineering project"
arch=("x86_64")
url="https://github.com/Ravenslofty/mistral"
license=("BSD-3-Clause")
groups=()
options=("!strip")
depends=("python")
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "python")
conflicts=(
	"mistral-git"
)
replaces=()
source=(
	"mistral::git+https://github.com/Ravenslofty/mistral.git#commit=d509238"
)
sha256sums=(
	"SKIP"
)


_PREFIX="/usr"
prepare() {
	cd "${srcdir}/mistral"
	[ ! -d "${srcdir}/mistral/build" ] && mkdir build
}

build() {
	cd "${srcdir}/mistral"
	cd build
	cmake -G Ninja \
		-DCMAKE_INSTALL_PREFIX=${_PREFIX} \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCOMPRESSION_LEVEL=9 \
		..
	ninja

}

package() {
	cd "${srcdir}/mistral"
	DESTDIR="${pkgdir}" PREFIX="${_PREFIX}" ninja -C build install
	install -Dm644 "${srcdir}/mistral/LICENSE" "${pkgdir}${_PREFIX}/share/licenses/mistral/LICENSE"
}
