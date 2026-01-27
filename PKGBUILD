# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.15pre1
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('dkms' 'libelf' 'openafs>=1.8.12.1-2')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/candidate/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-Use-get_tree_nodev.patch
        0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
        0003-Linux-Avoid-write_cache_pages-for-writepages.patch
        dkms.conf)
sha256sums=('676c045772f64c85c5c770baef62481e26fe1bac9728ef53498523d6212527c0'
            '1d6df3802747b07450c3700fd1df188625b88a2403164029913b39dbe2e0e61e'
            'ba71df128e6491b3b56e5676d12d19fa1f06ee5884f1a758fdf32a290c4325e6'
            '8f4c4fade260abb157325b80221aa276f217d9625142f9b6c93a87ea743ba6cf'
            '306408d644e8781f13e09021449cb1ccbba60f69d1d24eca5f8138e9b3e47d8e')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # patches for Linux 6.18
  patch -p1 < "${srcdir}"/0001-Linux-Use-get_tree_nodev.patch
  patch -p1 < "${srcdir}"/0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
  patch -p1 < "${srcdir}"/0003-Linux-Avoid-write_cache_pages-for-writepages.patch

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
