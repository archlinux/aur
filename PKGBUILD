# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=openafs-modules-dkms
_srcname=openafs
pkgver=1.6.17
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
        dkms.conf
        0001-Linux-4.4-key_payload-has-no-member-value.patch
        0002-Linux-4.4-Use-locks_lock_file_wait.patch
        0003-Linux-4.4-Do-not-use-splice.patch)
sha256sums=('96413a2dbffdc9170cc5dde6aa5ad0ae2383c6106994285ed8f186928813a398'
            'ea7d1e6dfb5006016e25738be722c8793765f52ad55c0bbf588dd7fdf2bdd2bf'
            'f498b60b99f75a2cfbe01cc91c5de0585c225231b4850816c8b080edd7402a98'
            'ff962b1bcfeedaed0f74570e8d248b4e42a3391654bf49b4bb25e19d80b6c4ac'
            '2c2c14f2f1f88eb43a7160f3112cd63e4ea74884322b76b71308b88b32caafdb')

prepare() {
  cd ${srcdir}/${_srcname}-${pkgver}

  # Patches required to build against Linux 4.4
  patch -p1 < ${srcdir}/0001-Linux-4.4-key_payload-has-no-member-value.patch
  patch -p1 < ${srcdir}/0002-Linux-4.4-Use-locks_lock_file_wait.patch
  patch -p1 < ${srcdir}/0003-Linux-4.4-Do-not-use-splice.patch

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
