# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.12.1
pkgrel=2
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
        0001-rx-Define-symbolic-names-for-Rx-magic-numbers.patch
        0002-opr-replace-MIN-MAX-macros-with-opr_min-opr_max.patch
        0003-Remove-MIN-and-MAX-macro-definitions.patch
        0004-rx-Remove-includes-for-MIN-MAX-in-rx_packet.h.patch)
sha256sums=('dfe2f39bef9fb3d6791d602e725be7c34b885e4299018266ff9743cb401e594a'
            '89858ec91fb7cef85f7996c2eeeeb087a7996ed5d902ae4e3ac668e086753b05'
            '247fbe76610056123525b11511f4a426913c7ee61b59f88fdbc0871239af9a94'
            '9b3cac93406f13b3c1ad41c424c43e4df2c997ba9af68e8b73caf3db7e4df42f'
            'a7c4eb9dec81628459783705ceee531b29a81c254298e84c89cdc99e6c77729e')

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

  # Patches for Linux 6.11
  patch -p1 < "$srcdir"/0001-rx-Define-symbolic-names-for-Rx-magic-numbers.patch
  patch -p1 < "$srcdir"/0002-opr-replace-MIN-MAX-macros-with-opr_min-opr_max.patch
  patch -p1 < "$srcdir"/0003-Remove-MIN-and-MAX-macro-definitions.patch
  patch -p1 < "$srcdir"/0004-rx-Remove-includes-for-MIN-MAX-in-rx_packet.h.patch

  # Only needed when changes to configure were made
  # ./regen.sh -q
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
