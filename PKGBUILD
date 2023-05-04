# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.9
pkgrel=3
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
	0001-Linux-Replace-lru_cache_add-with-folio_add_lru.patch
	0002-LINUX-5.13-set-.proc_lseek-in-proc_ops.patch
	0003-Linux-6.3-Include-linux-filelock.h-if-available.patch
	0004-Linux-6.3-Use-mnt_idmap-for-inode-op-functions.patch)
sha256sums=('d126178be1f42cca18cb7c0c2691ac354518e3790170150a76bbd25f4d151f06'
            'e6c9a58f9f0f06a6b32e695548fce2178e7b34f324a3fc7bbe0a9e0e8e38d661'
            '5bef56051f0a8f6cf9220fc9182baee53817db8f1bb9051908783196ddbf5109'
            '6ff1b1fef24e7d89f99fe6f44b0cefc189f599305d62aaf8e99ca778b28d4a9a'
            '36ea501ab111a80156c52b951a7051a7bcf27d97cd675edea2e5d87c74e23287')

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

  # https://gerrit.openafs.org/#/c/15281/
  patch -p1 < "${srcdir}"/0001-Linux-Replace-lru_cache_add-with-folio_add_lru.patch

  # https://gerrit.openafs.org/#/c/15286/
  patch -p1 < "${srcdir}"/0002-LINUX-5.13-set-.proc_lseek-in-proc_ops.patch

  # https://gerrit.openafs.org/#/c/15388/
  patch -p1 < "${srcdir}"/0003-Linux-6.3-Include-linux-filelock.h-if-available.patch

  # https://gerrit.openafs.org/#/c/15389/
  patch -p1 < "${srcdir}"/0004-Linux-6.3-Use-mnt_idmap-for-inode-op-functions.patch

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
