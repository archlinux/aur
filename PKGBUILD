## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgbase=ravenna-alsa-lkm
pkgname="${_pkgbase}-dkms"
pkgver=r107.35c708f
pkgrel=3
pkgdesc="A kernel module for ALSA RAVENNA/AES67 Driver"
url="https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm"
license=("GPL")
arch=('x86_64' 'armv7h')
depends=('gcc' 'dkms')
optdepends=(
    'linux-rt-headers: Needed for build the module for Arch kernel'
    'linux-rt-bfq-headers: Needed for build the module for Arch kernel'
    'linux-headers: Needed for build the module for Arch kernel'
	'linux-lts-headers: Needed for build the module for LTS Arch kernel'
	'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=("git+https://bitbucket.org/MergingTechnologies/ravenna-alsa-lkm.git" "git+https://github.com/bondagit/aes67-linux-daemon.git" "dkms.conf")
sha256sums=('SKIP' 'SKIP' 'SKIP')
install=ravenna-dkms.install

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"                          
}

prepare() {
  cd "$srcdir"/"$_pkgbase"/driver
  echo "Apply patches to ravenna-alsa-lkm module ..."
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-kernel-v5.patch
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-enable-loopback.patch  
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-fixes.patch
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-arm-32bit.patch
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-add-codec-am824.patch
  git apply "$srcdir"/aes67-linux-daemon/3rdparty/patches/ravenna-alsa-lkm-disable-ptp-checksum.patch
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
