# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.6.14
pkgrel=2
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(
	http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
	dkms.conf
	0001-Linux-CM-Use-kernel-allocator-directly.patch
	0002-Linux-4.2-Pass-namespace-to-sock_create_kern.patch
	0003-Linux-4.2-total_link_count-is-no-longer-accessible.patch
	0004-Linux-Add-AC_CHECK_LINUX_OPERATION-configure-macro.patch
	0005-Linux-4.2-Changes-in-link-operation-APIs.patch
	0006-Linux-Only-use-automount-for-volume-roots.patch
)
install=openafs-modules-dkms.install
sha256sums=('3e62c798a7f982c4f88d85d32e46bee6a47848d207b1e318fe661ce44ae4e01f'
            'ea7d1e6dfb5006016e25738be722c8793765f52ad55c0bbf588dd7fdf2bdd2bf'
            '53e62ac6cd815324321bbc847e6cc12f364746146e4d1423390035b2a3b05b22'
            '05aef6f9311bde0e5a007c625b45d84600803617ef467e47888fe39dc837ea1b'
            '3fafbaa20b3e74775be934c2243398209803f17693e3a4f6fcb9bdf8d7750f10'
            'a4f6fd9eb5a3b2b3e37ef218b5c4c2acce1e35d9ccf56e1b79edb224b7261cb7'
            '0c8ccfd93a5ac3457372ad2bcad7e0bc04610ec5a0ba529527135bda6a048c3a'
            '32179aaaffebd82887d8421938c64fbe6b1be8034d1e2ba24457f7ed0cfd38df')

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patches that were already reviewed for 1.6.14.1, needed for Linux 4.2
  patch -p1 < ${srcdir}/0001-Linux-CM-Use-kernel-allocator-directly.patch
  patch -p1 < ${srcdir}/0002-Linux-4.2-Pass-namespace-to-sock_create_kern.patch
  patch -p1 < ${srcdir}/0003-Linux-4.2-total_link_count-is-no-longer-accessible.patch
  patch -p1 < ${srcdir}/0004-Linux-Add-AC_CHECK_LINUX_OPERATION-configure-macro.patch
  patch -p1 < ${srcdir}/0005-Linux-4.2-Changes-in-link-operation-APIs.patch

  # Patch relevant for Linux 4.2, still under review:
  # http://gerrit.openafs.org/#change,11989
  patch -p1 < ${srcdir}/0006-Linux-Only-use-automount-for-volume-roots.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

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
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 ${srcdir}/${_srcname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # install sources
  install -dm755 ${pkgdir}/usr/src/${_srcname}-${pkgver}
  mv ${srcdir}/${_srcname}-${pkgver}/libafs_tree/* ${pkgdir}/usr/src/${_srcname}-${pkgver}
  sed "s/__VERSION__/$pkgver/" ${srcdir}/dkms.conf > ${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf

}
