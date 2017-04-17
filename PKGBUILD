# Maintainer: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.4
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
sha256sums=('7907775e563290afb56f3aa4b6297f6cf38a2cfafb8c6081c45c1fadd2e161c3'
            '81a4f5f4b0be5fa6037b29a77372b3c068f5c78ad4310100179688f52e64a9c3'
            '1d84df9f9dc957681d2d7a018e16c5920c2485180feb004132d7e5f6fa5cf036')

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
