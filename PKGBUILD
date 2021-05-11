## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgbase=ravenna-alsa-lkm
pkgname="${_pkgbase}-dkms"
pkgver=r123.2c9fdae
pkgrel=4
pkgdesc="A kernel module for ALSA RAVENNA/AES67 Driver"
url="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm"
license=("GPL")
arch=('x86_64' 'armv7h' 'aarch64')
depends=('gcc' 'dkms')
optdepends=(
    'linux-rt-headers: Needed for build the module for Arch kernel'
    'linux-rt-bfq-dev-headers: Needed for build the module for Arch kernel'
    'linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=("git+https://github.com/bondagit/ravenna-alsa-lkm.git#branch=aes67-daemon" "dkms.conf")
sha256sums=('SKIP' 'SKIP')
install=$pkgname.install

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                          
}

prepare() {
sed -i '/MODULE_SUPPORTED_DEVICE/d' $srcdir/$_pkgbase/driver/module_interface.c
}

package() {
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  sed -i 's/\.\.\/common/common/g' $srcdir/$_pkgbase/driver/*
  cp -r $srcdir/$_pkgbase/driver/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r $srcdir/$_pkgbase/common "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/common
}
