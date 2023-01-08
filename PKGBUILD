# Maintainer: Samsagax <samsagax at gmail dot com>
_pkgbase=chimeraos-device-quirks
pkgname=${_pkgbase}-git
pkgver=r7.1324c4c
pkgrel=1
pkgdesc="A collection of device specific configuration files"
arch=('any')
url="https://github.com/ChimeraOS/device-quirks"
license=('MIT')
depends=('systemd'
         'ryzenadj-controller-git')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'git')
source=("${_pkgbase}::git+https://github.com/ChimeraOS/device-quirks.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgbase}"

	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_pkgbase}"

	# Install python modules
	python -m installer --destdir="$pkgdir" dist/*.whl

	# Install module tweaks
	install -m644 -D -t "${pkgdir}/usr/lib/modprobe.d/" usr/lib/modprobe.d/*
	install -m644 -D -t "${pkgdir}/usr/lib/modules-load.d/" usr/lib/modules-load.d/*

	# Install udev tweaks
	install -m644 -D -t "${pkgdir}/usr/lib/udev/rules.d/" usr/lib/udev/rules.d/*
	install -m644 -D -t "${pkgdir}/usr/lib/udev/hwdb.d/" usr/lib/udev/hwdb.d/*

	# Install systemd units
	install -m644 -D -t "${pkgdir}/usr/lib/systemd/user/" usr/lib/systemd/user/*

	# Install bin and scripts
	install -m644 -D -t "${pkgdir}/usr/lib/device-quirks/" usr/bin/device-quirks/*

	# Install license
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${_pkgbase}/" LICENSE
}
