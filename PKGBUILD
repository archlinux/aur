# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: nl6720

# shellcheck disable=SC2034
_pkgbase=cryptsetup
variant="sigfile"
pkgname="${_pkgbase}-${variant}"
pkgver=2.4.3
pkgrel=7
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt (with edited mkinitcpio hook to check file system signature before attempting to open it).'
arch=('x86_64' 'i686' 'pentium4')
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
	  "${_pkgbase}-nested-cryptkey"
	  "${_pkgbase}=$pkgver")
conflicts=("${_pkgbase}"
	   "${_pkgbase}-nested-cryptkey")
options=('!emptydirs')
validpgpkeys=('2A2918243FDE46648D0686F9D9B0577BD93E98FC') # Milan Broz <gmazyland@gmail.com>
source=("https://www.kernel.org/pub/linux/utils/${_pkgbase}/v${pkgver%.*}/${_pkgbase}-${pkgver}.tar."{xz,sign}
        'hooks-encrypt'
        'install-encrypt'
        'install-sd-encrypt')
sha256sums=("fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507"
	    "SKIP"
            "a6485155ecb6b9618fd5188073040faff13dad59454f239b20c92c8504618c73"
            "817686b47e5ffd32913bcae7efe717f3377a48062b6311549d4440cfd3eadf17"
	    "5d68a359fd85b5132456f96c2405916de5009efc8e7edf51aef6bf2d2ffd0bd5")

build() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${_pkgbase}-${pkgver}" || exit

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
  cd "${srcdir}/${_pkgbase}-${pkgver}" || exit

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install

  # install docs
  install -D -m0644 -t "${pkgdir}"/usr/share/doc/cryptsetup/ FAQ docs/{Keyring,LUKS2-locking}.txt

  # install hook
  install -D -m0644 "${srcdir}"/hooks-encrypt "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m0644 "${srcdir}"/install-encrypt "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m0644 "${srcdir}"/install-sd-encrypt "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}
