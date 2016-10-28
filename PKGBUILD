# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

_pkgname=paragon-ufsd
pkgname=${_pkgname}-dkms-git
_pkgver=9.4
pkgver=9.4.r5.g5407244
pkgrel=2
_srcdir=${_pkgname}-${pkgver}
pkgdesc='Paragon NTFS & HFS+ for Linux driver (DKMS)'
arch=('i686' 'x86_64')
url='https://www.paragon-software.com/home/ntfs-linux-per/'
license=('custom')
depends=('dkms')
provides=("${_pkgname}=${_pkgver}" "${_pkgname}-dkms=${_pkgver}")
conflicts=(${_pkgname} "${_pkgname}-dkms" 'ufsd-module-dkms' 'ntfs-3g' 'ntfsprogs')
makedepends=('tar' 'sed' 'git' 'findutils' 'linux-headers>2.6.35' 'linux-headers<4.9')
optdepends=('paragon-ufsd-tools: NTFS & HFS+ utilities (requires purchase)')
backup=("etc/modules-load.d/${_pkgname}.conf")
install=paragon-ufsd-dkms.install

noextract=("Paragon-147-FRE_NTFS_Linux_${_pkgver}_Express.tar.gz")

source=(
	'dkms.conf.in'
	'paragon-ufsd.conf'
	'mount.paragon-ufsd'
	"http://dl.paragon-software.com/esd/${noextract[0]}"
	"${_srcdir}::git+https://github.com/ondr3j/${_pkgname}.git"
)

sha256sums=(
	'f46362ce51cdbacd4b20495905d18598ff3223d36e9c6a6508e434eac8998687'
	'59e584e80168f42f7887872a8c8dc14ef40f1f949138302d9437ae9bcc2c8aba'
  '6c5521b6b0eeb9520af02f8299920b7a325c5ff3ea9a42ca5576b3c3aed1d0bb'
  '8cafe1a9a9ab083c90f5fdbee88d2df8f2fbeb057d7a67bd7b7abc3cd123f506'
  'SKIP'
)

pkgver() {
	cd "${_srcdir}"
	echo "${_pkgver}.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_srcdir}"
	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > dkms.conf
	tar --wildcards --no-anchored --strip=1 -xf "${srcdir}/${noextract[0]}" "*.bin"
}

package() {
	install -Dm 755 mount.paragon-ufsd "${pkgdir}/usr/bin/mount.paragon-ufsd"
	install -Dm 644 paragon-ufsd.conf "${pkgdir}/etc/modules-load.d/paragon-ufsd.conf"

	cd "${_srcdir}"
	install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find . -type f -exec install -Dm 644 {,"${pkgdir}/usr/src/${_pkgname}-${pkgver}/"}{} \;

	chmod +x "${pkgdir}/usr/src/${_pkgname}-${pkgver}/configure"

	ln -rs "${pkgdir}/usr/bin/mount.paragon-ufsd" "${pkgdir}/usr/bin/mount.ntfs"
	ln -rs "${pkgdir}/usr/bin/mount.paragon-ufsd" "${pkgdir}/usr/bin/mount.hfsplus"
}
