# Maintainer: Sandelinos
pkgname=sugarchain-bin
pkgver=0.16.3.34_starboy
pkgrel=2
pkgdesc="Sugarchain: one-CPU-one-vote, the world's fastest PoW blockchain"
arch=('x86_64')
url="https://sugarchain.org"
license=('MIT')
depends=('boost' 'boost-libs' 'zeromq' 'libevent')
optdepends=('qt5-base')

_signatures="https://github.com/sugarchain-project/sugarchain/releases/download/v${pkgver//_/-}/SHA256SUMS.asc"
source=("https://github.com/sugarchain-project/sugarchain/releases/download/v${pkgver//_/-}/sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz")
sha256sums=('4a79d2bb85c306fa37b57ab5790931103e4311b7dc8edeca4c86c3ec26590b62')

check() {
  msg 'Validating GPG signature...'
  msg2 '(To disable: remove/rename check() function from PKGBUILD)'
  curl https://keybase.io/decryp2kanon/pgp_keys.asc | gpg --import
#  gpg --recv-key B9DDBDE2AAADC421 # this is Cryptozeny's key
  curl -sL $_signatures -o SHA256SUMS.asc
  msg2 "Downloading $_signatures"
  gpg --verify 'SHA256SUMS.asc'
  msg2 'GPG signature is valid.'

  msg 'Validating signed checksum of downloaded archive...'
  grep "sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz" 'SHA256SUMS.asc' | tr -d '\r' | sha256sum -c -
  msg2 'Checksum valid.'
}

package() {
  tar xf "$srcdir/sugarchain-${pkgver//_/-}-x86_64-linux-gnu.tar.gz"
  install -Dm644 $srcdir/sugarchain-0.16.3/share/man/man1/* -t $pkgdir/usr/share/man/man1
  install -Dm755 $srcdir/sugarchain-0.16.3/bin/* -t $pkgdir/usr/bin
}

