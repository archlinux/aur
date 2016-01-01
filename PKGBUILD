# Maintainer: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.2
pkgrel=2
pkgdesc="Crypto Undertaker, a simple tool to manage encrypted storage"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/tomb/"
license=('GPL3')
install=${pkgname}.install

source=(
        https://files.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz
        https://files.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.sha
        https://files.dyne.org/${pkgname}/${pkgname}-${pkgver}.tar.gz.asc
        )

# The first hash comes from the .sha file
sha256sums=('c0172ef8273c4be9322a52b6e503c8bf442ce74028605e198ed5d7e6d090ba86'
            '9ccf20b02f273ba2780ce5f322295d56ddf672b405520024c7c6d6e7720b86f6'
            'SKIP')

# The public key is found at http://jaromil.dyne.org/contact
# gpg --recv-keys 0x73b35da54acb7d10
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/extras/kdf-keys
  make
}

# The checks require root access
#check() {
#  cd ${srcdir}/${pkgname}-${pkgver}
#  make test
#}

package_tomb() {
  depends=('bc' 'cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs')
  optdepends=(
  'steghide: steganography'
  'dcfldd: show nice progress during massive I/O'
  'wipe: secure file deletion'
  'qrencode: for paper backups of keys'
  'swish-e: file content indexer'
  )
  arch=('any')

  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

package_tomb-kdf() {
  pkgdesc="Crypto Undertaker extensions to improve password security"
  depends=('libgcrypt')

  cd "${srcdir}/tomb-${pkgver}/extras/kdf-keys"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
