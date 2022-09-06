# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_pkgname='wxtoimg'
pkgname="$_pkgname-beta"
pkgver='2.11.2'
pkgrel='9'
pkgdesc='Software to decode APT and WEFAX signals from weather satellites'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://${_pkgname}restored.xyz/beta"
license=('custom')
depends=('alsa-lib' 'fontconfig' 'libx11' 'libxft' 'tcl85')
makedepends=('imagemagick' 'xxd')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/$_pkgname-linux-amd64-$pkgver-beta.tar.gz")
source_i686=("$pkgname-$pkgver-$pkgrel-i686.tar.gz::$url/$_pkgname-linux-i386-$pkgver-beta.tar.gz")
source_armv6h=("$pkgname-$pkgver-$pkgrel-armv6h.tar.gz::$url/$_pkgname-linux-armhf-$pkgver-beta.tar.gz")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.tar.gz::$url/$_pkgname-linux-armhf-$pkgver-beta.tar.gz")
source=('LICENSE')
sha512sums=('91339b0071ab768135d2dd3823e9ea1fd56aa03bc20a441718aa01049e521f7acab4306666f112f7cce7859e4496bc8e7aa22799d0ef224759ac3901dbfe8d62')
sha512sums_x86_64=('ef0ee0c94723e2335689ef16ae7167f18e5c5bcefca2c47c3a37528834c470f28ba7c62fa6b8253ed77ce34df8fd75b400287272dd0f2d5fc4f125148d35cc08')
sha512sums_i686=('e5e48c4f1f5a4a53c4029c2507c3e3f530851a28d7a59f296d4f6933decbf45ef6255e35776493ed9e673bb526f72b4008479b6aff687d26be3f2c07a434798a')
sha512sums_armv6h=('6ff3ec0b3aa10ce6c5ae204adc41a4a05e0c5004f0a03f32dde8e5817e6112979e5059d033e1ada3a7892a5b9ee7bb309e355f996f12156eea54e5f819db5690')
sha512sums_armv7h=('6ff3ec0b3aa10ce6c5ae204adc41a4a05e0c5004f0a03f32dde8e5817e6112979e5059d033e1ada3a7892a5b9ee7bb309e355f996f12156eea54e5f819db5690')

_binaries=('wxbatch' 'wxmap' 'wxproj' 'wxrec' "$_pkgname")
_man_page_langs=('de' 'es' 'fr' 'ja' 'pl')

# Based on https://everydaywithlinux.blogspot.com/2012/11/patch-strings-in-binary-files-with-sed.html
_replace() {
	# Check if we can replace the provided pattern with the provided replacement
	if [ "${#3}" -gt "${#2}" ]; then
		echo "Unable to replace, as '$3' is longer than '$2', skipping"
		return
	fi

	# Get strings that contain the pattern from the binary and sort them descending by length
	_strings="$(strings "$1" | grep "$2" | awk '{ print length, $0 }' | sort -n -r | cut -d" " -f2-)"

	if [ -n "$_strings" ] ; then
        echo "Replacing '$2' with '$3' in $1"
		_replace_counter=0

		# Convert the file to hex
		hexdump --no-squeezing --format '1/1 "%.2x "' "$1" | sed 's/[[:space:]]*$//' > "$1.tmp.hex"

		while IFS= read -r _old; do
			# Prepare the new string
			_new="${_old//$2/$3}"
			echo "Found '$_old', replacing with '$_new'"

			# Create hex representations of both strings
			_old_hex="$(echo -n "$_old" | hexdump --no-squeezing --format '1/1 "%.2x "' | sed 's/[[:space:]]*$//')"
			_new_hex="$(echo -n "$_new" | hexdump --no-squeezing --format '1/1 "%.2x "' | sed 's/[[:space:]]*$//')"

			# Get the padding we want to use
			_length_diff="$((${#_old_hex}-${#_new_hex}))"

			if [ "$_length_diff" -gt 0 ]; then
				_padding_length="$((($_length_diff+1)/3))"
				_padding="$(printf '%.s 00' $(seq 1 "$_padding_length"))"
			else
				_padding=''
			fi

			# Check if we're doing a complete or a partial string replacement
			if grep -q "${_old_hex} 00" "$1.tmp.hex"; then
				# We found a null terminated variant of this string, just replace it with the new string, padded
				sed -i "s/${_old_hex} 00/${_new_hex}${_padding} 00/g" "$1.tmp.hex"
			# else
				# The string we're replacing is a partial one, replace the string itself and prepend the padding to the first NUL after the string
				# TODO: this breaks binaries
				# sed -E -i "s/${_old_hex}(.*) 00/${_new_hex}\1${_padding} 00/g" "$1.tmp.hex"
			fi

			# Increase replace counter
			_replace_counter=$((_replace_counter+1))
		done <<< "$_strings"

		echo "Replaced occurrences of $_replace_counter matching strings"

		# Convert the file back to binary and replace the original file
		sed -i 's/[[:space:]]//g' "$1.tmp.hex"
		xxd -revert -plain "$1.tmp.hex" > "$1.tmp.bin"
		chmod --reference "$1" "$1.tmp.bin"
		rm --force "$1" "$1.tmp.hex"
		mv "$1.tmp.bin" "$1"
	fi
}

