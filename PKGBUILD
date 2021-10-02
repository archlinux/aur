# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=prjtrellis-nightly
pkgver=1.1_20211002
pkgrel=1
epoch=1
pkgdesc="Documenting the Lattice ECP5 bit-stream format."
arch=("any")
url="https://github.com/YosysHQ/prjtrellis"
license=("")
groups=()
options=("!strip")
depends=("boost-libs" "python")
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf")
conflicts=(
	"prjtrellis-db-git"
	"prjtrellis-git"
	"prjtrellis-db"
	"prjtrellis"
)
replaces=(
	"prjtrellis-db-git"
	"prjtrellis-git"
	"prjtrellis-db"
	"prjtrellis"
)
source=(
	"prjtrellis::git+https://github.com/YosysHQ/prjtrellis.git"#commit=03e0070
	"prjtrellis-db::git+https://github.com/YosysHQ/prjtrellis-db.git"#commit=fdf4bf2
)
sha256sums=(
	"SKIP"
	"SKIP"
)

_PREFIX="/usr"
prepare() {
	cd "${srcdir}/prjtrellis"
	git submodule init
	git config submodule.database.url "$srcdir/prjtrellis-db"
	git submodule update
	[ ! -d "${srcdir}/prjtrellis/libtrellis/build" ] && mkdir -p libtrellis/build
	cd ..
}

build() {
	cd "${srcdir}/prjtrellis/libtrellis"
	cd ./build
	cmake -G Ninja -DCMAKE_INSTALL_PREFIX=${_PREFIX} ..
	cd ..
	ninja -C build
	cd ..
}

package() {
	cd "${srcdir}/prjtrellis/libtrellis"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${srcdir}/prjtrellis/COPYING" "${pkgdir}${_PREFIX}/share/licenses/trellis/COPYING"
	install -D "${srcdir}/prjtrellis/tools/bit_to_svf.py" "${pkgdir}${_PREFIX}/share/trellis/tools/bit_to_svf.py"
	cd ..
}
