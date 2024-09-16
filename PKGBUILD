# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.12.1
pkgrel=2
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('dkms' 'libelf' 'openafs>=1.8.12.1-2')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-rx-Define-symbolic-names-for-Rx-magic-numbers.patch
        0002-opr-replace-MIN-MAX-macros-with-opr_min-opr_max.patch
        0003-Remove-MIN-and-MAX-macro-definitions.patch
        0004-rx-Remove-includes-for-MIN-MAX-in-rx_packet.h.patch
        dkms.conf)
sha256sums=('dfe2f39bef9fb3d6791d602e725be7c34b885e4299018266ff9743cb401e594a'
            '89858ec91fb7cef85f7996c2eeeeb087a7996ed5d902ae4e3ac668e086753b05'
            '247fbe76610056123525b11511f4a426913c7ee61b59f88fdbc0871239af9a94'
            '9b3cac93406f13b3c1ad41c424c43e4df2c997ba9af68e8b73caf3db7e4df42f'
            'a7c4eb9dec81628459783705ceee531b29a81c254298e84c89cdc99e6c77729e'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0')

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
