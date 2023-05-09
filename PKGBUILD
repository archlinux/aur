# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.3.4
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
[ ${CARCH} == "x86_64"  ] && sha256sums=('e17a6eefc55c2ecd0db16170f24861cf336c97e90104217234e1e24a76ea9aaf')
[ ${CARCH} == "aarch64" ] && sha256sums=('b47493892de79886f66dba5cb5732fae2c90001a2ecf9eeb4efaa9fe0b235e9f')

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
