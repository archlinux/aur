# Maintainer: Samsagax <samsagax at gmail dot com>
_pkgbase=chimeraos-device-quirks
pkgname=${_pkgbase}
pkgver=r258.a1210b9
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
  'ethtool'
)
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/ChimeraOS/device-quirks.git")
md5sums=('SKIP')
backup=("etc/device-quirks/device-quirks.conf")

pkgver() {
  cd "$srcdir/${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgbase}"

  # Install binaries
  install -v -m755 -D -t "${pkgdir}/usr/bin/" usr/bin/*

  # Install module tweaks
  install -v -m644 -D -t "${pkgdir}/usr/lib/modprobe.d/" usr/lib/modprobe.d/*
  install -v -m644 -D -t "${pkgdir}/usr/lib/modules-load.d/" usr/lib/modules-load.d/*

  # Install udev tweaks
  install -v -m644 -D -t "${pkgdir}/usr/lib/udev/rules.d/" usr/lib/udev/rules.d/*
  install -v -m644 -D -t "${pkgdir}/usr/lib/udev/hwdb.d/" usr/lib/udev/hwdb.d/*

  # Install systemd units
  install -v -m644 -D -t "${pkgdir}/usr/lib/systemd/user/" usr/lib/systemd/user/*
  install -v -m644 -D -t "${pkgdir}/usr/lib/systemd/system/" usr/lib/systemd/system/*
  install -v -m755 -D -t "${pkgdir}/usr/lib/systemd/system-sleep/" usr/lib/systemd/system-sleep/*

  # Install firmware
  mkdir -p "${pkgdir}/usr/lib/firmware/"
  cp -rv usr/lib/firmware/* "${pkgdir}/usr/lib/firmware/"

  # Install sysctl configurations
  install -v -m644 -D -t "${pkgdir}/usr/lib/sysctl.d/" usr/lib/sysctl.d/*

  # Install scripts
  mkdir -p "${pkgdir}/usr/share/device-quirks"
  cp -rv usr/share/device-quirks/* "${pkgdir}/usr/share/device-quirks/."

  # Install pipewire hardware configs
  mkdir -p "${pkgdir}/usr/share/pipewire/hardware-profiles"
  cp -rv usr/share/pipewire/hardware-profiles/* "${pkgdir}/usr/share/pipewire/hardware-profiles/."

  # Install device-quirks config
  mkdir -p "${pkgdir}/etc/device-quirks"
  cp -rv etc/device-quirks/* "${pkgdir}/etc/device-quirks/."

  # Install license
  install -v -m644 -D -t "${pkgdir}/usr/share/licenses/${_pkgbase}/" LICENSE
}
