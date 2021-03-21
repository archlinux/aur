# Maintainer: Samuel Forestier <dev+archey@samuel.domains>

pkgname=archey4
pkgver=v4.11.0
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPLv3')
groups=('utils')
depends=('python>=3.6' 'python-distro' 'python-netifaces')
makedepends=('python-setuptools')
optdepends=('bind-tools: WAN_IP would be detected faster'
            'lm_sensors: Temperature would be more accurate'
            'pciutils: GPU wouldn'"'"'t be detected without it'
            'procps-ng: Many entries wouldn'"'"'t work without it'
            'virt-what: Model would contain details about the hypervisor'
            'wmctrl: WindowManager would be more accurate')
provides=('archey')
conflicts=('archey-git' 'archey2' 'archey3-git' 'pyarchey')
install="${pkgname}.install"
backup=("etc/${pkgname}/config.json")
source=("${pkgname}_${pkgver}-${pkgrel}.tar.gz::https://github.com/HorlogeSkynet/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('9dcf9b8bfba06b2dc5f1c2a5811c5689')
sha1sums=('d44dfdfe904af191320415f23a13747f6cc9fca7')


build() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	# Prepare and compress the manual page.
	sed -e "s/\${DATE}/$(date +'%B %Y')/1" archey.1 | \
		sed -e "s/\${VERSION}/${pkgver:1}/1" | \
			gzip -c --best - > dist/archey.1.gz

	python3 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 setup.py -q install \
		--root="$pkgdir" \
		--optimize=1 \
		--skip-build

	# Configuration file.
	install -D -m0644 config.json "${pkgdir}/etc/${pkgname}/config.json"

	# Manual page.
	install -D -m0644 dist/archey.1.gz "${pkgdir}/usr/share/man/man1/archey.1.gz"

	# Meta-data files.
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m0644 README.md "${pkgdir}/usr/share/${pkgname}/README.md"
	install -D -m0644 COPYRIGHT.md "${pkgdir}/usr/share/${pkgname}/COPYRIGHT.md"
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver:1}"

	python3 -m unittest
}
