# Maintainer: Tobias Gerold <tobias at g3ro dot eu>
pkgbase=shiftfs
pkgname=(shiftfs shiftfs-dkms)
pkgver=20200804
pkgrel=1
pkgdesc="kernel filesystem for uid/gid shifting, dkms version"
arch=('x86_64')
url="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/tree/fs/shiftfs.c"
license=('GPL2')
makedepends=('linux-headers')
source=("https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/groovy/plain/fs/shiftfs.c"
dkms.conf
Makefile)
sha512sums=('SKIP'
            '186a0d0bb6f85db978636a9e8471865542aae8f2170b3d4bdd35952c9eaa73a055acb2d4bea6b5c62ca7732d3c5fb478a267f1f5d78b50a4ac3e095ba689833f'
            '564fa7777089f16ca1522b1893d0e77ce34cd2b3632ff807c4a932eb29559053ad04a3d6a083c2b34e50864d72f6707c96a951aafca663fa67d483af04bcf0e9')

build() {
  make KDIR="/usr/lib/modules/$(</usr/src/linux/version)/build"
}

package_shiftfs() {
  depends=('linux') 

  _extradir="/usr/lib/modules/$(</usr/src/linux/version)/extramodules"
  install -Dt "${pkgdir}${_extradir}" -m644 *.ko
  find "${pkgdir}" -name '*.ko' -exec strip --strip-debug {} +
  find "${pkgdir}" -name '*.ko' -exec xz {} +
}

package_shiftfs-dkms() {
  depends=('dkms')
  conflicts=('shiftfs')
  provides=('shiftfs')

  install -Dt "${pkgdir}/usr/src/${pkgbase}-${pkgver}" -m644 Makefile shiftfs.c dkms.conf
}

