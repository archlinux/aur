# Maintainer: Samsagax <samsagax at gmail dot com>

_pkgbase=hhfc
pkgname=${_pkgbase}-git
pkgver=0.0.3.r2.g2e12076
pkgrel=1
pkgdesc="Hwmon Handheld Fan Controller (hhfc) is a user space driver for fans based on hwmon sysfs"
arch=('any')
url="https://github.com/Samsagax/hhfc"
license=('GPL3')
depends=('python-pyyaml')
makedepends=('python-yaml'
						 'python-build'
						 'python-installer'
						 'python-wheel'
						 'python-setuptools'
						 'git')
provides=("hhfc")
conflicts=("hhfc")
source=("${_pkgbase}::git+https://github.com/Samsagax/hhfc.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgbase}"
}

build() {
	cd "$srcdir/${_pkgbase}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_pkgbase}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	mkdir -p ${pkgdir}/etc/hhfc/

	mkdir -p ${pkgdir}/usr/share/hhfc/
	cp -v config/* ${pkgdir}/usr/share/hhfc/

	mkdir -p ${pkgdir}/usr/lib/systemd/system/
	cp -v systemd/hhfc.service ${pkgdir}/usr/lib/systemd/system/hhfc.service
}
