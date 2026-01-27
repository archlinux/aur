# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.15pre1
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
source=(http://openafs.org/dl/openafs/candidate/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-Use-get_tree_nodev.patch
        0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
        0003-Linux-Avoid-write_cache_pages-for-writepages.patch)
sha256sums=('676c045772f64c85c5c770baef62481e26fe1bac9728ef53498523d6212527c0'
            '1d6df3802747b07450c3700fd1df188625b88a2403164029913b39dbe2e0e61e'
            'ba71df128e6491b3b56e5676d12d19fa1f06ee5884f1a758fdf32a290c4325e6'
            '8f4c4fade260abb157325b80221aa276f217d9625142f9b6c93a87ea743ba6cf')

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
