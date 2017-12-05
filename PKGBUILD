# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Konstantin Gizdov <arch at kge dot pw>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.6.22
pkgrel=1
pkgdesc="Kernel module for OpenAFS (dkms)"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.openafs.org"
license=('custom:"IBM Public License Version 1.0"')
depends=('dkms' 'openafs')
provides=("openafs-modules=$pkgver")
conflicts=('openafs-features-libafs' 'openafs-modules' 'openafs<1.6.6-2')
options=(!emptydirs)
source=(http://openafs.org/dl/${pkgver}/${_srcname}-${pkgver}-src.tar.bz2
        0001-Correct-m4-conditionals-in-curses.m4.patch
        0002-Linux-Test-for-__vfs_write-rather-than-__vfs_read.patch
        0003-Linux-Use-kernel_read-kernel_write-when-__vfs-varian.patch
        dkms.conf)
sha256sums=('835410b75d14aec1ac6a1138d8194897f1badeffa3a0c282963ad51996712347'
            '7d4b9bd370ae00aad978db7ad82950598817c205727e6fa2062c0e0c2ace289a'
            '9472094ff5f35ca2cc50dcad26f40274a6b409ecc49b80668cf06081e6bf71d9'
            'b713e7cf5c295254d8e9abe277fd686a89e5e48f27f128761585320a3088ff27'
            'ea7d1e6dfb5006016e25738be722c8793765f52ad55c0bbf588dd7fdf2bdd2bf')

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Fix curses checks during configure (https://gerrit.openafs.org/12740/)
  patch -p1 < ${srcdir}/0001-Correct-m4-conditionals-in-curses.m4.patch

  # Fix compatibility with Linux 4.14
  patch -p1 < ${srcdir}/0002-Linux-Test-for-__vfs_write-rather-than-__vfs_read.patch
  patch -p1 < ${srcdir}/0003-Linux-Use-kernel_read-kernel_write-when-__vfs-varian.patch

  # Only needed when changes to configure were made
  ./regen.sh -q
}

build() {
  cd ${srcdir}/${_srcname}-${pkgver}

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
              --with-afs-sysname=$sysname

  make only_libafs_tree
}

package() {

  # install license
  install -Dm644 ${srcdir}/${_srcname}-${pkgver}/src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # install sources
  install -dm755 ${pkgdir}/usr/src/${_srcname}-${pkgver}
  mv ${srcdir}/${_srcname}-${pkgver}/libafs_tree/* ${pkgdir}/usr/src/${_srcname}-${pkgver}
  sed "s/__VERSION__/$pkgver/" ${srcdir}/dkms.conf > ${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf

}
