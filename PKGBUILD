# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.13.2
pkgrel=5
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
        0016-linux-convert-aops-writepage-to-writepages.patch
        0017-Linux-Restore-using-d_name.name-in-d_revalidate.patch
        0018-Linux-Use-a-stable-dentry-name-in-d_revalidate.patch)
sha256sums=('59ab4f60cb925c5779c93e233621186c1226d4770239fb2b544942d49cebd976'
            '9e1db95794b3c6e03855ce0cf6e61c3c13dfb26cb8a766a8e0e88f640cb5462f'
            '23c61e22c72b2820ca377815d36cd53cc11032282d83f7e9bc428c77103957c3'
            '707f080dac174e82aa55c1e6cce626809b8e539476cab90e6d5ca3af5ed63049'
            'b4732d4a059d7bf8779502de395d3b416a83181ea883993eaca91a959820cd4a'
            '9aaac70aa548a487f79d20ccfdf839e311738244e86537e2330048d4241aa030'
            'dffbe5bac94f997aa8e97220e3aa9bf6e2506356dfd9d655ddc1aae4ea91331d'
            '6429dee327e423d12b7c6a6d5eefde4f5709e1e3db81fcb718d9fbb0596fe256'
            'e146e569d4607c0a1505148fa78d77703148f195f4a768792dec181edd57e274'
            '991c8d4c4a077b461878bb4f0fd5fb5080f5ea4da447f357c6dce9feb0741188'
            '7df242a5b65d822511f8c1865e75dfa3d122f7bfaf1b5fac3b8396d7852c9c18'
            '9f567254b19532abb3ff07ad9b25c94e3bab5003b6063183af8405ee6cf7f509'
            '7be033844e1e45b1ad5120a721bef95aa61d508fc6cc7103e254cd7ad1daee06'
            '4d92988789c92612f3ba4a3802b00188de2c87889768364f5d59060f9c2ee626'
            'c4d973253fd898551433784077436426bb302bceeead3153260ecb0f434a8b94'
            '40017f237696c28c3b699c05ad9d860aac66510f26c2a4987cd58cd2ffc2507d'
            'be90ee33bc3d1c73951eb7bd80f468630e1e14bdee08e2d65dad826c6bb8293d'
            'e48f6ac3e9b5779889d1bb3c0402c103bb9a25603bf7bdd6337ded348045bc23'
            '27e82fe3883b48858e724a99a4987885aa030b4351a7337a42e0a16bc579466e')

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

  # Fix possible information leak via DNS SRV requests
  patch -p1 < "${srcdir}"/0017-Linux-Restore-using-d_name.name-in-d_revalidate.patch
  patch -p1 < "${srcdir}"/0018-Linux-Use-a-stable-dentry-name-in-d_revalidate.patch

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
