# Maintainer: Martin Rys <rys.rs/contact>
# Maintainer: phiresky <phireskyde+git@gmail.com>
_pkgname=svp
pkgname=svp-bin
pkgver=4.7.305
_pkgver=${pkgver}-1
pkgrel=1
epoch=
pkgdesc="SmoothVideo Project 4 (SVP4)"
arch=('x86_64')
url="https://www.svp-team.com/wiki/SVP:Linux"
license=('LicenseRef-custom')
depends=(
	libmediainfo
	libusb
	lsof
	vapoursynth
	qt6-svg
	#qt5-script
	#qt5-declarative
	xdg-utils
)
makedepends=(p7zip)
# Youtube-dl is bundled with SVP in extensions directory
optdepends=(
	'mpv: Video player'
	'ocl-icd: for GPU acceleration'
	'python38: SVPTube extension - Basic support'
	'python-certifi: youtube-dl extension - Basic support'
	'python-pycryptodomex: youtube-dl extension - For decrypting AES-128 HLS streams and various other data'
	'python-websockets: youtube-dl extension - For downloading over websocket'
	'vlc: Video player'
)
provides=('svp')
conflicts=('svp')
options=(!strip)
install=${pkgname}.install
#source=("https://gist.githubusercontent.com/phiresky/1e2cbd30bed4e5978771af232d11afd1/raw/svp4-linux.$pkgver.tar.bz2")
source=(
	"https://www.svp-team.com/files/svp4-linux.${_pkgver}.tar.bz2"
	"svp-${pkgver}_core.full_libs.7z::http://cdn.svp-team.com/repo/full-lin64/core.full/4.7.0.305-3libs.7z"
	"svp-${pkgver}_core.full_licenses.7z::http://cdn.svp-team.com/repo/full-lin64/core.full/4.7.0.305-3licenses.7z"
	"svp-${pkgver}_core.full_content.7z::http://cdn.svp-team.com/repo/full-lin64/core.full/4.7.0.305-3content.7z"
)
# I am rehosting the binaries taken from
# http://www.svp-team.com/files/svp4-linux-64.tbz2
# at https://gist.github.com/phiresky/1e2cbd30bed4e5978771af232d11afd1
# so they are correctly versioned and old versions still exist
# update 2019-10-06: svp-team.com now uses versioned file names.
# I'll keep rehosting them for now since i don't trust them to actually keep old versions.
sha256sums=('6bd83a03ac43cb1efb0e252d12bc379cb6e8b6037b4b4973017ce977b1b2925e'
            '93a7e51c83e32c3d924e164fa93c6d6a853946b5cd483701f838553ea5c86c93'
            '5de77a2b8a970cd6fa7a7024bf55e9bf082cc234beb16ad87913493c7be047a5'
            '3fb0c65b7c2ae00b9d7d6b1516013f1b989742f406d415498a34f324292f36b8')

# The installer GUI has an option to install a bunch of packages, which are gotten from here:
# http://cdn.svp-team.com/repo/full-lin64/Updates.xml   -> https://www.svp-team.com/files/repo/full-lin64/Updates.xml?full=main
# http://cdn.svp-team.com/repo/common-lin64/Updates.xml -> https://www.svp-team.com/files/repo/common-lin64/Updates.xml?full=main

# The download links then look like this:
# http://cdn.svp-team.com/repo/full-lin64/core.vlc/1.1.0.300meta.7z
# http://cdn.svp-team.com/repo/common-lin64/deps.python/3.12.11meta.7z

# Get full component list via `strings svp4-maintenance.dat | grep installer: | sort -u` after running the svp4-maintenance tool
# This needs you to run the .run file as it generates the svp-maintenance files, I'm not sure how those would be extracted if it's even feasible

prepare() {
	mkdir -p svp_updates

	# Extract each update archive into a single directory
	7z x "svp-${pkgver}_core.full_libs.7z"     -osvp_updates
	7z x "svp-${pkgver}_core.full_licenses.7z" -osvp_updates
	7z x "svp-${pkgver}_core.full_content.7z"  -osvp_updates

	rm -rf "${srcdir}/installer"
	mkdir "${srcdir}/installer"
	echo "Finding 7z archives in installer..."
	LANG=C grep --only-matching --byte-offset --binary --text $'7z\xBC\xAF\x27\x1C' "${srcdir}/svp4-linux.run" |
		cut -f1 -d: |
		while read ofs; do
			dd if="${srcdir}/svp4-linux.run" bs=1M iflag=skip_bytes status=none skip="${ofs}" of="${srcdir}/installer/bin-${ofs}.7z"
		done

	echo "Extracting 7z archives from installer..."
	for f in "${srcdir}/installer/"*.7z; do
		7z -bd -bb0 -y x -o"${srcdir}/extracted/" "${f}" || true
	done
}

#pkgver() {
#	xmllint --xpath '/Updates/PackageUpdate[Name="core.full"]/Version/text()' "$srcdir/installer/metadata/Updates.xml" | tr '-' '.'
#}

package() {
	mkdir -p "${pkgdir}"/{opt/svp,usr/bin,usr/share/licenses/${pkgname}}
	if [[ -d "${srcdir}/extracted/licenses" ]]; then
		mv "${srcdir}/extracted/licenses" "${pkgdir}/usr/share/licenses/${pkgname}"
	fi
	mv "${srcdir}/extracted/"* "${pkgdir}/opt/${_pkgname}"
	# rm "$pkgdir/opt/$pkgname/extensions/libsvpcode.so" # previously this extension caused the whole thing to segfault. lmk if that's still the case
	ln -s "/opt/${_pkgname}/SVPManager" "${pkgdir}/usr/bin/SVPManager"
	chmod -R +rX "${pkgdir}/opt/svp" "${pkgdir}/usr/share"

	# Apply updated files
	cp -a "${srcdir}/svp_updates/"* "${pkgdir}/opt/${_pkgname}/"
}
