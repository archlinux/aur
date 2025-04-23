# Maintainer: Manuel Barrio Linares <mbarriolinares at gmail dot com>
pkgname=kvmfr-dkms-git
pkgver=r3481.54d811e0
pkgrel=1
pkgdesc="KVM FrameRelay kernel module for Looking Glass (DKMS, Git version)"
arch=('any')
url="https://github.com/gnif/LookingGlass"
license=('GPL2')
provides=('kvmfr')
depends=('dkms')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/LookingGlass"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/LookingGlass/module"

  local version=$(grep PACKAGE_VERSION dkms.conf | sed -r 's#PACKAGE_VERSION="([0-9.]+)"#\1#')
  local dkmsdir="${pkgdir}/usr/src/kvmfr-${version}"

  install -d "$dkmsdir"
  cp -a dkms.conf Makefile kvmfr.[ch] "$dkmsdir"

	# Create modules-load configuration
	printf '# KVMFR Looking Glass module\nkvmfr\n' | install -Dm644 /dev/stdin "$pkgdir/etc/modules-load.d/kvmfr.conf"

	# Create modprobe configuration using 64mb as default
	# Note: The qemu/libvirt size argument must be the same size you passed here to the static_size_mb argument when loading the kernel module
	printf 'options kvmfr static_size_mb=64\n' | install -Dm644 /dev/stdin "$pkgdir/etc/modprobe.d/kvmfr.conf"

	# Create udev rule adding group 'kvm' access to /dev/kvmfr0
	printf 'SUBSYSTEM=="kvmfr", GROUP="kvm", MODE="0660", TAG+="uaccess"\n' | install -Dm644 /dev/stdin "$pkgdir/etc/udev/rules.d/99-kvmfr.rules"
}
