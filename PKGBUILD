# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.2
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
        0001-Linux-4.20-current_kernel_time-is-gone.patch
        0002-Linux-4.20-do_settimeofday-is-gone.patch
        0003-Linux_5.0-Use-super_block-flags-instead-of-Mount-fla.patch
        0004-Linux_5.0-replace-do_gettimeofday-with-ktime_get_rea.patch
        0005-Linux_5.0-replaced-current_kernel_time-with-ktime_ge.patch)
sha256sums=('25fd3e4261a72a2cbdd40367e5f981895d80c32aaf309a5842aecc739dd3138e'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'd0ec82bfc844e3fc1f342b607e7107bd8a51d746cbffc075779fc09cc85751ef'
            '793ea07fc906f9fad730c66c742dead5e4323d2cdb58265d7dc592748998b9eb'
            '8a7ad04bf819f47775ac8ba3533ff34b9e4d6758806310ec734ded9e598bb0b0'
            'f5788728380f1038a71452488c9bfea6ee14a4ce7fd6f5b4d14095f70d9c718d'
            'db6e99d72a4eeb74497e2123c55b1354a25532b7cb7aa45646ed7a28a83cb181')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Compatibility with Linux 4.20
  patch -p1 < "${srcdir}/0001-Linux-4.20-current_kernel_time-is-gone.patch"
  patch -p1 < "${srcdir}/0002-Linux-4.20-do_settimeofday-is-gone.patch"

  # Compatibility with Linux 5.0
  patch -p1 < "${srcdir}/0003-Linux_5.0-Use-super_block-flags-instead-of-Mount-fla.patch"
  patch -p1 < "${srcdir}/0004-Linux_5.0-replace-do_gettimeofday-with-ktime_get_rea.patch"
  patch -p1 < "${srcdir}/0005-Linux_5.0-replaced-current_kernel_time-with-ktime_ge.patch"

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
