## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgbase=ravenna-alsa-lkm
pkgname="${_pkgbase}-dkms"
pkgver=r164.7cd5712
pkgrel=2
pkgdesc="A kernel module for ALSA RAVENNA/AES67 Driver"
url="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm"
license=("GPL")
arch=('x86_64' 'x86_64_v3' 'armv7h' 'aarch64')
depends=('gcc' 'dkms')
optdepends=(
    'linux-rt-headers: Needed for build the module for Arch RT kernel'
    'linux-headers: Needed for build the module for Arch kernel'
	)
source=("git+https://github.com/bondagit/ravenna-alsa-lkm.git#branch=aes67-daemon" "dkms.conf")
sha256sums=('SKIP' 'd8e96a5bbd763d15bbec571bc0abec9e357dcce6b5dccac69a4e053e15ff8d8c')

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
