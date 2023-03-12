# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.3.0
pkgrel=1
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64' 'aarch64')
license=('custom')
url='https://disc-kuraudo.eu'
depends=(
	'barcode'
	'bash'
	'cdrtools'
	'cdrdao'
	'diffutils'
	'ddrescue'
	'imagemagick'
	'jq'
	'libudfread-dk'
)
optdepends=(
	'ffmpeg: Extracting scenes/clips/screenshots/etc. from video discs'
	'makemkv: Extracting scenes/clips/screenshots/etc. from video discs'
	'mkvtoolnix-cli: Extracting scenes/clips/etc. from video discs'
)
provides=('disc-kuraudo')
conflicts=('disc-kuraudo')
source=(
	"https://disc-kuraudo.eu/releases/${pkgname}-linux-${CARCH}-${pkgver}.tar.xz"
	*.patch # Any (untracked) patches lying around
)
if   [ ${CARCH} == "x86_64" ]; then
	sha256sums=('a102753ec6e97eac9ddc4be47831889338eed2f884bdb107cf1fdd190e69dc03')
elif [ ${CARCH} == "aarch64" ]; then
	sha256sums=('d157b665e603cac4650d2e4309d9df685b18eaef29ef90687924617163b93fe8')
else
	echo "Unsupported platform '${CARCH}', aborting."; exit 1
fi
# Add SKIP for patches, if any
if [ ${#source[@]} -ne ${#sha256sums[@]} ]; then
	for i in $(seq $((${#source[@]} - ${#sha256sums[@]}))); do
		sha256sums+=('SKIP')
	done
fi

prepare() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"

	# Apply patch files                                    
	for p in "${srcdir}/"*.patch; do
		patch -Np0 < "${p}"
	done
}

package() {
	cd "${srcdir}/${pkgname}-linux-${CARCH}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
