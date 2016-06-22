# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.6.18.1
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        dkms.conf
        0001-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch)
sha256sums=('503b22ebb57af6af5aec87801ace54209b21f34f0d19843b16c336b66efd48ad'
            'ea7d1e6dfb5006016e25738be722c8793765f52ad55c0bbf588dd7fdf2bdd2bf'
            'e8c1b1ddb49c198d19a29f2b80294084bede252a34768a26da441cbb6173f350')

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patch required to build against Linux 4.6
  patch -p1 < ${srcdir}/0001-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

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
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 ${srcdir}/${_srcname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # install sources
  install -dm755 ${pkgdir}/usr/src/${_srcname}-${pkgver}
  mv ${srcdir}/${_srcname}-${pkgver}/libafs_tree/* ${pkgdir}/usr/src/${_srcname}-${pkgver}
  sed "s/__VERSION__/$pkgver/" ${srcdir}/dkms.conf > ${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf

}
