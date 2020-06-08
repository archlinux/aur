# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.6pre2
pkgrel=2
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
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-libafs-Abstract-the-Linux-lru-cache-interface.patch
        0003-LINUX-5.7-replace-__pagevec_lru_add-with-lru_cache_a.patch)
sha256sums=('ae1aa62c977fc13d61df1f9822ff75af301c50f8ff0528c8fd1f2914fffafcf5'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'b067b59bf856d15ded1ee786d303eb7b7ff47edb5b3e078b1d43862b8db62368'
            '22d94f69864cde0027716e8bb251406b9fe3745aa6b0f8a16fcb94748e8c3925'
            'dec56eff34fd1ea492a12d90558edfd4a46b82f203f6e7a1fd7543eb1fb0bc99')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}/0001-Temporary-fix-for-compilation-with-GCC-10.patch"

  # Fix compatibility with Linux 5.7 (https://gerrit.openafs.org/14209 and https://gerrit.openafs.org/14210)
  patch -p1 < "${srcdir}/0002-libafs-Abstract-the-Linux-lru-cache-interface.patch"
  patch -p1 < "${srcdir}/0003-LINUX-5.7-replace-__pagevec_lru_add-with-lru_cache_a.patch"

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
