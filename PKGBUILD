# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.9
pkgrel=3
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
	dkms.conf
	0001-Linux-Replace-lru_cache_add-with-folio_add_lru.patch
	0002-LINUX-5.13-set-.proc_lseek-in-proc_ops.patch
	0003-Linux-6.3-Include-linux-filelock.h-if-available.patch
	0004-Linux-6.3-Use-mnt_idmap-for-inode-op-functions.patch)
sha256sums=('d126178be1f42cca18cb7c0c2691ac354518e3790170150a76bbd25f4d151f06'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'e6c9a58f9f0f06a6b32e695548fce2178e7b34f324a3fc7bbe0a9e0e8e38d661'
            '5bef56051f0a8f6cf9220fc9182baee53817db8f1bb9051908783196ddbf5109'
            '6ff1b1fef24e7d89f99fe6f44b0cefc189f599305d62aaf8e99ca778b28d4a9a'
            '36ea501ab111a80156c52b951a7051a7bcf27d97cd675edea2e5d87c74e23287')

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

  case "$CARCH" in
    "i686")    sysname=i386_linux26 ;;
    "x86_64")  sysname=amd64_linux26 ;;
    "armv7h")  sysname=arm_linux26 ;;
    *)         error "Unknown architecture '$CARCH'" && false
  esac

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --disable-kernel-module \
              --without-swig \
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install sources
  install -dm755 "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  mv "${srcdir}/${_srcname}-${pkgver}/libafs_tree/"* "${pkgdir}/usr/src/${_srcname}-${pkgver}"
  sed "s/__VERSION__/$pkgver/" "${srcdir}/dkms.conf" > "${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf"

}
