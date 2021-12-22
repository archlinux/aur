# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_pkgname=cryptsetup
pkgname=$_pkgname-archiso
pkgver=2.4.0
pkgrel=2
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt'
arch=('i686' 'pentium4' 'x86_64')
license=('GPL')
url='https://gitlab.com/cryptsetup/cryptsetup/'
depends=('device-mapper'
         'openssl'
         'popt'
         'util-linux-libs'
         'json-c'
         'argon2')
makedepends=('util-linux')
provides=('libcryptsetup.so=12-32'
          'libcryptsetup.so'
          "${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
options=('!emptydirs')
validpgpkeys=('2A2918243FDE46648D0686F9D9B0577BD93E98FC') # Milan Broz <gmazyland@gmail.com>
source=("https://www.kernel.org/pub/linux/utils/cryptsetup/v${pkgver%.*}/${_pkgname}-${pkgver}.tar."{xz,sign}
        'hooks-encrypt'
        'install-encrypt'
        'install-sd-encrypt')
sha256sums=('c5c8bda31159a9c010ea72e708053cc4252cf5eebdca520e150abc0609287ff8'
            'SKIP'
            'SKIP'
            'd325dc239ecc9a5324407b0782da6df2573e8491251836d6c4e65fa61339ce57'
            '46af2f1353db1909fc483f20e3fa1e13f1e7c0d14f44c0d6163ce0862916c613')

build() {
  cd "${srcdir}"/$_pkgname-${pkgver}

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --enable-libargon2 \
    --disable-ssh-token \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}"/$_pkgname-${pkgver}

  make DESTDIR="${pkgdir}" install

  # install docs
  install -D -m0644 -t "${pkgdir}"/usr/share/doc/cryptsetup/ FAQ docs/{Keyring,LUKS2-locking}.txt

  # install hook
  install -D -m0644 "${srcdir}"/hooks-encrypt "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m0644 "${srcdir}"/install-encrypt "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m0644 "${srcdir}"/install-sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}
