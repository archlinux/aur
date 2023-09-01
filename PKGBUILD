# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.10
pkgrel=3
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-6.5-Replace-generic_file_splice_read.patch
        0002-LINUX-Make-sysctl-definitions-more-concise.patch
        0003-Linux-6.5-Use-register_sysctl.patch
        0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
        0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch)
sha256sums=('9fec11364623549e8db7374072f5c8f01b841f6bfe7e85673cbce35ff43ffb07'
            '81f3cf88040eee89ed180d683ba1a42107ea4a6c7057fd3dac679be9a9a9ab01'
            '873c2b3816eed95e1799954d299e4411aa8079f267077dc1a3a3c564d3e2524c'
            'da4b625e6885ae9bccc7428b1556751ea134510540e59fa4e8170cfba4d454dc'
            '42d2363ac0bcd5e87afc60ac656bb1ead8ab885d0deca6b0f8318b9bbf191b67'
            '05a52fcc975b940cf15ba78ec2f76c00580f2db939bea32bcd99ef4c1dfdad1b')

# Heuristic to determine version of installed kernel
# You can modify this if the heuristic fails
if uname -r | grep -q lts; then
  # if you are currently running an lts kernel, only consider lts versions
  _kernelver=$(ls -dt /usr/lib/modules/*lts* | head -n1 | cut -d/ -f5)
else
  _kernelver=$(ls -dt /usr/lib/modules/* | head -n1 | cut -d/ -f5)
fi
_extramodules="/usr/lib/modules/${_kernelver}/extramodules"

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"

  # Patches for Linux 6.5
  patch -p1 < "${srcdir}"/0001-Linux-6.5-Replace-generic_file_splice_read.patch
  patch -p1 < "${srcdir}"/0002-LINUX-Make-sysctl-definitions-more-concise.patch
  patch -p1 < "${srcdir}"/0003-Linux-6.5-Use-register_sysctl.patch
  patch -p1 < "${srcdir}"/0004-hcrypto-rename-abort-to-_afscrypto_abort.patch
  patch -p1 < "${srcdir}"/0005-linux-Replace-fop-iterate-with-fop-iterate_shared.patch

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
