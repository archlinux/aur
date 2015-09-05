# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.6.14
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(
	http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
	0001-Linux-CM-Use-kernel-allocator-directly.patch
	0002-Linux-4.2-Pass-namespace-to-sock_create_kern.patch
	0003-Linux-4.2-total_link_count-is-no-longer-accessible.patch
	0004-Linux-Add-AC_CHECK_LINUX_OPERATION-configure-macro.patch
	0005-Linux-4.2-Changes-in-link-operation-APIs.patch
	0006-Linux-Only-use-automount-for-volume-roots.patch
)
install=openafs-modules.install
sha256sums=('3e62c798a7f982c4f88d85d32e46bee6a47848d207b1e318fe661ce44ae4e01f'
            '53e62ac6cd815324321bbc847e6cc12f364746146e4d1423390035b2a3b05b22'
            '05aef6f9311bde0e5a007c625b45d84600803617ef467e47888fe39dc837ea1b'
            '3fafbaa20b3e74775be934c2243398209803f17693e3a4f6fcb9bdf8d7750f10'
            'a4f6fd9eb5a3b2b3e37ef218b5c4c2acce1e35d9ccf56e1b79edb224b7261cb7'
            '0c8ccfd93a5ac3457372ad2bcad7e0bc04610ec5a0ba529527135bda6a048c3a'
            '32179aaaffebd82887d8421938c64fbe6b1be8034d1e2ba24457f7ed0cfd38df')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_extramodules=$(ls -dt /usr/lib/modules/extramodules-* | head -n1)
_kernelver=$(cat ${_extramodules}/version)

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

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --with-linux-kernel-packaging \
              --with-linux-kernel-build="/usr/lib/modules/${_kernelver}/build"

  make only_libafs
}


package() {
  cd ${srcdir}/${_srcname}-${pkgver}

  make DESTDIR=${pkgdir} install_only_libafs

  # install kernel module
  install -dm755 ${pkgdir}${_extramodules}
  mv ${pkgdir}/lib/modules/${_kernelver}/extra/openafs/openafs.ko ${pkgdir}${_extramodules}/openafs.ko
  gzip -9 ${pkgdir}${_extramodules}/openafs.ko

  # install license
  install -Dm644 ${srcdir}/${_srcname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # remove file already included in openafs package)
  rm -rf ${pkgdir}/usr/bin ${pkgdir}/usr/include
  find ${pkgdir} -name *.a -delete

  # update major kernel version in install file
  sed -i "s/depmod .*/depmod ${_kernelver}/g" "${startdir}/openafs-modules.install"
}
