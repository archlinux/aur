# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.8
pkgrel=1
pkgdesc="Crypto Undertaker, a simple tool to manage encrypted storage"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/tomb/"
license=('GPL3')
install=${pkgname}.install

source=(
        https://files.dyne.org/tomb/releases/Tomb-${pkgver}.tar.gz
        https://files.dyne.org/tomb/releases/Tomb-${pkgver}.tar.gz.sha
        https://files.dyne.org/tomb/releases/Tomb-${pkgver}.tar.gz.asc
        )

# The first hash comes from the .sha file
sha256sums=('2c064bcb121001dcdd2113c7b728f697e5e5bf8e887a6a4eb633ba5bf1ffef2d'
            'f67f729e3bb125b91f326b28e937d478c55c3e8101e789c3ee38750f40a66cad'
            'SKIP')

# The public key is found at https://keybase.io/jaromil
# gpg --recv-keys 0x73b35da54acb7d10
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')

build() {
  cd "${srcdir}/Tomb-${pkgver}/extras/kdf-keys"
  make
}

# The checks require root access
#check() {
#  cd "${srcdir}/Tomb-${pkgver}"
#  make test
#}

package_tomb() {
  depends=('bc' 'cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs' 'inetutils')
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