prepare() {
	cd "$srcdir/"

	# Fix desktop file binary and icon paths
	sed -E -i -e "s|Exec=/usr/local/bin/x$_pkgname|Exec=/usr/bin/x$_pkgname|" -e "s|Icon=/usr/share/icons/$_pkgname.xbm|Icon=$_pkgname|" "etc/X11/applnk/Applications/$_pkgname.desktop"

	# Replace strings in binaries and man pages
	for _binary in "${_binaries[@]}"; do
		# Replace strings in all binaries except wxbatch, as that's a bash script and has no strings to replace
		if [ "$_binary" != 'wxbatch' ]; then
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/etc' '/etc'
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/lib/wx' '/usr/share/wx'
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/bin' '/usr/bin'
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/man' '/usr/share/man'
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/include' '/usr/include'

			# TODO: this causes a segfault, disable for now
			# _replace "$srcdir/usr/local/bin/$_binary" '/usr/local/lib/tcl8.5' '/usr/lib/tcl8.5'

			# TODO: Haven't figured out what files wxtoimg is trying to reach with this, just remove the local part for now
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/lib/proj.4' '/usr/lib/proj.4'

			# Replace /usr/local/lib last so that we don't mess up the rest of the path replacements
			# TODO: this can't be enabled until the tcl replacement is fixed
			# _replace "$srcdir/usr/local/bin/$_binary" '/usr/local/lib' '/usr/lib'

			# On 2022/07/04 celestrak.com (provider of Keplers) moved to celestrak.org
			# TODO: wxtoimg still sends requests to celestrak.com after this replacement, so there's something else going on
			_replace "$srcdir/usr/local/bin/$_binary" 'www.celestrak.com' 'www.celestrak.org'
		fi

		# Replace paths in man pages
		sed -i -e 's|/usr/local/etc|/etc|g' -e 's|/usr/local/lib/wx|/usr/share/wx|g' "usr/local/man/man1/$_binary.1"
	done

	# Replace CelesTrak URL in translated xwtoimg man pages
	for _language in "${_man_page_langs[@]}"; do
		sed -i 's|www.celestrak.com|www.celestrak.org|g' "usr/local/lib/wx/man/${_language}_x$_pkgname.1"
	done

	# Add proper categories to the desktop file
	echo 'Categories=HamRadio;Utility' >> "etc/X11/applnk/Applications/$_pkgname.desktop"

	# Create a PNG version of the icon
	convert "usr/share/icons/$_pkgname.xbm" "usr/share/icons/$_pkgname.png"
}

package() {
	cd "$srcdir/"

	# Copy binaries & main man pages
	for _binary in "${_binaries[@]}"; do
		install -Dm755 "usr/local/bin/$_binary" "$pkgdir/usr/bin/$_binary"
		install -Dm644 "usr/local/man/man1/$_binary.1" "$pkgdir/usr/share/man/man1/$_binary.1"
	done
	ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/bin/x$_pkgname"

	# Copy shared resources
	install -dm755 "$pkgdir/usr/share/"
	cp -r --no-preserve=ownership --preserve=mode 'usr/local/lib/wx/' "$pkgdir/usr/share/wx/"

	# Copy translated man pages
	for _language in "${_man_page_langs[@]}"; do
		install -dm755 "$pkgdir/usr/share/man/$_language/man1/"

		for _manpage in 'wxcalibrate' 'wxfaq' 'wxrego' "x$_pkgname"; do
			ln -sf "/usr/share/wx/man/${_language}_$_manpage.1" "$pkgdir/usr/share/man/$_language/man1/$_manpage.1"
		done
	done

	# Copy LICENSE, desktop file and icon
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "etc/X11/applnk/Applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/icons/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
