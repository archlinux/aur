# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.8.8.1
pkgrel=2
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
        0001-Add-autoconf-archive-to-src-external.patch
        0002-Import-of-code-from-autoconf-archive.patch
        0003-Use-autoconf-archive-m4-from-src-external.patch
        0004-Linux-5.17-kernel-func-complete_and_exit-renamed.patch
        0005-Linux-5.17-Kernel-build-uses-Wcast-function-type.patch)
sha256sums=('e7c4bed7075bcd6402e3f0c2d5b9dbe76ad2ee3c5fd5ddc3973a3356ca23ef44'
            '5ea5e184f9b44f5ed45817d2b5a10149d15c8c54f49e0b5b4b773652673cb9b0'
            '67bad31f8a401f1fa4e851a1f8d2d772f6649573f81045cafae94c105bbff173'
            '16ced06d3d4ffffa251e20aecd1ccb3fedb4585617b004b8ade0b4eab603b17d'
            '3b2aa3343fe4b9401b272fcf0252f4c3f108f1a1e5039718de38b803690c9d74'
            'c9623eac1e8faf2be133d69c6146eb68be800de0c3226acd99848348b5bfd2f4'
            '17c71196bf5f1fc1c62bab8f03a102d7ca75fec56de94390851b10bd27efa3e9')

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
