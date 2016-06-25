# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

_pkgname=paragon-ufsd
pkgname=${_pkgname}-dkms-git
_pkgver=9.4
pkgver=9.4.r4.g2ff11e5
pkgrel=1
pkgdesc='Paragon NTFS & HFS+ for Linux driver.'
arch=('i686' 'x86_64')
url='https://www.paragon-software.com/home/ntfs-linux-per/'
license=('custom')
depends=('dkms')
provides=("${_pkgname}=${_pkgver}")
conflicts=(${_pkgname} "${_pkgname}-dkms" "ufsd-module-dkms")
makedepends=('tar' 'linux-headers>2.6.35')
optdepends=("paragon-ufsd-tools: NTFS & HFS+ utilities")
backup=("etc/modules-load.d/${_pkgname}.conf")
install=paragon-ufsd-dkms.install

_source="Paragon-147-FRE_NTFS_Linux_${_pkgver}_Express.tar.gz"

source=(
	"dkms.conf.in"
	"http://dl.paragon-software.com/esd/${_source}"
	"${_pkgname}::git+https://github.com/ondr3j/${_pkgname}.git"
)

noextract=("${_source}")

sha256sums=('cc55c9972379573d20e12ca1a48532e8f020045d4b62a9f9c7e8140b973163d0'
            '8cafe1a9a9ab083c90f5fdbee88d2df8f2fbeb057d7a67bd7b7abc3cd123f506'
            'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "${_pkgver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"
	echo "ufsd" > "${_pkgname}.conf"

	cd "${_pkgname}"
	tar --wildcards --no-anchored --strip=1 -xf "${srcdir}/${_source}" "*.bin"
	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf
}

package() {
	cd "${srcdir}"
	install -Dm 644 "${_pkgname}.conf" "${pkgdir}/etc/modules-load.d/${_pkgname}.conf"

	cd "${_pkgname}"
	find . -type f -exec install -Dm 644 {,"${pkgdir}/usr/src/${_pkgname}-${pkgver}/"}{} \;

	# Restore the execute bit on the configuration script
	chmod +x "${pkgdir}/usr/src/${_pkgname}-${pkgver}/configure"

	install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
