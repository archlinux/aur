# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.3.2
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
	sha256sums=('2e6f8c42906d936e9b590f3d621a8873810e675eeefd4aa191ed0b91a3fb67f9')
elif [ ${CARCH} == "aarch64" ]; then
	sha256sums=('8274f95bb2bc00e2192470aea886fb02c8c9f2c8f75e1ea66a2ab0071e0badd4')
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
