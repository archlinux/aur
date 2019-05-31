# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

_pkgname=paragon-ufsd
pkgname=${_pkgname}-dkms
_pkgver=9.6
pkgver=9.6.7_r330530_b779
pkgrel=1
_srcdir=${_pkgname}-${pkgver}
pkgdesc='Paragon NTFS & HFS+ for Linux driver (DKMS)'
arch=('i686' 'x86_64')
url='https://www.paragon-software.com/home/ntfs-linux-per/'
license=('custom')
depends=('dkms')
provides=("${_pkgname}=${_pkgver}" "${_pkgname}-dkms-git=${_pkgver}")
conflicts=(${_pkgname} "${_pkgname}-dkms-git" 'ufsd-module-dkms')
makedepends=('tar' 'sed' 'git' 'findutils')
optdepends=('paragon-ufsd-tools: NTFS & HFS+ utilities (requires purchase)')
backup=("etc/modules-load.d/${_pkgname}.conf")

source=(
	'dkms.conf.in'
	'paragon-ufsd.conf'
	'mount.paragon-ufsd'
	"https://dl.paragon-software.com/free/Paragon-715-FRE_NTFS_Linux_9.6.7_Express.tar.gz"
)

sha256sums=(
	'397b12de445bb5cc2504b040b668ff022e68579f2ab9b8107335cfd2418d8ee9'
	'59e584e80168f42f7887872a8c8dc14ef40f1f949138302d9437ae9bcc2c8aba'
	'6c5521b6b0eeb9520af02f8299920b7a325c5ff3ea9a42ca5576b3c3aed1d0bb'
	'SKIP'
)

pkgver() {
	cat ${srcdir}/drv_config.h | grep TAG | awk -F\" '{print $2}' | cut -c 5-
}

prepare() {
    cd ${srcdir}
	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf
}

package() {
	install -Dm 755 mount.paragon-ufsd "${pkgdir}/usr/bin/mount.paragon-ufsd"
	install -Dm 644 paragon-ufsd.conf "${pkgdir}/etc/modules-load.d/paragon-ufsd.conf"

	install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find . -type f -exec install -Dm 644 {,"${pkgdir}/usr/src/${_pkgname}-${pkgver}/"}{} \;

	chmod +x "${pkgdir}/usr/src/${_pkgname}-${pkgver}/configure"
}
