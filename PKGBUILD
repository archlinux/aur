# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.6
pkgrel=3
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
        0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
        0004-LINUX-5.8-use-lru_cache_add.patch
        0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch
        0006-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
        0007-rx-update_nextCid-overflow-handling-is-broken.patch
        0008-Remove-overflow-check-from-update_nextCid.patch)
install=openafs-modules.install
sha256sums=('8b4e9d3180f1ecd752753da17ac630df04eb7007c90a921a5f6403c0339d2945'
            '8f4145f5eaf148b231a06aa6fe4a0271fa3c63506bc4e8e504984bb57326d054'
            'cd2bb4125b7995f547767abced93a8e0ffd39ceec2aafda6a87abb11c04ef64f'
            '0f147adc83adfc959eb20794410df9cea339253ad79175bc22b4cdb6e21b8c3d'
            '4987b2800e18d890c7f17f4f0866812bbf9b9d9a2b5f97a1974d119106306b17'
            '50ffd1efbbc6f6977e900cd8623988168d67d821c78def27fae6312d920bc901'
            '3154052cc77b32ccafc5be86c1540b5253de2a1de5f3a87bbe6a771946bc45c1'
            '714e862d31afbcf49b3a1d711fccb64c269153a73e7bfd0b0483dbae109fd177'
            '00db4b504667f9f3182cf35ed48fb0ef8f16b5d6e97df5454efb2b3e5d914111')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}"/0001-Temporary-fix-for-compilation-with-GCC-10.patch

  # Compatibility with Linux 5.8
  patch -p1 < "${srcdir}"/0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
  patch -p1 < "${srcdir}"/0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
  patch -p1 < "${srcdir}"/0004-LINUX-5.8-use-lru_cache_add.patch

  # Compatibility with Linux 5.9
  patch -p1 < "${srcdir}"/0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch

  # Fix RX bug triggered after 14.01.2021 08:25:36 UTC
  # https://gerrit.openafs.org/#/c/14493/
  # https://gerrit.openafs.org/#/c/14494/
  # https://gerrit.openafs.org/#/c/14497/
  patch -p1 < "${srcdir}"/0006-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
  patch -p1 < "${srcdir}"/0007-rx-update_nextCid-overflow-handling-is-broken.patch
  patch -p1 < "${srcdir}"/0008-Remove-overflow-check-from-update_nextCid.patch

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
