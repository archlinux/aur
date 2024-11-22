# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.13
pkgrel=2
pkgdesc="Kernel module for OpenAFS"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=(IPL-1.0)
depends=('openafs')
makedepends=('libelf' 'linux-headers' 'openafs>=1.8.12.1-2')
conflicts=('openafs-features-libafs' 'openafs<1.6.6-2')
options=(!emptydirs)
install=openafs-modules.install
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Linux-Define-Clear-Set-PageError-macros-as-NOPs.patch
        0002-Linux-Refactor-afs_linux_write_begin-variants.patch
        0003-Linux-Use-folios-for-aops-write_begin-end.patch)
sha256sums=('79100170ca2490b1295d9b8b13058f30e23d7abb897bf1a071755d767078bdd1'
            '69253f4cf09a6187057e8855c81b3a61de6798a736f3f62b5b06c32399fa5108'
            'e85a83dac75b48b40ec4e7b4492923002b1836fc34e84e4891c12b800de3abca'
            'eda1be96e172efbc80610e3465690f3706f84d720dfa8a13ea34123afc62f779')

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

  # Patches for Linux 6.12
  patch -p1 < "$srcdir"/0001-Linux-Define-Clear-Set-PageError-macros-as-NOPs.patch
  patch -p1 < "$srcdir"/0002-Linux-Refactor-afs_linux_write_begin-variants.patch
  patch -p1 < "$srcdir"/0003-Linux-Use-folios-for-aops-write_begin-end.patch

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
