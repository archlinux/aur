# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules
_srcname=openafs
pkgver=1.8.8.1
pkgrel=4
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
        0001-Accepted-changes-for-openafs-stable-1_8_x.patch.gz
        0002-Pending-changes-for-openafs-stable-1_8_x.patch.gz
        0003-Linux-Introduce-file-mapping-readpage-helpers.patch
        0004-Linux-5.19-Rename-aops-readpage-to-read_folio.patch
        0005-Linux-5.19-Remove-flags-from-aops-write_begin.patch)
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            'ed8debf0d269fb80b7e6d7d429ff3f34b6105fd423c482a3ea7c4fa54b19018b'
            'c3fe812056b03cc068373c5c18411b3546f380ba72abfccf70bc166110f390da'
            '0e902a093d5bad45f422ef1fc47c686503315fa3049f304eadb8b9dae6be8027'
            '0bb7ac77fa5d3d42bd78f67974ecbcc7cb8973e2859d74c361cb5fa18275cb8e'
            '7c7c6d9e76b436f95ba46138b979694cb50ff33eba2de82f1f5d426213f1768c')

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

  # Changes that have been accepted for OpenAFS 1.8.x
  zcat "${srcdir}"/0001-Accepted-changes-for-openafs-stable-1_8_x.patch.gz | patch -p1

  # Changes likely to be accepted for OpenAFS 1.8.x
  zcat "${srcdir}"/0002-Pending-changes-for-openafs-stable-1_8_x.patch.gz | patch -p1

  # Changes to support Linux 5.19
  patch -p1 < "${srcdir}"/0003-Linux-Introduce-file-mapping-readpage-helpers.patch
  patch -p1 < "${srcdir}"/0004-Linux-5.19-Rename-aops-readpage-to-read_folio.patch
  patch -p1 < "${srcdir}"/0005-Linux-5.19-Remove-flags-from-aops-write_begin.patch

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
