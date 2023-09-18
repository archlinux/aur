# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.4.0
pkgrel=1
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64' 'aarch64' 'powerpc64')
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
[ ${CARCH} == "x86_64"    ] && sha256sums=('7b0f6df097ce8cb805e3aeb194265d2536153f1675b7f08e4115fea0e9416904')
[ ${CARCH} == "aarch64"   ] && sha256sums=('9b50d7999d6e867e1ec09bb8dc563f804fdcf1ee1528e8415e6ae246d2474d36')
[ ${CARCH} == "powerpc64" ] && sha256sums=('333712e984be442b24b7e60018561be33b454bead0514b8485fbf6b592fea8f2')

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
