# Maintainer: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.3
pkgrel=1
pkgdesc="Crypto Undertaker, a simple tool to manage encrypted storage"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/tomb/"
license=('GPL3')
install=${pkgname}.install

source=(
        https://files.dyne.org/${pkgname}/Tomb-${pkgver}.tar.gz
        https://files.dyne.org/${pkgname}/Tomb-${pkgver}.tar.gz.sha
        https://files.dyne.org/${pkgname}/Tomb-${pkgver}.tar.gz.asc
        )

# The first hash comes from the .sha file
sha256sums=('7e55ed51b6f5781a7ec40f4e8ec17a24999f1dd18c707f4c00c131d2d15220c9'
            '00d9b43f2ee480c8a7890ef33d8aee497d52926bbe821552b85094da341662f6'
            'SKIP')

# The public key is found at http://jaromil.dyne.org/contact
# gpg --recv-keys 0x73b35da54acb7d10
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')

build() {
  cd ${srcdir}/Tomb-${pkgver}/extras/kdf-keys
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

  cd "${srcdir}/Tomb-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

package_tomb-kdf() {
  pkgdesc="Crypto Undertaker extensions to improve password security"
  depends=('libgcrypt')

  cd "${srcdir}/Tomb-${pkgver}/extras/kdf-keys"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
