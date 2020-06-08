# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.6pre2
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/candidate/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-libafs-Abstract-the-Linux-lru-cache-interface.patch
        0003-LINUX-5.7-replace-__pagevec_lru_add-with-lru_cache_a.patch)
install=openafs-modules.install
sha256sums=('ae1aa62c977fc13d61df1f9822ff75af301c50f8ff0528c8fd1f2914fffafcf5'
            'b067b59bf856d15ded1ee786d303eb7b7ff47edb5b3e078b1d43862b8db62368'
            '22d94f69864cde0027716e8bb251406b9fe3745aa6b0f8a16fcb94748e8c3925'
            'dec56eff34fd1ea492a12d90558edfd4a46b82f203f6e7a1fd7543eb1fb0bc99')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}/0001-Temporary-fix-for-compilation-with-GCC-10.patch"

  # Fix compatibility with Linux 5.7 (https://gerrit.openafs.org/14209 and https://gerrit.openafs.org/14210)
  patch -p1 < "${srcdir}/0002-libafs-Abstract-the-Linux-lru-cache-interface.patch"
  patch -p1 < "${srcdir}/0003-LINUX-5.7-replace-__pagevec_lru_add-with-lru_cache_a.patch"

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
