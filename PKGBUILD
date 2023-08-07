# Maintainer: phiresky <phireskyde+git@gmail.com>
_pkgname=svp
pkgname=svp-bin
pkgver=4.5.210
_pkgver=${pkgver}-2
pkgrel=5
epoch=
pkgdesc="SmoothVideo Project 4 (SVP4)"
arch=('x86_64')
url="https://www.svp-team.com/wiki/SVP:Linux"
license=('custom')
groups=()
depends=(libmediainfo qt5-svg qt5-script qt5-declarative vapoursynth libusb xdg-utils lsof)
makedepends=(p7zip)
checkdepends=()
# Youtube-dl is bundled with SVP in extensions directory
optdepends=(
	'mpv-git: needed for mpv vapoursynth support'
	'ocl-icd: for GPU acceleration'
	'python-certifi: youtube-dl extension - Basic support'
	'python-pycryptodomex: youtube-dl extension - For decrypting AES-128 HLS streams and various other data'
	'python-websockets: youtube-dl extension - For downloading over websocket'
)
provides=('svp')
conflicts=()
replaces=()
backup=()
options=(!strip)
install=${pkgname}.install
changelog=
#source=("https://gist.githubusercontent.com/phiresky/1e2cbd30bed4e5978771af232d11afd1/raw/svp4-linux.$pkgver.tar.bz2")
source=("https://www.svp-team.com/files/svp4-linux.${_pkgver}.tar.bz2")
# I am rehosting the binaries taken from
# http://www.svp-team.com/files/svp4-linux-64.tbz2
# at https://gist.github.com/phiresky/1e2cbd30bed4e5978771af232d11afd1
# so they are correctly versioned and old versions still exist
# update 2019-10-06: svp-team.com now uses versioned file names.
# I'll keep rehosting them for now since i don't trust them to actually keep old versions.
noextract=()
sha256sums=('758f6e43d8f34c788dd974a73ab5ed1c3d75208256eadf415331864057d9fb28')
validpgpkeys=()

prepare() {
	rm -rf "$srcdir/installer"
	mkdir "$srcdir/installer"
	echo "Finding 7z archives in installer..."
	LANG=C grep --only-matching --byte-offset --binary --text  $'7z\xBC\xAF\x27\x1C' "$srcdir/svp4-linux-64.run" |
		cut -f1 -d: |
		while read ofs; do dd if="$srcdir/svp4-linux-64.run" bs=1M iflag=skip_bytes status=none skip=$ofs of="$srcdir/installer/bin-$ofs.7z"; done

	echo "Extracting 7z archives from installer..."
	for f in "$srcdir/installer/"*.7z; do
		7z -bd -bb0 -y x -o"$srcdir/extracted/" "$f" || true
	done
}

#pkgver() {
#	xmllint --xpath '/Updates/PackageUpdate[Name="core.full"]/Version/text()' "$srcdir/installer/metadata/Updates.xml" | tr '-' '.'
#}

package() {
	mkdir -p "$pkgdir"/{opt/svp,usr/bin,usr/share/licenses/svp}
	if [[ -d "$srcdir/extracted/licenses" ]]; then
		mv "$srcdir/extracted/licenses" "$pkgdir/usr/share/licenses/${_pkgname}"
	fi
	mv "$srcdir/extracted/"* "$pkgdir/opt/${_pkgname}"
	# rm "$pkgdir/opt/$pkgname/extensions/libsvpcode.so" # previously this extension caused the whole thing to segfault. lmk if that's still the case
	ln -s "/opt/${_pkgname}/SVPManager" "$pkgdir/usr/bin/SVPManager"
	chmod -R +rX "$pkgdir/opt/svp" "$pkgdir/usr/share"
}
