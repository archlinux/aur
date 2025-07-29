# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: parazyd <parazyd@dyne.org>
# Contributor: nignux <nignux@freaknet.org>
# Contributor: fauno <fauno@parabola.nu>
# Contributor: BoySka

pkgbase=tomb
pkgname=(tomb tomb-kdf)
pkgver=2.13
pkgrel=1
pkgdesc="Crypto Undertaker, a simple tool to manage encrypted storage"
arch=('any')
url="https://www.dyne.org/software/tomb/"
license=('GPL-3.0-or-later')
source=("https://files.dyne.org/?file=tomb/releases/Tomb-$pkgver.tar.gz"
        "https://files.dyne.org/?file=tomb/releases/Tomb-$pkgver.tar.gz.sha"
        "https://files.dyne.org/?file=tomb/releases/Tomb-$pkgver.tar.gz.asc"
        "_tomb")

# The first hash comes from the .sha file
sha256sums=('0f78fb78b19edba944dae1a67c8abb9041e33a1805d5b8b0c72b4424019f0590'
            'f2ecff9c2ebe6aacf15b81e0dbf250e4ec4c5f43e38871335877d810d5a2f188'
            'SKIP'
            '8007bc208fdac3fbd7a61320b48c4c8073639b478fcc410145a3792986aca9e8')

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
  depends=('cryptsetup' 'gnupg' 'sudo' 'zsh' 'e2fsprogs' 'inetutils' 'pinentry')
  optdepends=(
  'steghide: steganography'
  'dcfldd: show nice progress during massive I/O'
  'qrencode: for paper backups of keys'
  'plocate: fast search file names'
  'recoll: fast search file contents'
  'lsof: allows the operation slam'
  'argon2: support for argon2 KDF'
  )
  arch=('any')

  cd "$srcdir/Tomb-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  cd "$srcdir/Tomb-$pkgver/extras/translations"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm0644 "$srcdir/_tomb" "$pkgdir/usr/share/zsh/site-functions/_tomb"
}

package_tomb-kdf() {
  pkgdesc="Crypto Undertaker extensions to improve password security"
  arch=('i686' 'x86_64')
  depends=('libgcrypt')

  cd "$srcdir/Tomb-$pkgver/extras/kdf-keys"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
