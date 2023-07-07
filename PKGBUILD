# Maintainer:  Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>
# Contributor: nl6720

# shellcheck disable=SC2034
_pkg=cryptsetup
variant=sigfile
pkgname="${_pkg}-${variant}"
pkgver=2.6.1
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc='Userspace setup tool for transparent encryption of block devices using dm-crypt (with edited mkinitcpio hook to check file system signature before attempting to open it).'
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
license=('GPL')
url='https://gitlab.com/cryptsetup/cryptsetup/'
depends=(
  'device-mapper'
  'libdevmapper.so'
  'openssl'
  'popt'
  'util-linux-libs'
  'json-c'
  'libjson-c.so'
  'argon2'
  'libargon2.so'
)
makedepends=(
  'util-linux'
  'asciidoctor'
)
provides=(
  'libcryptsetup.so=12-32'
  'libcryptsetup.so'
  "${_pkg}-nested-cryptkey=${pkgver}"
  "${_pkg}=${pkgver}"
)
conflicts=(
  "${_pkg}"
  "${_pkg}-nested-cryptkey"
)
options=('!emptydirs')
validpgpkeys=(
  '2A2918243FDE46648D0686F9D9B0577BD93E98FC' # Milan Broz <gmazyland@gmail.com>
)
source=(
  "https://www.kernel.org/pub/linux/utils/${_pkg}/v${_pkgver}/${_pkg}-${pkgver}.tar."{xz,sign}
  'hooks-encrypt'
  'install-encrypt'
  'install-sd-encrypt')
sha256sums=(
  "410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693"
  "SKIP"
  "db1a0fd41ce0b87f8ba818183d313109dea7a714337fe1b81728a3221778fc41"
  "817686b47e5ffd32913bcae7efe717f3377a48062b6311549d4440cfd3eadf17"
  "5d68a359fd85b5132456f96c2405916de5009efc8e7edf51aef6bf2d2ffd0bd5"
)

build() {
  local _configure_opts=(
    --prefix=/usr
    --sbindir=/usr/bin
    --enable-libargon2
    --disable-ssh-token
    --disable-static
  )

  # shellcheck disable=SC2154
  cd "${srcdir}/${_pkg}-${pkgver}" || exit

  ./configure "${_configure_opts[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/${_pkg}-${pkgver}" || exit

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install

  # install docs
  install -D -m0644 -t "${pkgdir}"/usr/share/doc/cryptsetup/ \
	               FAQ.md docs/{Keyring,LUKS2-locking}.txt

  # install hook
  install -D -m0644 "${srcdir}"/hooks-encrypt \
	            "${pkgdir}"/usr/lib/initcpio/hooks/encrypt
  install -D -m0644 "${srcdir}"/install-encrypt \
	            "${pkgdir}"/usr/lib/initcpio/install/encrypt
  install -D -m0644 "${srcdir}"/install-sd-encrypt \
	            "${pkgdir}"/usr/lib/initcpio/install/sd-encrypt
}

# vim:set sw=2 sts=-1 et:
