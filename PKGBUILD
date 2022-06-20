# Maintainer: Aki-nyan <aur@catgirl.link>

pkgname=prjoxide-nightly
pkgver=20220620_d1fc5cd
pkgrel=1
epoch=1
pkgdesc="Documenting Lattice's 28nm FPGA parts"
arch=("x86_64")
url="https://github.com/gatecat/prjoxide"
license=("custom:ISC")
groups=()
options=("!strip")
depends=()
optdepends=()
makedepends=("git" "cargo")
conflicts=(
	"prjoxide-git"
)
replaces=()
source=(
	"prjoxide::git+https://github.com/gatecat/prjoxide.git#commit=d1fc5cd"
	"prjoxide-db::git+https://github.com/gatecat/prjoxide-db.git#commit=1566e0d"
)
sha256sums=(
	"SKIP"
	"SKIP"
)


_PREFIX="/usr"
prepare() {
	cd "${srcdir}/prjoxide"
	git submodule init
	git config submodule.database.url "$srcdir/prjoxide-db"
	git submodule update
}

build() {
	cd "${srcdir}/prjoxide/libprjoxide"
	cargo build --release
}

package() {
	install -Dm755 "${srcdir}/prjoxide/libprjoxide/target/release/prjoxide" "${pkgdir}${_PREFIX}/bin/prjoxide"
	install -Dm644 "${srcdir}/prjoxide/libprjoxide/target/release/libpyprjoxide.so" "${pkgdir}${_PREFIX}/lib/libpyprjoxide.so"
	install -Dm644 "${srcdir}/prjoxide/COPYING" "${pkgdir}${_PREFIX}/share/licenses/prjoxide/COPYING"
}
