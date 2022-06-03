# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.9
pkgrel=3
pkgdesc="Crypto Undertaker, a simple tool to manage encrypted storage"
arch=('i686' 'x86_64')
url="https://www.dyne.org/software/tomb/"
license=('GPL3')
source=("https://files.dyne.org/tomb/releases/Tomb-$pkgver.tar.gz"
        "https://files.dyne.org/tomb/releases/Tomb-$pkgver.tar.gz.sha"
        "https://files.dyne.org/tomb/releases/Tomb-$pkgver.tar.gz.asc")

# The first hash comes from the .sha file
sha256sums=('b3a23c6680815f7557a3c4bd73d2b2dbde870a62357fcbf9b33089afae75d68c'
            '4f57af24b3b39ae1774ac0bca5af5dacf26465bbd55dc954001069fecce5f2a2'
            'SKIP')

# The public key is found at https://keybase.io/jaromil
# gpg --recv-keys 0x73b35da54acb7d10
validpgpkeys=('6113D89CA825C5CEDD02C87273B35DA54ACB7D10')

build() {
  cd "$srcdir/Tomb-$pkgver/extras/kdf-keys"
  make
}

# The checks require root access
#check() {
#  cd "$srcdir/Tomb-$pkgver"
#  make test
#}

package_tomb() {
  depends=('cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs' 'inetutils')
  optdepends=(
  'steghide: steganography'
  'dcfldd: show nice progress during massive I/O'
  'qrencode: for paper backups of keys'
  'swish-e: file content indexer'
  'lsof: allows the operation slam'
  )
  arch=('any')

  cd "$srcdir/Tomb-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

package_tomb-kdf() {
  pkgdesc="Crypto Undertaker extensions to improve password security"
  depends=('libgcrypt')

  cd "$srcdir/Tomb-$pkgver/extras/kdf-keys"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
