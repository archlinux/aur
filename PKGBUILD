# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.13.2
pkgrel=4
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('openafs')
makedepends=('libelf' 'linux-headers' 'openafs>=1.8.12.1-2')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-LINUX-Refactor-afs_linux_dentry_revalidate.patch
        0002-Linux-6.14-Handle-dops.d_revalidate-with-parent.patch
        0003-Linux-Add-required-MODULE_DESCRIPTION.patch
        0004-linux-Make-iops-mkdir-return-a-struct-dentry.patch
        0005-cf-check-for-dentry-flag-macros-enums.patch
        0006-Linux-Use-folio_wait_locked.patch
        0007-Linux-Refactor-afs_linux_write_end-begin.patch
        0008-Linux-Use-__filemap_get_folio.patch
        0009-LINUX-Use-folio_page-to-convert-folio-to-page.patch
        0010-lwp-Replace-the-typedefed-bool-datatype-with-int.patch
        0011-ubik-Use-typedef-for-ubik_call-function-parameter.patch
        0012-linux-change-lookup_one_len-to-lookup_noperm.patch
        0013-linux-refactor-afs_linux_writepage.patch
        0014-Linux-Use-__readahead_folio.patch
        0015-Linux-Rename-page-index-to-page-__folio_index.patch
        0016-linux-convert-aops-writepage-to-writepages.patch)
sha256sums=('59ab4f60cb925c5779c93e233621186c1226d4770239fb2b544942d49cebd976'
            '5d4753c1511ae011d7f7efc95235460a15d9bc9b7af0d486cc749879c1244f70'
            '39a0337e699bf761186fccfd7fc5fd40fcda83dd825c2b15ef7a11415cc6a42a'
            '1901eb8f02ba52246012da0bc56dce76896e656f1ce24f625be75ba2e30652f8'
            '90d5f78a2699298b7425d766347613967675305a34cedd4126041e5d305b7140'
            '75ec00db57873aa3942adce322f7b6533180ee46e8602cf74864f3808bcb9883'
            '084b6de7d5c5933ac3a3c1eacd4ca5b60fdf3a6f346b817b3e5b2ce7759fa970'
            '1d935ff9ca5f5011d3c15079a84dd726cf968723f3172eb2b0378470548eb0da'
            '339e397c9de0c88ad38c5c21081342b88ec419bd41a433aa3571d6e1773bff4a'
            '1f5cf7cd342258424d97da0fb0e3f3976948cdb251534310d805a76d0ee1f19f'
            '6b5ebe98bd4b30ba864250b14034ec4b6e69bb7eadb6ae7d02c653f5d2dc9b7e'
            'ed2a41f110d5e7b75f0a9d5825e8d5a300efac9a16945f754bfcedce3ed5d0e8'
            'fc9e701cd44d87f52b594f42481caf2b4e63911c8df3e475999280bb88245c8c'
            'ba8d046dea2f8c41984e819d5108ae62dcc84cadbd1e5fa5e3de7eb2ac12525b'
            '14cfcc2d350ea6c47c9df4de826e2ed3b75223bbc75cd0b310bf688a49323018'
            'ba27ea29a2f6c8e63654d549056048bd84f63871db3bc604d8f91e990d611a57'
            'aec06722fb56c971114594096ff9b230f4b6aea4be68f565d04c66267105a3bd')

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

  # Patches for Linux 6.14
  patch -p1 < "${srcdir}"/0001-LINUX-Refactor-afs_linux_dentry_revalidate.patch
  patch -p1 < "${srcdir}"/0002-Linux-6.14-Handle-dops.d_revalidate-with-parent.patch

  # Patches for Linux 6.15
  patch -p1 < "${srcdir}"/0003-Linux-Add-required-MODULE_DESCRIPTION.patch
  patch -p1 < "${srcdir}"/0004-linux-Make-iops-mkdir-return-a-struct-dentry.patch
  patch -p1 < "${srcdir}"/0005-cf-check-for-dentry-flag-macros-enums.patch
  patch -p1 < "${srcdir}"/0006-Linux-Use-folio_wait_locked.patch
  patch -p1 < "${srcdir}"/0007-Linux-Refactor-afs_linux_write_end-begin.patch
  patch -p1 < "${srcdir}"/0008-Linux-Use-__filemap_get_folio.patch
  patch -p1 < "${srcdir}"/0009-LINUX-Use-folio_page-to-convert-folio-to-page.patch

  # Patches for GCC 15
  patch -p1 < "${srcdir}"/0010-lwp-Replace-the-typedefed-bool-datatype-with-int.patch
  patch -p1 < "${srcdir}"/0011-ubik-Use-typedef-for-ubik_call-function-parameter.patch

  # Patches for Linux 6.16
  patch -p1 < "${srcdir}"/0012-linux-change-lookup_one_len-to-lookup_noperm.patch
  patch -p1 < "${srcdir}"/0013-linux-refactor-afs_linux_writepage.patch
  patch -p1 < "${srcdir}"/0014-Linux-Use-__readahead_folio.patch
  patch -p1 < "${srcdir}"/0015-Linux-Rename-page-index-to-page-__folio_index.patch
  patch -p1 < "${srcdir}"/0016-linux-convert-aops-writepage-to-writepages.patch

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
