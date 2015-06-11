# $Id: PKGBUILD 202619 2013-12-22 13:44:39Z thomas $
# Maintainer: Claire Farron <diesal3@googlemail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=cryptsetup-nuke-keys
pkgver=1.6.6
pkgrel=1
pkgdesc="cryptsetup patched to nuke all keyslots given a certain passphrase"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/offensive-security/cryptsetup-nuke-keys"
groups=('base')
depends=('device-mapper' 'libgcrypt' 'popt' 'libutil-linux')
makedepends=('util-linux')
options=('!emptydirs')
source=(https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/${pkgname%-nuke*}-${pkgver}.tar.xz
        #https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/${pkgname%-nuke*}-${pkgver}.tar.sign
        encrypt_hook
        encrypt_install
        sd-encrypt
		cryptsetup.c.patch
        keymanage.c.patch
        libcryptsetup.h.patch
        setup.c.patch)
sha256sums=('2d2ce28e4e1137dd599d87884b62ef6dbf14fd7848b2a2bf7d61cf125fbd8e6f'
            '4406f8dc83f4f1b408e49d557515f721d91b358355c71fbe51f74ab27e5c84ff'
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae'
            'd442304e6a78b3513ebc53be3fe2f1276a7df470c8da701b3ece971d59979bdd'
            '64bc32c5771ab72484f267521354d16833f35b0dc5985279186a8bf2d7a51efb'
            '13545e49806f441c2a70513bc2449229c9905f20b933e17ba54078c0392f6d87'
            'd731bbc0350abc867021a4a3fb2930a17a33157bd9206184cd278ddb818e4209'
            '257656034c2fda27e0711dc76142693519453812d2cd45248abe3ea2f3c60a80')

provides=('cryptsetup')
conflicts=('cryptsetup')

prepare() {
  cd "${srcdir}"/${pkgname%-nuke*}-${pkgver}

  # luksAddNuke
  msg "Patching source to enable luksAddNuke"
  patch -p1 < ${srcdir}/cryptsetup.c.patch
  patch -p1 < ${srcdir}/keymanage.c.patch
  patch -p1 < ${srcdir}/libcryptsetup.h.patch
  patch -p1 < ${srcdir}/setup.c.patch
}

build() {
  cd "${srcdir}"/${pkgname%-nuke*}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin --disable-static --enable-cryptsetup-reencrypt
  make
}

package() {
  cd "${srcdir}"/${pkgname%-nuke*}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # install hook
  install -D -m644 "${srcdir}"/encrypt_hook "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m644 "${srcdir}"/encrypt_install "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m644 "${srcdir}"/sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}
