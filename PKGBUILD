# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.6
pkgrel=3
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
        0001-Temporary-fix-for-compilation-with-GCC-10.patch
        0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
        0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
        0004-LINUX-5.8-use-lru_cache_add.patch
        0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch)
sha256sums=('8b4e9d3180f1ecd752753da17ac630df04eb7007c90a921a5f6403c0339d2945'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            '604fc461acf66dc833baa434023320ab656b17acdfabcd8153759af5578ddaf8'
            'fa4a34c095429a84a68251270323dfa7159ee3532c2fe2dd8d49da449d275e89'
            '0921338953f2359971a1431c3fc2d2a5f4d3ff050acce160e5cf21023eca9d0f'
            '938fcde2ab0637164cc893bf21fec0f495495bea5690f00a0cc0bfd6b8c07f66'
            '9057a23e755c4b218f67c71d481500ff32598f3f6de6a2f487d5b22412130c78')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Fix compilation with GCC 10 (see https://bugs.gentoo.org/706738 and https://gerrit.openafs.org/14106)
  patch -p1 < "${srcdir}"/0001-Temporary-fix-for-compilation-with-GCC-10.patch

  # Compatibility with Linux 5.8
  patch -p1 < "${srcdir}"/0002-LINUX-5.8-Replace-kernel_setsockopt-with-new-funcs.patch
  patch -p1 < "${srcdir}"/0003-LINUX-5.8-do-not-set-name-field-in-backing_dev_info.patch
  patch -p1 < "${srcdir}"/0004-LINUX-5.8-use-lru_cache_add.patch

  # Compatibility with Linux 5.9
  patch -p1 < "${srcdir}"/0005-LINUX-5.9-Remove-HAVE_UNLOCKED_IOCTL-COMPAT_IOCTL.patch

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
