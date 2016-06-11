# $Id: PKGBUILD 202619 2013-12-22 13:44:39Z thomas $
# Maintainer: Claire Farron <diesal3@googlemail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
pkgname=cryptsetup-nuke-keys
pkgver=1.7.2
pkgrel=1
pkgdesc="cryptsetup patched to nuke all keyslots given a certain passphrase"
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/offensive-security/cryptsetup-nuke-keys"
groups=('base')
depends=('device-mapper' 'libgcrypt' 'popt' 'libutil-linux')
makedepends=('util-linux')
options=('!emptydirs')
source=(https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/cryptsetup-${pkgver}.tar.xz
        https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/cryptsetup-${pkgver}.tar.sign
        encrypt_hook
        encrypt_install
        sd-encrypt
        cryptsetup.c.patch
        keymanage.c.patch
        libcryptsetup.h.patch
        libcryptsetup.h.patch.asc
        setup.c.patch)
sha256sums=('dbb35dbf5f0c1749168c86c913fe98e872247bfc8425314b494c2423e7e43342'
            'SKIP'
            '4406f8dc83f4f1b408e49d557515f721d91b358355c71fbe51f74ab27e5c84ff'
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae'
            'd442304e6a78b3513ebc53be3fe2f1276a7df470c8da701b3ece971d59979bdd'
            '64bc32c5771ab72484f267521354d16833f35b0dc5985279186a8bf2d7a51efb'
            '13545e49806f441c2a70513bc2449229c9905f20b933e17ba54078c0392f6d87'
            'a594beafd8f1d57aa455b30b88d38ea2349d4ff2a1d51bb48edaf8c4fdeab63d'
            'SKIP'
            '257656034c2fda27e0711dc76142693519453812d2cd45248abe3ea2f3c60a80')

validpgpkeys=(
              '5F885602C7FD0951F565E27949F67298E6366A92' # Claire Farron
              '2A2918243FDE46648D0686F9D9B0577BD93E98FC' # Milan Broz <gmazyland@gmail.com>		
             )

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
