# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.6.18
pkgrel=3
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
        0001-Linux-3.13-Check-return-value-from-bdi_init.patch
        0002-Linux-4.5-no-highmem-in-symlink-ops.patch
        0003-Linux-4.5-get_link-instead-of-follow_link-put_link.patch
        0004-Linux-4.5-don-t-access-i_mutex-directly.patch
        0005-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch)
sha256sums=('b3c35e7be6b6c86b91e7c699fd015f53c87bc19d1ae8ec3ec9cda6b97327d3b6'
            'ea7d1e6dfb5006016e25738be722c8793765f52ad55c0bbf588dd7fdf2bdd2bf'
            'abac60b5ae85a8d9311a13f35d723c63de2049033058736db7b3ef39439c2811'
            '0ae7f199e5e4031beef55c93087c34505701ef8f41fce4c255239bb8b48e9888'
            'c7403d943f4bd5bb61e47b79c8d5c1258ced77800b2c20a603a4676ae9ee6f8c'
            '88d7ab67b730eeeaef991cb0db8dabf12d1773a922fbba5c6ac99731a6e87fea'
            '76d83389674da6fcb3ce0635308cd47a949f13361cd29ae2c513847fa5dced1f')

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patches required to build against Linux 4.5
  patch -p1 < ${srcdir}/0001-Linux-3.13-Check-return-value-from-bdi_init.patch
  patch -p1 < ${srcdir}/0002-Linux-4.5-no-highmem-in-symlink-ops.patch
  patch -p1 < ${srcdir}/0003-Linux-4.5-get_link-instead-of-follow_link-put_link.patch
  patch -p1 < ${srcdir}/0004-Linux-4.5-don-t-access-i_mutex-directly.patch

  # Patch required to build against Linux 4.6
  patch -p1 < ${srcdir}/0005-Linux-4.6-rm-PAGE_CACHE_-and-page_cache_-get-release.patch

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
