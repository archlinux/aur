# Maintainer: Samsagax <samsagax at gmail dot com>
_pkgbase=chimeraos-device-quirks
pkgname=${_pkgbase}-git
pkgver=r149.16d8bb7
pkgrel=1
pkgdesc="A collection of device specific configuration files"
arch=('any')
url="https://github.com/ChimeraOS/device-quirks"
license=('MIT')
depends=('acpica'
         'cpio'
         'systemd'
         'swh-plugins'
         'ryzenadj-controller-git')
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-setuptools'
             'git')
source=("${_pkgbase}::git+https://github.com/ChimeraOS/device-quirks.git")
md5sums=('SKIP')
backup=("etc/device-quirks/device-quirks.conf")

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
	
	# Install binaries
	install -v -m644 -D -t "${pkgdir}/usr/bin/" usr/bin/*

	# Install module tweaks
	install -v -m644 -D -t "${pkgdir}/usr/lib/modprobe.d/" usr/lib/modprobe.d/*
	install -v -m644 -D -t "${pkgdir}/usr/lib/modules-load.d/" usr/lib/modules-load.d/*

	# Install udev tweaks
	install -v -m644 -D -t "${pkgdir}/usr/lib/udev/rules.d/" usr/lib/udev/rules.d/*
	install -v -m644 -D -t "${pkgdir}/usr/lib/udev/hwdb.d/" usr/lib/udev/hwdb.d/*

	# Install systemd units
	install -v -m644 -D -t "${pkgdir}/usr/lib/systemd/user/" usr/lib/systemd/user/*

	# Install firmware DSDT and EDID
	install -v -m644 -D -t "${pkgdir}/usr/lib/firmware/dsdt/" usr/lib/firmware/dsdt/*
	install -v -m644 -D -t "${pkgdir}/usr/lib/firmware/edid/" usr/lib/firmware/edid/*

	# Install sysctl configurations
	install -v -m644 -D -t "${pkgdir}/usr/lib/sysctl.d/" usr/lib/sysctl.d/*

	#Install scripts
	mkdir -p "${pkgdir}/usr/share/device-quirks"
	cp -rv usr/share/device-quirks/* "${pkgdir}/usr/share/device-quirks/."
	
	#Install device-quirks config
	mkdir -p "${pkgdir}/etc/device-quirks"
	cp -rv etc/device-quirks/* "${pkgdir}/etc/device-quirks/."

	# Install license
	install -v -m644 -D -t "${pkgdir}/usr/share/licenses/${_pkgbase}/" LICENSE
}
