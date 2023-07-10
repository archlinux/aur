## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgbase=ravenna-alsa-lkm
pkgname="${_pkgbase}-dkms"
pkgver=r141.6ca0a3d
pkgrel=1
pkgdesc="A kernel module for ALSA RAVENNA/AES67 Driver"
url="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm"
license=("GPL")
arch=('x86_64' 'x86_64_v3' 'armv7h' 'aarch64')
depends=('gcc' 'dkms')
optdepends=(
    'linux-rt-headers: Needed for build the module for Arch kernel'
    'linux-rt-bfq-dev-headers: Needed for build the module for Arch kernel'
    'linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=("git+https://github.com/bondagit/ravenna-alsa-lkm.git#branch=aes67-daemon" "dkms.conf")
sha256sums=('SKIP' 'bcb15ff6d8d91c0ecdc476b9d33c296c4f84c99239cd8d4019fefd7c81420881')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                          
}

prepare() {
sed -i '/MODULE_SUPPORTED_DEVICE/d' $srcdir/$_pkgbase/driver/module_interface.c
sed -i 's#include <stdarg.h>#include <linux/stdarg.h>#g' $srcdir/$_pkgbase/driver/MTAL_LKernelAPI.c
}

package() {
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  sed -i 's/\.\.\/common/common/g' $srcdir/$_pkgbase/driver/*
  cp -r $srcdir/$_pkgbase/driver/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r $srcdir/$_pkgbase/common "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/common
}
