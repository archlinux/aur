# Maintainer: Samuel Forestier <samuel+archey@forestier.app>

pkgname=archey4
pkgver=4.15.0.0
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPLv3')
groups=('utils')
depends=('python>=3.6' 'python-distro' 'python-netifaces')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('bind-tools: WAN_IP would be detected faster'
            'lm_sensors: Temperature would be more accurate'
            'pciutils: GPU wouldn'"'"'t be detected without it'
            'procps-ng: Many entries wouldn'"'"'t work without it'
            'virt-what: Model would contain details about the hypervisor'
            'wmctrl: WindowManager would be more accurate')
provides=('archey')
conflicts=('archey-git' 'archey2' 'archey3-git' 'archey4-git' 'pyarchey')
install="${pkgname}.install"
backup=("etc/${pkgname}/config.json")
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/HorlogeSkynet/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('db2d44bc114ccf53177c3d2b3be59837')
sha1sums=('9f5f29d1141939ba689dceceacb74c7f2b9d51f5')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Prepare the manual page.
	sed \
		-e "s/\${DATE}/$(date +'%B %Y')/1" \
		-e "s/\${VERSION}/${pkgver}/1" \
		archey.1 > dist/archey.1

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl

	# Configuration file.
	install -D -m0644 config.json "${pkgdir}/etc/${pkgname}/config.json"

	# AppArmor profile.
	install -D -m0644 config.json "${pkgdir}/etc/apparmor.d/usr.bin.${pkgname}"

	# Manual page.
	install -D -m0644 dist/archey.1 "${pkgdir}/usr/share/man/man1/archey.1"

	# Meta-data files.
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m0644 README.md "${pkgdir}/usr/share/${pkgname}/README.md"
	install -D -m0644 COPYRIGHT.md "${pkgdir}/usr/share/${pkgname}/COPYRIGHT.md"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python3 -m unittest
}
