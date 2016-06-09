# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.6.18
pkgrel=3
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
        0004-Linux-4.5-don-t-access-i_mutex-directly.patch
        0005-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch)
install=openafs-modules.install
sha256sums=('b3c35e7be6b6c86b91e7c699fd015f53c87bc19d1ae8ec3ec9cda6b97327d3b6'
            'abac60b5ae85a8d9311a13f35d723c63de2049033058736db7b3ef39439c2811'
            '0ae7f199e5e4031beef55c93087c34505701ef8f41fce4c255239bb8b48e9888'
            'c7403d943f4bd5bb61e47b79c8d5c1258ced77800b2c20a603a4676ae9ee6f8c'
            '88d7ab67b730eeeaef991cb0db8dabf12d1773a922fbba5c6ac99731a6e87fea'
            '76d83389674da6fcb3ce0635308cd47a949f13361cd29ae2c513847fa5dced1f')

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
  patch -p1 < ${srcdir}/0004-Linux-4.5-don-t-access-i_mutex-directly.patch

  # Patch required to build against Linux 4.6
  patch -p1 < ${srcdir}/0005-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch

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
