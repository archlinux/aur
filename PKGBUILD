# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.6
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        "dkms.conf"
        0001-Temporary-fix-for-compilation-with-GCC-10.patch)
sha256sums=('8b4e9d3180f1ecd752753da17ac630df04eb7007c90a921a5f6403c0339d2945'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'b067b59bf856d15ded1ee786d303eb7b7ff47edb5b3e078b1d43862b8db62368')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}/0001-Temporary-fix-for-compilation-with-GCC-10.patch"

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
