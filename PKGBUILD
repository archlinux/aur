# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.2
pkgrel=3
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Linux-4.20-current_kernel_time-is-gone.patch
        0002-Linux-4.20-do_settimeofday-is-gone.patch
        0003-Linux_5.0-Use-super_block-flags-instead-of-Mount-fla.patch
        0004-Linux_5.0-replace-do_gettimeofday-with-ktime_get_rea.patch
        0005-Linux_5.0-replaced-current_kernel_time-with-ktime_ge.patch)
install=openafs-modules.install
sha256sums=('25fd3e4261a72a2cbdd40367e5f981895d80c32aaf309a5842aecc739dd3138e'
            'd0ec82bfc844e3fc1f342b607e7107bd8a51d746cbffc075779fc09cc85751ef'
            '793ea07fc906f9fad730c66c742dead5e4323d2cdb58265d7dc592748998b9eb'
            '8a7ad04bf819f47775ac8ba3533ff34b9e4d6758806310ec734ded9e598bb0b0'
            'f5788728380f1038a71452488c9bfea6ee14a4ce7fd6f5b4d14095f70d9c718d'
            'db6e99d72a4eeb74497e2123c55b1354a25532b7cb7aa45646ed7a28a83cb181')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
_extramodules=$(ls -dt /usr/lib/modules/extramodules-* | head -n1)
_kernelver=$(cat ${_extramodules}/version)

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

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --disable-fuse-client \
              --without-swig \
              --with-linux-kernel-packaging \
              --with-linux-kernel-build="/usr/lib/modules/${_kernelver}/build"

  make only_libafs
}


package() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  make DESTDIR="${pkgdir}" install_only_libafs

  # install kernel module
  install -dm755 "${pkgdir}${_extramodules}"
  mv "${pkgdir}/lib/modules/${_kernelver}/extra/openafs/openafs.ko" "${pkgdir}${_extramodules}/openafs.ko"
  gzip -9 "${pkgdir}${_extramodules}/openafs.ko"

  # install license
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove files already included in openafs package
  find "${pkgdir}/usr" -maxdepth 3 -type f -delete
  find "${pkgdir}/usr" -maxdepth 3 -type l -delete

  # update major kernel version in install file
  sed -i "s/depmod .*/depmod ${_kernelver}/g" "${startdir}/openafs-modules.install"
}
