# Maintainer: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.5
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
sha256sums=('8c03693cd4aa1fa7eccbad55dec02474750be7b75180b51f1085ab671bc58689'
            'f02373771751371b530776c03561ace67cd7c5655499d766282acc5e736173ba'
            'ca1087639a6eb9acb6bc7a0af4839a998034a4e8df2fbfdd02523f23e0779938')

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
