# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.10
pkgrel=6
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
        0006-dir-Introduce-struct-DirEntryFlex.patch
        0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
        0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
        0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch
        0010-Linux-6.7-convert-to-inode-a-mtime-accessor-funcs.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '91cf2ee76afaacd7f85ec3cc9bcf35920f54e8b11b68b3b3d8036af742a44e4d'
            '0779c389864cf514a04734abd318a4e98db88889b04b2fdbe8e2a3816cb872eb'
            'e22896c9cff526e01336849e2032c235707450cf93f6131a8a7e3c86d84e8e5c'
            '5dacbca5a5afa6ff99b2976fcc70fa760a4f5e9286c21a05ec233b09ce37bb11'
            '5213e96c818842210736927e9ef5669fb6b35e6755bb71995fadf3c2ba44e04c'
            'ee60fa3f52a397510eb5c6e2e664eb4e66e9620180a74e54d9c8e9677691f8f0'
            '2f2bea9c8a9ea6122af2456725faa41b014687b1681a3c20a0918adf879bfb86'
            '12f2f983dd7845758a1d0e6ab1c85358c5660022137dc4f00c3a3d4f8443e7f3'
            '37abfa35b2b78956e258137fc66197c118084802f1fb17d4ab9546010c693e6d'
            'cf47ce835da5015d4b0621223a4edad5b096790a4aecac2f6141b70164598243')

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
  patch -p1 < "${srcdir}"/0006-dir-Introduce-struct-DirEntryFlex.patch

  # Patches for Linux 6.6
  patch -p1 < "${srcdir}"/0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
  patch -p1 < "${srcdir}"/0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
  patch -p1 < "${srcdir}"/0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch

  # Patches for Linux 6.7
  patch -p1 < "${srcdir}"/0010-Linux-6.7-convert-to-inode-a-mtime-accessor-funcs.patch

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
