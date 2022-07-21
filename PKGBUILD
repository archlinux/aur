# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.8.1
pkgrel=4
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'libelf' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/openafs/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
	"dkms.conf"
        0001-Accepted-changes-for-openafs-stable-1_8_x.patch.gz
        0002-Pending-changes-for-openafs-stable-1_8_x.patch.gz
        0003-Linux-Introduce-file-mapping-readpage-helpers.patch
        0004-Linux-5.19-Rename-aops-readpage-to-read_folio.patch
        0005-Linux-5.19-Remove-flags-from-aops-write_begin.patch)
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            'ed8debf0d269fb80b7e6d7d429ff3f34b6105fd423c482a3ea7c4fa54b19018b'
            'c3fe812056b03cc068373c5c18411b3546f380ba72abfccf70bc166110f390da'
            '0e902a093d5bad45f422ef1fc47c686503315fa3049f304eadb8b9dae6be8027'
            '0bb7ac77fa5d3d42bd78f67974ecbcc7cb8973e2859d74c361cb5fa18275cb8e'
            '7c7c6d9e76b436f95ba46138b979694cb50ff33eba2de82f1f5d426213f1768c')

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
