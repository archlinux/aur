# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=prjtrellis-nightly
pkgver=20230708_1.4_4_ge830a28
pkgrel=1
epoch=1
pkgdesc="Documenting the Lattice ECP5 bit-stream format."
arch=("x86_64")
url="https://github.com/YosysHQ/prjtrellis"
license=("custom:ISC" "MIT")
groups=()
options=("!strip")
depends=("boost-libs" "python")
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "boost")
conflicts=(
	"prjtrellis-db-git"
	"prjtrellis-git"
	"prjtrellis-db"
	"prjtrellis"
)
replaces=()
source=(
	"prjtrellis::git+https://github.com/YosysHQ/prjtrellis.git#commit=e830a28"
	"prjtrellis-db::git+https://github.com/YosysHQ/prjtrellis-db.git#commit=ce8cdaf"
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
	git -c protocol.file.allow=always submodule update
	[ ! -d "${srcdir}/prjtrellis/libtrellis/build" ] && mkdir -p libtrellis/build

}

build() {
	cd "${srcdir}/prjtrellis/libtrellis"
	cd ./build
	cmake -G Ninja -DCMAKE_INSTALL_PREFIX=${_PREFIX} ..
	ninja

}

package() {
	cd "${srcdir}/prjtrellis/libtrellis"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 "${srcdir}/prjtrellis/COPYING" "${pkgdir}${_PREFIX}/share/licenses/trellis/COPYING"
	install -D "${srcdir}/prjtrellis/tools/bit_to_svf.py" "${pkgdir}${_PREFIX}/share/trellis/tools/bit_to_svf.py"
	cd ..
}
