# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.6pre1
pkgrel=1
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/candidate/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-LINUX-Avoid-building-rand-fortuna-kernel.o.patch
        0002-LINUX-5.6-define-time_t-and-use-timespec-timespec64.patch
        0003-Update-NEWS-for-OpenAFS-1.8.6pre2.patch
        0004-Make-OpenAFS-1.8.6pre2.patch)
install=openafs-modules.install
sha256sums=('4ae020010632fbc9198be94ea97d6f6301c813227117fd8a28e15f32e8f58517'
            '3639bc58cf7896f4b3c5a0c93f8a7a65a119dbd6eff0cb55597e3762ac2e6b3f'
            'a75af2f13ac35e4d324183ac76727f53b832e7fa3b16f4983b48226a0c5452d2'
            '5fc7fc6c44f950c99a1ad9629d6fe56bd88bd1f0b2f2ce3922939e7d073790c9'
            'd15fd705b0b24280c06ca8f2cb6d5c08bcb492cdb1f8f509de1d2c076c01c99d')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Imitate what is likely to become 1.8.6pre2
  patch -p1 < "${srcdir}/0001-LINUX-Avoid-building-rand-fortuna-kernel.o.patch"
  patch -p1 < "${srcdir}/0002-LINUX-5.6-define-time_t-and-use-timespec-timespec64.patch"
  patch -p1 < "${srcdir}/0003-Update-NEWS-for-OpenAFS-1.8.6pre2.patch"
  patch -p1 < "${srcdir}/0004-Make-OpenAFS-1.8.6pre2.patch"

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
