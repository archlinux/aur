# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: nl6720

_pkgname=cryptsetup
pkgname=$_pkgname-nested-cryptkey
pkgver=2.4.3
pkgrel=4
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
sha256sums=("fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507"
	    "SKIP"
	    "SKIP"
	    "817686b47e5ffd32913bcae7efe717f3377a48062b6311549d4440cfd3eadf17"
	    "5d68a359fd85b5132456f96c2405916de5009efc8e7edf51aef6bf2d2ffd0bd5")

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
