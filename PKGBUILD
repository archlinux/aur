# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.15
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('dkms' 'libelf' 'openafs>=1.8.12.1-2')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-Use-get_tree_nodev.patch
        0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
        0003-Linux-Avoid-write_cache_pages-for-writepages.patch
        0004-Linux-Use-sockaddr_unsized-for-socket-ops-bind.patch
        0005-Linux-Pass-3rd-parameter-to-filemap_alloc_folio.patch
        dkms.conf)
sha256sums=('32f10dd241b5d8b846e425ab9cbf275b556ba1880bf7df7c459cd9eb49058355'
            '612d27f378830a1a6fd2eb929772dad619806d7900a7aadc9289c0be7f7c7350'
            'd8e09311e75a65f60e72de5346db07d275bfb53ebb7fadac74af010b9ce99f6a'
            '67baede8e998fce3fce28c45033c49aa8e688be7cf0dfd3147d438cd1bd89e68'
            '2f3c48d1a3f4520b54901badbc2787230086339f56ad183a5dc7d0eba5542e87'
            '4c297d57016e5a23ccf902dfe9298df0fd223abacc01c77dcc094a2462894586'
            '306408d644e8781f13e09021449cb1ccbba60f69d1d24eca5f8138e9b3e47d8e')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # patches for Linux 6.18
  patch -p1 < "${srcdir}"/0001-Linux-Use-get_tree_nodev.patch
  patch -p1 < "${srcdir}"/0002-Linux-Introduce-LINUX_WRITE_CACHE_PAGES_USES_FOLIOS.patch
  patch -p1 < "${srcdir}"/0003-Linux-Avoid-write_cache_pages-for-writepages.patch

  # patches for Linux 6.19
  patch -p1 < "${srcdir}"/0004-Linux-Use-sockaddr_unsized-for-socket-ops-bind.patch
  patch -p1 < "${srcdir}"/0005-Linux-Pass-3rd-parameter-to-filemap_alloc_folio.patch

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
