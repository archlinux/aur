# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.6.17
pkgrel=1
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-4.4-key_payload-has-no-member-value.patch
        0002-Linux-4.4-Use-locks_lock_file_wait.patch
        0003-Linux-4.4-Do-not-use-splice.patch)
install=openafs-modules.install
sha256sums=('96413a2dbffdc9170cc5dde6aa5ad0ae2383c6106994285ed8f186928813a398'
            'f498b60b99f75a2cfbe01cc91c5de0585c225231b4850816c8b080edd7402a98'
            'ff962b1bcfeedaed0f74570e8d248b4e42a3391654bf49b4bb25e19d80b6c4ac'
            '2c2c14f2f1f88eb43a7160f3112cd63e4ea74884322b76b71308b88b32caafdb')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_extramodules=$(ls -dt /usr/lib/modules/extramodules-* | head -n1)
_kernelver=$(cat ${_extramodules}/version)

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patches required to build against Linux 4.4
  patch -p1 < ${srcdir}/0001-Linux-4.4-key_payload-has-no-member-value.patch
  patch -p1 < ${srcdir}/0002-Linux-4.4-Use-locks_lock_file_wait.patch
  patch -p1 < ${srcdir}/0003-Linux-4.4-Do-not-use-splice.patch

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
