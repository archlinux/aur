# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.7
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
        0001-Avoid-duplicate-definitions-of-globals.patch
        0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
        0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
        0004-LINUX-5.8-use-lru_cache_add.patch
        0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch
        0006-LINUX-Fix-includes-for-fatal_signal_pending-test.patch
        0007-Linux-Refactor-test-for-32bit-compat.patch
        0008-Linux-5.11-Test-32bit-compat-with-in_compat_syscall.patch
        0009-LINUX-Introduce-afs_d_path.patch
        0010-Linux-Create-wrapper-for-setattr_prepare.patch
        0011-Linux-5.12-Add-user_namespace-param-to-inode-ops.patch)
install=openafs-modules.install
sha256sums=('53543a561fce67714fec9f2a6bf408c5cc1d061c7dc9d1459458275e8ccbfa79'
            '909ebe2f2f82187ec5c8bd19a385e310521dceedb0b0d5ce8413809a37fe5654'
            '2439b2f663feed02c526f4e34b2cdc2a1d5ad35f7223ade87508c1cf4359ee9c'
            'e605d4e7154f9ccf4dec24fec27abe4e2947713f35dae6aa8698e5f8722609a7'
            '15b53b4ab0578eaa31f849670990e15949e67be8b330d7581825a5e8408953ed'
            'ba8c81c035303cbcf204744516a83b66adac94384aaa59ea2ea1a619a41aa7c0'
            'd078882d94adf881bac2e7955689931abe7ac443db86d85e0b60c72d8b27738e'
            '19ca49013e32824002e355a85df6e25028283a0b06a6409cc7d5cd9800fea488'
            '52d40f8a3b032a9fa0ae57bc15d3611bc652ff6e417a488eac4223cef0db9142'
            '457474e625565c28daa6d642b2416b4398b2b9fec3a8b90c048fc0460412a0ce'
            '76d73a55d3e8da63c9ead2cecdec1efbaeb78739bb5abf635a64380eeba35158'
            '8bc24efe33f06228134dd27e5c9a6832abb436e2fbe3fab09b529fed4a5b406c')

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

  # Compatibility with Linux 5.12
  patch -p1 < "${srcdir}"/0009-LINUX-Introduce-afs_d_path.patch
  patch -p1 < "${srcdir}"/0010-Linux-Create-wrapper-for-setattr_prepare.patch
  patch -p1 < "${srcdir}"/0011-Linux-5.12-Add-user_namespace-param-to-inode-ops.patch

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
