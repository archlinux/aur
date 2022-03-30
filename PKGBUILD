# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.8.1
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('openafs')
makedepends=('libelf' 'linux-headers')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
source=("http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2"
        0001-Add-autoconf-archive-to-src-external.patch
        0002-Import-of-code-from-autoconf-archive.patch
        0003-Use-autoconf-archive-m4-from-src-external.patch
        0004-Linux-5.17-kernel-func-complete_and_exit-renamed.patch
        0005-Linux-5.17-Kernel-build-uses-Wcast-function-type.patch)
install=openafs-modules.install
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            '67bad31f8a401f1fa4e851a1f8d2d772f6649573f81045cafae94c105bbff173'
            '16ced06d3d4ffffa251e20aecd1ccb3fedb4585617b004b8ade0b4eab603b17d'
            '3b2aa3343fe4b9401b272fcf0252f4c3f108f1a1e5039718de38b803690c9d74'
            'c9623eac1e8faf2be133d69c6146eb68be800de0c3226acd99848348b5bfd2f4'
            '17c71196bf5f1fc1c62bab8f03a102d7ca75fec56de94390851b10bd27efa3e9')

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

  # Updates to autoconf required for following patches
  patch -p1 < "${srcdir}/0001-Add-autoconf-archive-to-src-external.patch"
  patch -p1 < "${srcdir}/0002-Import-of-code-from-autoconf-archive.patch"
  patch -p1 < "${srcdir}/0003-Use-autoconf-archive-m4-from-src-external.patch"

  # Compatibility with Linux 5.17
  patch -p1 < "${srcdir}/0004-Linux-5.17-kernel-func-complete_and_exit-renamed.patch"
  patch -p1 < "${srcdir}/0005-Linux-5.17-Kernel-build-uses-Wcast-function-type.patch"

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
