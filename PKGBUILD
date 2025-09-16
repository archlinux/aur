# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: Aki-nyan <aur@catgirl.link>

pkgname=prjtrellis-git-pinned
pkgver=1.5_alpha20250914
pkgrel=1
epoch=1
pkgdesc="Documenting the Lattice ECP5 bit-stream format."
arch=("x86_64")
url="https://github.com/YosysHQ/prjtrellis"
license=("custom:ISC" "MIT")
groups=()
options=("!strip")
provides=("prjtrellis-db" "prjtrellis")
depends=("boost-libs" "python")
optdepends=()
makedepends=("git" "gcc" "cmake" "ninja" "pkgconf" "boost")
conflicts=(
	"prjtrellis-nightly"
	"prjtrellis-db-git"
	"prjtrellis-git"
	"prjtrellis-db"
	"prjtrellis"
)
replaces=()
source=(
	"prjtrellis::git+https://github.com/YosysHQ/prjtrellis.git#commit=92345b77edf775fe5668700dd9931e19db2d36b0"
	"prjtrellis-db::git+https://github.com/YosysHQ/prjtrellis-db.git#commit=015e0330630d7c238c0e4f2cdd9c8157eb78c54a"
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
