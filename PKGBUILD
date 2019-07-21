# Maintainer: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.6
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
sha256sums=('02b650a37c4638458f55c84db5fcfdbd57f565685581d691f59155932c9323eb'
            'b75d34a38554b77ff5a474d6255b13ffa1670bd158e6e86b612e244a8537e399'
            '18be42c2a55eb94a0a5f61cb5bb1bd7078e98492451dc937f953c6fd295a0d45')

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
