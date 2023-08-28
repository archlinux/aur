# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.10
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-6.5-Replace-generic_file_splice_read.patch
        0002-LINUX-Make-sysctl-definitions-more-concise.patch
        0003-Linux-6.5-Use-register_sysctl.patch
        0004-hcrypto-rename-abort-to-_afscrypto_abort.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '0d926266a44d210d27564773731086af5da37ea9f541a94077aa82afd0181584'
            '132aaa4a55d22756b77c77326b0858215217f9c45e207c891b2b3207d107489c'
            '349c6335343cad6b2b5dbce85fabb7679522a89e035cdadaa7545de5e7f5dcde'
            '60c788f28afa589ae7535154efc8c1c7d9a28852e5bb3433878377fee3e522a1')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
if uname -r | grep -q lts; then
  # if you are currently running an lts kernel, only consider lts versions
  _kernelver=$(ls -dt /usr/lib/modules/*lts* | head -n1 | cut -d/ -f5)
else
  _kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
fi
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Patches for Linux 6.5
  patch -p1 < "${srcdir}"/0001-Linux-6.5-Replace-generic_file_splice_read.patch
  patch -p1 < "${srcdir}"/0002-LINUX-Make-sysctl-definitions-more-concise.patch
  patch -p1 < "${srcdir}"/0003-Linux-6.5-Use-register_sysctl.patch
  patch -p1 < "${srcdir}"/0004-hcrypto-rename-abort-to-_afscrypto_abort.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --without-swig \
              --with-linux-kernel-packaging \
              --with-linux-kernel-build="/usr/lib/modules/${_kernelver}/build"

  make only_libafs
}


package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_only_libafs

  # install kernel module
  install -dm755 "${pkgdir}${_extramodules}"
  mv "${pkgdir}/lib/modules/${_kernelver}/extra/openafs/openafs.ko" "${pkgdir}${_extramodules}/openafs.ko"
  gzip -9 "${pkgdir}${_extramodules}/openafs.ko"

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove files already included in openafs package
  find "${pkgdir}/usr" -maxdepth 3 -type f -delete
  find "${pkgdir}/usr" -maxdepth 3 -type l -delete

  # update major kernel version in install file
  sed -i "s/depmod .*/depmod ${_kernelver}/g" "${startdir}/openafs-modules.install"
}
