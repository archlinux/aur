# Maintainer: Samsagax <samsagax at gmail dot com>
_pkgbase=chimeraos-device-quirks
pkgname=${_pkgbase}-sk-git
pkgver=r327.73ebf7c
pkgrel=1
pkgdesc="A collection of device specific configuration files"
arch=('any')
url="https://github.com/ChimeraOS/device-quirks"
license=('MIT')
depends=(
	'acpica'
	'cpio'
	'systemd'
	'swh-plugins'
	'lv2'
	'bankstown'
	'lsp-plugins-lv2'
)
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/honjow/device-quirks.git#branch=dev")
md5sums=('SKIP')
backup=("etc/device-quirks/device-quirks.conf")
provides=("${_pkgbase}-git")
conflicts=("${_pkgbase}-git")

pkgver() {
	cd "$srcdir/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgbase}"

	# Install binaries
	install -v -m755 -D -t "${pkgdir}/usr/bin/" usr/bin/*

	# Install module tweaks
	install -m644 -D -t "${pkgdir}/usr/lib/modprobe.d/" usr/lib/modprobe.d/*
	install -m644 -D -t "${pkgdir}/usr/lib/modules-load.d/" usr/lib/modules-load.d/*

	# Install udev tweaks
	install -m644 -D -t "${pkgdir}/usr/lib/udev/rules.d/" usr/lib/udev/rules.d/*
	install -m644 -D -t "${pkgdir}/usr/lib/udev/hwdb.d/" usr/lib/udev/hwdb.d/*

	# Install systemd units
	install -m644 -D -t "${pkgdir}/usr/lib/systemd/user/" usr/lib/systemd/user/*
	install -m644 -D -t "${pkgdir}/usr/lib/systemd/system/" usr/lib/systemd/system/*
	install -v -m755 -D -t "${pkgdir}/usr/lib/systemd/system-sleep/" usr/lib/systemd/system-sleep/*

	# Install firmware
	install -m644 -D -t "${pkgdir}/usr/lib/firmware/" usr/lib/firmware/*.bin
	# 复制软链接 覆盖
	find "usr/lib/firmware" -maxdepth 1 -type l -exec cp -P -f {} "${pkgdir}/usr/lib/firmware/" \;

	# Install firmware DSDT and EDID
	install -m644 -D -t "${pkgdir}/usr/lib/firmware/dsdt/" usr/lib/firmware/dsdt/*
	install -m644 -D -t "${pkgdir}/usr/lib/firmware/edid/" usr/lib/firmware/edid/*

	install -dm755 "${pkgdir}/usr/lib/firmware/aw87xxx"
	cp -rv usr/lib/firmware/aw87xxx/* "${pkgdir}/usr/lib/firmware/aw87xxx/."
	ln -sf /etc/device-quirks/firmware/aw87xxx_acf.bin "${pkgdir}/usr/lib/firmware/aw87xxx_acf.bin"

	# Install sysctl configurations
	install -m644 -D -t "${pkgdir}/usr/lib/sysctl.d/" usr/lib/sysctl.d/*

	#Install scripts
	mkdir -p "${pkgdir}/usr/share/device-quirks"
	cp -rv usr/share/device-quirks/* "${pkgdir}/usr/share/device-quirks/."

	# Install pipewire hardware configs
	mkdir -p "${pkgdir}/usr/share/pipewire/hardware-profiles"
	cp -rv usr/share/pipewire/hardware-profiles/* "${pkgdir}/usr/share/pipewire/hardware-profiles/."

	# Install wireplumber hardware configs
	mkdir -p "${pkgdir}/usr/share/wireplumber/hardware-profiles"
	cp -rv usr/share/wireplumber/hardware-profiles/* "${pkgdir}/usr/share/wireplumber/hardware-profiles/."

	install -dm755 "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d"
	install -v -m644 -D -t "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/" usr/share/wireplumber/wireplumber.conf.d/*

	#Install device-quirks config
	mkdir -p "${pkgdir}/etc/device-quirks"
	cp -rv etc/device-quirks/* "${pkgdir}/etc/device-quirks/."

	# Install license
	install -m644 -D -t "${pkgdir}/usr/share/licenses/${_pkgbase}/" LICENSE
}
