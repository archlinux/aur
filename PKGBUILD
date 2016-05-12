# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.6.18
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-3.13-Check-return-value-from-bdi_init.patch
        0002-Linux-4.5-no-highmem-in-symlink-ops.patch
        0003-Linux-4.5-get_link-instead-of-follow_link-put_link.patch
        0005-Linux-4.5-don-t-access-i_mutex-directly.patch)
install=openafs-modules.install
sha256sums=('b3c35e7be6b6c86b91e7c699fd015f53c87bc19d1ae8ec3ec9cda6b97327d3b6'
            'bec998ce038349025fe030c692f7f0fe46bbe8922433cf6be6298aac536f34cf'
            'd18b1278c097825801fa1c721cae861f985d9da5460475b74cefe1eb789a1f92'
            '6336dde35c68c74ae9427b312f170481616d8d347ec4ddfa2966a683797361b0'
            'e3f369f000df13a4d207c1533d63ffa0b139c3d374294f6d1fbc77f5e5b9b4df')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_extramodules=$(ls -dt /usr/lib/modules/extramodules-* | head -n1)
_kernelver=$(cat ${_extramodules}/version)

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patches required to build against Linux 4.5
  patch -p1 < ${srcdir}/0001-Linux-3.13-Check-return-value-from-bdi_init.patch
  patch -p1 < ${srcdir}/0002-Linux-4.5-no-highmem-in-symlink-ops.patch
  patch -p1 < ${srcdir}/0003-Linux-4.5-get_link-instead-of-follow_link-put_link.patch
  patch -p1 < ${srcdir}/0005-Linux-4.5-don-t-access-i_mutex-directly.patch

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
