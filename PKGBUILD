pkgname=ida-pro-plugin-fakepdb-git
pkgver=0.2.r72.66996d9
pkgrel=1
pkgdesc="IDA Pro plugin: Tool for PDB generation from IDA Pro database"
#url="https://github.com/Mixaill/FakePDB"
url="https://github.com/p0358/FakePDB"
depends=()
makedepends=(llvm)
license=(Apache-2.0)
arch=(any)
#source=("$pkgname::git+${url}.git")
source=("$pkgname::git+${url}.git#branch=patch-linux")
sha256sums=(SKIP)

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cmake "$pkgname/src_cpp/" \
		-B"./~build/fakepdb_build_ninja" \
		-GNinja \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_INSTALL_PREFIX="./~build/fakepdb_install"
}

build() {
	cmake --build "./~build/fakepdb_build_ninja" --parallel
}

package() {
	cmake --install "./~build/fakepdb_build_ninja"

	local bin_dir_name="$(echo -n "$(uname -s)_$(uname -m)" | tr '[:upper:]' '[:lower:]')"
	echo bin_dir_name="$bin_dir_name"

	install -Dm644 "$pkgname"/src_plugins/ida/fakepdb.py -t "$pkgdir"/opt/ida-pro/plugins/
	cp -r "$pkgname"/src_plugins/ida/fakepdb "$pkgdir"/opt/ida-pro/plugins/

	install -Dm755 "./~build/fakepdb_install/bin"/* -t "$pkgdir"/opt/ida-pro/plugins/fakepdb/"$bin_dir_name"/

	install -Dm644 "$pkgname"/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
