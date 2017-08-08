# Maintainer: Cj Case <cj@abysmal.mx>
# Contributor: Claire Farron <diesal3@googlemail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=cryptsetup-nuke-keys
pkgver=1.7.5
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
        cryptsetup.c.diff
        cryptsetup.c.diff.asc
        keymanage.c.diff
        keymanage.c.diff.asc
        libcryptsetup.h.diff
        libcryptsetup.h.diff.asc
        setup.c.diff
        setup.c.diff.asc
        )
sha256sums=('2b30cd1d0dd606a53ac77b406e1d37798d4b0762fa89de6ea546201906a251bd' 
            '48e33bb10a2a23a1b1ba8c55560ad54ca8349ec87b4be651cf874c285f5a9482' 
            '9aee13c8e5de8e61e5bf3ca18dfe1f17aa1e4c14755dd2348c37b545ece55e5f' 
            'cfe465bdad3d958bb2332a05e04f2e1e884422a5714dfd1a0a3b9b74bf7dc6ae' 
            'd442304e6a78b3513ebc53be3fe2f1276a7df470c8da701b3ece971d59979bdd' 
            '8c6f2262ae3754ffafce13e6484388573cad895a724f6c0342c90ddac9ea1527'
            '44097ee6ebb46c88c931c6cab3a6f763f51b94972dc98dc12304a0bb526c8397'
            'bc6567863151721fa134998c0588c158cb65ad3d598834a495f4efb4c3acddcb'
            'cf77d649133aec4c08bd8c1b79e1a73cb0b128ad1bd12ac8d48f4790b2dfe836'
            'cd92fe751ef2975ca505338651f98585d85a1ea13e397f2c925e1babb18291f5'
            '71b3b66bb571034eabe480c87249a1dcc38e5e863169391681ca90b0c8101860'
            '8c43b7bec4d73963276a5546c32a55043c446717c3810e24874dc3cdc1fb027c' 
            '1fc90c421bc3693c58e811760d4043c7f1b3d75edde7eb88b43c4b3ad041c3f1')

validpgpkeys=(
              '0D1D18DEF6496F9B60A600821CE20B5DEB5CE016' # Cj Case
              '2A2918243FDE46648D0686F9D9B0577BD93E98FC' # Milan Broz <gmazyland@gmail.com>
             )

provides=('cryptsetup')
conflicts=('cryptsetup')

prepare() {
  cd "${srcdir}"/${pkgname%-nuke*}-${pkgver}

  # luksAddNuke
  msg "Patching source to enable luksAddNuke"
  patch -p0 < ${srcdir}/cryptsetup.c.diff
  patch -p0 < ${srcdir}/keymanage.c.diff
  patch -p0 < ${srcdir}/libcryptsetup.h.diff
  patch -p0 < ${srcdir}/setup.c.diff
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
