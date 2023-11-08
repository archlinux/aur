# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.10
pkgrel=5
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
        0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
        0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch
        0006-dir-Introduce-struct-DirEntryMax.patch
        0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
        0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
        0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '9a726876e8a3f99db09cf16df994d01d31673df1953796c6fcd0bc95e3ecafa1'
            '7ef226084bc37dd9298ff39c9bc903796ea07841efedc3906bcc4a744e96e57d'
            'b1fa6425438478c79dd97dab6e32e3a8e6ed706f96c9f67c53ede367f9d1ee63'
            '34312040d7139dd34341f567cf57e5c3ac4e1622b8a7289146f0a1204479b8a0'
            '71ed1aee8d0b8a47ae3c1bceb82121666d8ac4b575475032e0342c45b2d380fc'
            '9422f8950311a5b2aba2a7b9b429bfe0652b2f41aaa4519a39c7b92a35513c3f'
            '8ab1ce60ef99c0a3538842f3b8e376c377ec4ca6867d1ccef7379edbb73e102d'
            '0dd8946890016f3a87869eeb79e1eedf34892d1d00903cb044b70a2e43dd81d8'
            'ae67a9390f7c9d22cc4fd06964ee5010d90fd5e4cc64ed5137aaf0b36ecfbd32')

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
  patch -p1 < "${srcdir}"/0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch
  patch -p1 < "${srcdir}"/0006-dir-Introduce-struct-DirEntryMax.patch

  # Patches for Linux 6.6
  patch -p1 < "${srcdir}"/0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
  patch -p1 < "${srcdir}"/0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
  patch -p1 < "${srcdir}"/0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch

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
