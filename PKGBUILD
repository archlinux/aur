# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.10
pkgrel=4
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
        0006-dir-Introduce-struct-DirEntryMax.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'e27ff48ca676ac8d4dc95209bd3b84fe13bb14861aa4a0e0776f3dfe7559ffab'
            '4e71ad2009125187632cdb48b2d5eccc9bcaa8ab0733751fed432cfe661ea86e'
            'daaa1361d5db967bd8b72fff4038cfc933a7027e3c70d10ef6ff673a5d176cb6'
            '40e50688a2d4d85eb9b971aaa8563e577db15550aa56c44eab8fe2a688d3f013'
            'c0792690ed273ce464966b22e36ca431196a913ded6f0def4a46154076fd0eff'
            'be7e1b0304ff61ed899286fdd18ebdbe71cbbe3eb20f6ac38c5799083b339a4a')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Patches for Linux 6.5
  patch -p1 < "${srcdir}"/0001-Linux-6.5-Replace-generic_file_splice_read.patch
  patch -p1 < "${srcdir}"/0002-LINUX-Make-sysctl-definitions-more-concise.patch
  patch -p1 < "${srcdir}"/0003-Linux-6.5-Use-register_sysctl.patch
  patch -p1 < "${srcdir}"/0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
  patch -p1 < "${srcdir}"/0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch
  patch -p1 < "${srcdir}"/0006-dir-Introduce-struct-DirEntryMax.patch

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
