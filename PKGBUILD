## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgbase=ravenna-alsa-lkm
pkgname="${_pkgbase}-dkms"
pkgver=r122.154a9e1
pkgrel=2
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
sha256sums=('SKIP' 'ecdc8a1f4f3d0b459c0d5afc0a1c47134b50bd61a7eede1337f2cc9b622c0171')
install=ravenna-dkms.install

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                          
}

prepare() {
sed -i '/MODULE_SUPPORTED_DEVICE/d' $srcdir/ravenna-alsa-lkm/driver/module_interface.c
}

package() {
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
    # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -i 's/\.\.\/common/common/g' $srcdir/$_pkgbase/driver/*
  cp -r $srcdir/$_pkgbase/driver/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r $srcdir/$_pkgbase/common "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/common
}
