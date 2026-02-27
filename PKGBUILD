# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.15
pkgrel=1
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
        0001-Linux-Use-get_tree_nodev.patch
        0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
        0003-Linux-Avoid-write_cache_pages-for-writepages.patch
        0004-Linux-Use-sockaddr_unsized-for-socket-ops-bind.patch
        0005-Linux-Pass-3rd-parameter-to-filemap_alloc_folio.patch)
sha256sums=('32f10dd241b5d8b846e425ab9cbf275b556ba1880bf7df7c459cd9eb49058355'
            '612d27f378830a1a6fd2eb929772dad619806d7900a7aadc9289c0be7f7c7350'
            'd8e09311e75a65f60e72de5346db07d275bfb53ebb7fadac74af010b9ce99f6a'
            '67baede8e998fce3fce28c45033c49aa8e688be7cf0dfd3147d438cd1bd89e68'
            '2f3c48d1a3f4520b54901badbc2787230086339f56ad183a5dc7d0eba5542e87'
            '4c297d57016e5a23ccf902dfe9298df0fd223abacc01c77dcc094a2462894586')

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

  # patches for Linux 6.18
  patch -p1 < "${srcdir}"/0001-Linux-Use-get_tree_nodev.patch
  patch -p1 < "${srcdir}"/0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
  patch -p1 < "${srcdir}"/0003-Linux-Avoid-write_cache_pages-for-writepages.patch

  # patches for Linux 6.19
  patch -p1 < "${srcdir}"/0004-Linux-Use-sockaddr_unsized-for-socket-ops-bind.patch
  patch -p1 < "${srcdir}"/0005-Linux-Pass-3rd-parameter-to-filemap_alloc_folio.patch

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
