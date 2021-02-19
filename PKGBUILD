# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.7
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Avoid-duplicate-definitions-of-globals.patch
        0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
        0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
        0004-LINUX-5.8-use-lru_cache_add.patch
        0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch
        0006-LINUX-Fix-includes-for-fatal_signal_pending-test.patch
        0007-Linux-Refactor-test-for-32bit-compat.patch
        0008-Linux-5.11-Test-32bit-compat-with-in_compat_syscall.patch)
install=openafs-modules.install
sha256sums=('53543a561fce67714fec9f2a6bf408c5cc1d061c7dc9d1459458275e8ccbfa79'
            '89d423281ae4664467ff583d664cd014362f0f829f2bb1ef76809593626b55e0'
            'cceb2501cca12956644718c64db1c8c0e8d460afbbde302045427f0610b60a92'
            '729f14132a917c2397f4dc713d31c74c0a278c7359c5dd4edc3758fb08e534c4'
            '73b69cea6eef193457091090fe2c6ae090040537395618dcb47c770196bc14ef'
            'aef54d871c376648ef712e9cc224aa65ef012762a28778d53d509a72f99d174e'
            '38eaec2c4e08d45b4aa130ec581ed1e265950553432d8dd878f99decc54416de'
            'c62380c6284f7da43234c7c2bea8503851cd455e0c06d688bbafb1d77cdbd476'
            'ebb0c7ddd0fde966e35c277c7474abc39772a1bbaa601e7a678c95aad31bfb48')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10
  patch -p1 < "${srcdir}"/0001-Avoid-duplicate-definitions-of-globals.patch

  # Compatibility with Linux 5.8
  patch -p1 < "${srcdir}"/0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
  patch -p1 < "${srcdir}"/0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
  patch -p1 < "${srcdir}"/0004-LINUX-5.8-use-lru_cache_add.patch

  # Compatibility with Linux 5.9
  patch -p1 < "${srcdir}"/0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch

  # Compatibility with Linux 5.11
  patch -p1 < "${srcdir}"/0006-LINUX-Fix-includes-for-fatal_signal_pending-test.patch
  patch -p1 < "${srcdir}"/0007-Linux-Refactor-test-for-32bit-compat.patch
  patch -p1 < "${srcdir}"/0008-Linux-5.11-Test-32bit-compat-with-in_compat_syscall.patch

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
