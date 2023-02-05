# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.2.0
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
	sha256sums=('2ffa66c58f3becc3ecc75b7b19fff1ac91ad1488ae7de32276f4d2b44742b045')
elif [ ${CARCH} == "aarch64" ]; then
	sha256sums=('c18683fe6565251282d48324bcc573c574eaffc28cf346dfaeaef8d958a3417f')
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
