# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=ebus-sdk
pkgdesc="toolset for digital video systems and cameras"
pkgver=3.1.14.3284
pkgrel=1
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
	"GEVPlayer"
	"PvDualSourceSample"
)

sha512sums=('3f10ae59550f7358088c048200c10a336d95d365549d861da12fa03fbfea14b507268bf3ba8db40f290aafbcb9b5430f2158fbadaeeda40cdd11fa5a20edce75'
            '27e1dfab6446969b8e5b3e5b09fbcaf29998678aeea8fdf0b12e0bd99b086236d2135a43d8a4b6463366f3e97bc667faed55e54f17fa6fb76b25dee15dda8477'
            'fa881d1a4d8e255e7c782bdf3b82478761837af234d152d0a1bc808cc05a79298edf504aa1e33e9b15d6723c9c0ffdfb6258719966d0225f3b2278f95a0e63c5')

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

	_install_dir  "$dir/include" "$target_dir/include" 755
	_install_dir  "$dir/bin"     "$target_dir/bin"     755
	_install_dir  "$dir/lib"     "$target_dir/lib"     755
	_install_dir  "$dir/share"   "$target_dir/share"   755

	#rm "$target_dir/lib/libapr-1.so"*
	#rm "$target_dir/lib/libaprutil-1.so"*
	#rm "$target_dir/lib/liblog4cxx.so.10.0.0"
	rm -rf "$target_dir/lib/genicam"

	_install_dir  "$dir/lib/genicam/bin/Linux64_x64" "$target_dir/lib/genicam"       755
	_install_dir  "$dir/lib/genicam/xml"             "$target_dir/share/genicam/xml" 755
	_install_dir  "$dir/lib/genicam/log"             "$target_dir/share/genicam/log" 755

	find "$pkgdir" -name '.svn' -prune -exec rm -rf '{}' ';'

	_shrink_rpaths "$target_dir/lib/"*
	_shrink_rpaths "$target_dir/lib/genicam/"*
	_shrink_rpaths "$target_dir/lib/genicam/GenApi/Generic/"*

	install -m 755 -t "$target_dir/bin" "$srcdir/GEVPlayer"
	install -m 755 -t "$target_dir/bin" "$srcdir/PvDualSourceSample"
}
