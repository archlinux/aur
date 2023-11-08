# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.10
pkgrel=5
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
        0001-Linux-6.5-Replace-generic_file_splice_read.patch
        0002-LINUX-Make-sysctl-definitions-more-concise.patch
        0003-Linux-6.5-Use-register_sysctl.patch
        0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
        0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch
        0006-dir-Introduce-struct-DirEntryMax.patch
        0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
        0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
        0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            '9a726876e8a3f99db09cf16df994d01d31673df1953796c6fcd0bc95e3ecafa1'
            '7ef226084bc37dd9298ff39c9bc903796ea07841efedc3906bcc4a744e96e57d'
            'b1fa6425438478c79dd97dab6e32e3a8e6ed706f96c9f67c53ede367f9d1ee63'
            '34312040d7139dd34341f567cf57e5c3ac4e1622b8a7289146f0a1204479b8a0'
            '71ed1aee8d0b8a47ae3c1bceb82121666d8ac4b575475032e0342c45b2d380fc'
            '9422f8950311a5b2aba2a7b9b429bfe0652b2f41aaa4519a39c7b92a35513c3f'
            '8ab1ce60ef99c0a3538842f3b8e376c377ec4ca6867d1ccef7379edbb73e102d'
            '0dd8946890016f3a87869eeb79e1eedf34892d1d00903cb044b70a2e43dd81d8'
            'ae67a9390f7c9d22cc4fd06964ee5010d90fd5e4cc64ed5137aaf0b36ecfbd32')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Patches for Linux 6.5
  patch -p1 < "${srcdir}"/0001-Linux-6.5-Replace-generic_file_splice_read.patch
  patch -p1 < "${srcdir}"/0002-LINUX-Make-sysctl-definitions-more-concise.patch
  patch -p1 < "${srcdir}"/0003-Linux-6.5-Use-register_sysctl.patch
  patch -p1 < "${srcdir}"/0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
  patch -p1 < "${srcdir}"/0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch
  patch -p1 < "${srcdir}"/0006-dir-Introduce-struct-DirEntryMax.patch

  # Patches for Linux 6.6
  patch -p1 < "${srcdir}"/0007-LINUX-Pass-an-array-of-structs-to-register_sysctl.patch
  patch -p1 < "${srcdir}"/0008-Linux-6.6-convert-to-ctime-accessor-functions.patch
  patch -p1 < "${srcdir}"/0009-Linux-6.6-Pass-request_mask-to-generic_fillattr.patch

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
