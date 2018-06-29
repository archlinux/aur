# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ebus-sdk
pkgdesc="toolset for digital video systems and cameras"
pkgver=3.1.14.3284
pkgrel=2
arch=(x86_64)
license=(custom)
depends=(
	curl
	log4cxx
)
optdepends=(
	'qt4: for GUI tools'
)
url='https://www.pleora.com/products/ebus-sdk/'

source=(
	"$pkgname-$pkgver.tar.bz2::http://www.photonfocus.com/fileadmin/web/downloads/ebus_sdk_${pkgver}_rhel-6-$CARCH.zip"
	"ebus-sdk-config.cmake"
	"ebus-sdk-config-version.cmake"
)

sha512sums=('3f10ae59550f7358088c048200c10a336d95d365549d861da12fa03fbfea14b507268bf3ba8db40f290aafbcb9b5430f2158fbadaeeda40cdd11fa5a20edce75'
            'c001730965a5cc01e292b2e6768bd9d44f6ab763f51b486be29b0b5e5b40e1d3333a3e3f9cd1deb762967ea4e873e5af36fe796f89ca159429973cce96385dc7'
            'f2e263c1a4521fb323091237227c8be5bd9186a18aca3e96ab7f82bf767e88ce677078a5ba0d30fb9c2624d9721af6c16fa0b2d02e59ca61b3d7af26676a7993')

_install_dir() {
	local source_root="$1"
	local target_root="$2"
	local mode="$3"


	for file in $(find "$source_root" -type f -o -type l); do
		local target_file="$target_root/${file#${source_root}/}"
		local target_dir="$(dirname "$target_file")"
		mkdir -p "$target_dir"
		cp -nP "$file" "$target_file" || return 1
		[[ -f "$target_file" ]] && chmod "$mode" "$target_file"
	done
}

_shrink_rpaths() {
	for file in "$@"; do
		local type="$(file -hb "$file")"
		[[ "${type:0:4}" = "ELF " ]] || continue
		patchelf --shrink-rpath "$file"
	done
}

prepare() {
	"$srcdir/eBUS_SDK_${pkgver}_RHEL-6-$CARCH.run" --noexec --target "$srcdir"
}

package() {
	local dir="$srcdir"
	local target_dir="$pkgdir/opt/ebus-sdk"

	_install_dir  "$dir/include" "$target_dir/include/ebus-sdk" 644
	_install_dir  "$dir/bin"     "$target_dir/bin"              755
	_install_dir  "$dir/lib"     "$target_dir/lib"              755
	_install_dir  "$dir/share"   "$target_dir/share"            644

	find "$pkgdir" -name '.svn' -prune -exec rm -rf '{}' ';'

	_shrink_rpaths "$target_dir/lib/"*
	_shrink_rpaths "$target_dir/lib/genicam/bin/Linux64_x64/"*
	_shrink_rpaths "$target_dir/lib/genicam/bin/Linux64_x64/GenApi/Generic/"*

	install -m 644 -Dt "$pkgdir/usr/lib/cmake/$pkgname" "$srcdir/$pkgname-config.cmake"
	install -m 644 -Dt "$pkgdir/usr/lib/cmake/$pkgname" "$srcdir/$pkgname-config-version.cmake"
}
