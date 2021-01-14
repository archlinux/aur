# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.6
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
        0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
        0004-LINUX-5.8-use-lru_cache_add.patch
        0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch
        0006-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
        0007-rx-update_nextCid-overflow-handling-is-broken.patch)
install=openafs-modules.install
sha256sums=('8b4e9d3180f1ecd752753da17ac630df04eb7007c90a921a5f6403c0339d2945'
            'a50428eeac459c2ddadb6622c5cb927923344ee95ce9f917b9bd6a957c5b7c58'
            '5451e85ae2da9077f487a3e8ec9542f02eb1df87db92ee20a44cf1fa3da92dd9'
            '46bb9faf756b22b9862275d3ccff81bf5efa95f893620b49fac0c4da62d690d7'
            '2e86ad81026bb5a5aa4cf4af1b518f7b7e47eec7f92fb49afa5417131543f0c5'
            '7ab14c9db3021fe09e13c35be4a9509c7f585c147826279e853a7f1bffd22d89'
            '4efdca5f2f5026565eb93a8199290755634157996bbd3d506c2a3d514ed45472'
            '469db4138c52b33f6b5055a5615b137ea139f52d6535346eed902f0f09962bf0')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}"/0001-Temporary-fix-for-compilation-with-GCC-10.patch

  # Compatibility with Linux 5.8
  patch -p1 < "${srcdir}"/0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
  patch -p1 < "${srcdir}"/0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
  patch -p1 < "${srcdir}"/0004-LINUX-5.8-use-lru_cache_add.patch

  # Compatibility with Linux 5.9
  patch -p1 < "${srcdir}"/0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch

  # Fix RX bug triggered after 14.01.2021 08:25:36 UTC
  # https://gerrit.openafs.org/#/c/14491/
  # https://gerrit.openafs.org/#/c/14492/
  patch -p1 < "${srcdir}"/0006-rx-rx_InitHost-do-not-overwrite-RAND_bytes-rx_nextCi.patch
  patch -p1 < "${srcdir}"/0007-rx-update_nextCid-overflow-handling-is-broken.patch

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
