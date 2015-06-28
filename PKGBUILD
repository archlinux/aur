# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.6.12
pkgrel=1
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2)
install=openafs-modules.install
sha256sums=('c47ffaa24bf2373264e330a624acafb5f509f4b00d63394b96e9bab131bf5802')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_extramodules=$(ls -dt /usr/lib/modules/extramodules-* | head -n1)
_kernelver=$(cat ${_extramodules}/version)

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Only needed when changes to configure were made
  #./regen.sh -q
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
