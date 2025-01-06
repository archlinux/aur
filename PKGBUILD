# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Matthew McGinn <mamcgi@gmail.com>
_pkgname='wxtoimg'
pkgname="$_pkgname-beta"
pkgver='2.11.2'
pkgrel='11'
pkgdesc='Software to decode APT and WEFAX signals from weather satellites'
arch=('x86_64' 'i686' 'pentium4' 'armv7h')
url="https://${_pkgname}restored.xyz/beta"
license=('LicenseRef-WXtoImgLicense')
depends=('alsa-lib' 'fontconfig' 'libx11' 'libxft')
makedepends=('imagemagick' 'perl' 'xxd')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/$_pkgname-linux-amd64-$pkgver-beta.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/$_pkgname-linux-i386-$pkgver-beta.tar.gz")
source_pentium4=("$pkgname-$pkgver-pentium4.tar.gz::$url/$_pkgname-linux-i386-$pkgver-beta.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/$_pkgname-linux-armhf-$pkgver-beta.tar.gz")
source=('LICENSE')
b2sums=('20302805a1660d3897a430d10d8a0c793b5fa5688a8be766fa08cc115b84bfc93d445aa01fe59c164d16a1479489e54ff84e3ce840f3ca6a80c9670efc792290')
b2sums_x86_64=('5c36e56336453e109678afdd46db2c6ddb8a7c8c30985137ea68a2daff05c349459f90dd5660650a0dfc377661ea974df42fa06a40e595d4bf20594286879e72')
b2sums_i686=('e0fee39c4785f3f2c20e358e3e2ce4fe70843fd53bc77a19f98743a08cf1d0f4affd212a30afacbca058dfb3a72c35991dc999cd11339a88d47dfc4c7fd08aee')
b2sums_pentium4=('e0fee39c4785f3f2c20e358e3e2ce4fe70843fd53bc77a19f98743a08cf1d0f4affd212a30afacbca058dfb3a72c35991dc999cd11339a88d47dfc4c7fd08aee')
b2sums_armv7h=('e6cf6bdd543bf9ab022c1639d647acdc8504664e143c138cd909c5f5c299b879a86d3828478a3a2a933aa2e8f9df7387becb3c9d8fda92ee2f3718ea33be372b')

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
			# wxtoimg throws a segfault if the tcl path is changed, no matter if it exists or not, make sure we don't change it'
			# TODO: figure out how to make tcl work so that this is not needed
			if [[ "$_old" =~ '/usr/local/lib/tcl8.5' ]]; then
				continue
			fi

			# Prepare the new string
			_new="${_old//$2/$3}"
			echo "Found '$_old', replacing with '$_new'"

			# Create hex representations of both strings
			_old_hex="$(echo -n "$_old" | hexdump --no-squeezing --format '1/1 "%.2x "' | sed 's/[[:space:]]*$//')"
			_new_hex="$(echo -n "$_new" | hexdump --no-squeezing --format '1/1 "%.2x "' | sed 's/[[:space:]]*$//')"

			# Get the padding we want to use
			_length_diff="$((${#_old_hex}-${#_new_hex}))"

			if [ "$_length_diff" -gt 0 ]; then
				_padding_count="$((($_length_diff+1)/3))"
				_padding="$(printf '%.s 00' $(seq 1 "$_padding_count"))"
			else
				_padding=''
			fi

			# Check if we're doing a complete or a partial string replacement
			if grep -q "${_old_hex} 00" "$1.tmp.hex"; then
				# We found a null terminated variant of this string, just replace it with the new string, padded
				sed -i "s/${_old_hex} 00/${_new_hex}${_padding} 00/g" "$1.tmp.hex"
			else
				# The string we're replacing is a partial one, replace the string itself and prepend the padding to the first NUL after the string
				# We can't use sed for this, as it doesn't support lazy (non-greedy) quantifiers
				perl -i -pe "s/${_old_hex}(.*?) 00/${_new_hex}\1${_padding} 00/g" "$1.tmp.hex"
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
			_replace "$srcdir/usr/local/bin/$_binary" '/usr/local/lib' '/usr/lib'

			# On 2022/07/04 celestrak.com (provider of Keplers) moved to celestrak.org
			_replace "$srcdir/usr/local/bin/$_binary" 'www.celestrak.com' 'www.celestrak.org'

			# TODO: figure out which file from the proj package wxtoimg needs and replace the path accordingly
			# TODO: wxtoimg still sends requests to celestrak.com after the replacement we do, fix
			# TODO: wxtoimg still writes the original /usr/local/lib/wx to ~/.wxtoimgrc, fix
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
	magick "usr/share/icons/$_pkgname.xbm" "usr/share/icons/$_pkgname.png"
}

check() {
	_checkoutput="$(printf 'NO' | "$srcdir/usr/local/bin/$_pkgname" 2>&1 || :)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -i -q "$_pkgname"
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
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/WXtoImgLicense"
	install -Dm644 "etc/X11/applnk/Applications/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm644 "usr/share/icons/$_pkgname.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
