# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=archey4-git
_pkgname=archey4
pkgver=4.14.3.0.r1.gd4a6b16
pkgrel=1
pkgdesc="A simple system information tool written in Python"
arch=('any')
url="https://github.com/HorlogeSkynet/archey4.git"
license=('GPL3')
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
conflicts=('archey-git' 'archey2' 'archey3' 'archey3-git' 'pyarchey' 'archey4')
install="${_pkgname}.install"
backup=("etc/${_pkgname}/config.json")
source=(git+https://github.com/HorlogeSkynet/${_pkgname})
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	# Prepare the manual page.
	sed \
		-e "s/\${DATE}/$(date +'%B %Y')/1" \
		-e "s/\${VERSION}/${pkgver}/1" \
		archey.1 > dist/archey.1

	python3 setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"

	python3 setup.py -q install \
		--root="$pkgdir" \
		--optimize=1 \
		--skip-build

	# Configuration file.
	install -D -m0644 config.json "${pkgdir}/etc/${_pkgname}/config.json"

	# Manual page.
	install -D -m0644 dist/archey.1 "${pkgdir}/usr/share/man/man1/archey.1"

	# Meta-data files.
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -D -m0644 README.md "${pkgdir}/usr/share/${_pkgname}/README.md"
	install -D -m0644 COPYRIGHT.md "${pkgdir}/usr/share/${_pkgname}/COPYRIGHT.md"
}

check() {
	cd "${srcdir}/${_pkgname}"

	python3 -m unittest
}
