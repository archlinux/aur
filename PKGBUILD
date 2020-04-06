# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.6pre1
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/candidate/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        "dkms.conf"
        0001-LINUX-Avoid-building-rand-fortuna-kernel.o.patch
        0002-LINUX-5.6-define-time_t-and-use-timespec-timespec64.patch
        0003-Update-NEWS-for-OpenAFS-1.8.6pre2.patch
        0004-Make-OpenAFS-1.8.6pre2.patch)
sha256sums=('4ae020010632fbc9198be94ea97d6f6301c813227117fd8a28e15f32e8f58517'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            '3639bc58cf7896f4b3c5a0c93f8a7a65a119dbd6eff0cb55597e3762ac2e6b3f'
            'a75af2f13ac35e4d324183ac76727f53b832e7fa3b16f4983b48226a0c5452d2'
            '5fc7fc6c44f950c99a1ad9629d6fe56bd88bd1f0b2f2ce3922939e7d073790c9'
            'd15fd705b0b24280c06ca8f2cb6d5c08bcb492cdb1f8f509de1d2c076c01c99d')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Imitate what is likely to become 1.8.6pre2
  patch -p1 < "${srcdir}/0001-LINUX-Avoid-building-rand-fortuna-kernel.o.patch"
  patch -p1 < "${srcdir}/0002-LINUX-5.6-define-time_t-and-use-timespec-timespec64.patch"
  patch -p1 < "${srcdir}/0003-Update-NEWS-for-OpenAFS-1.8.6pre2.patch"
  patch -p1 < "${srcdir}/0004-Make-OpenAFS-1.8.6pre2.patch"

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
