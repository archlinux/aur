# Maintainer: Michael Cordover <fido2-hmac-secret@mjec.net>

pkgname=khefin
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple way to generate password-proteceted secrets from a FIDO2 authenticator with the hmac-secret extension"
arch=('x86_64')
url="https://github.com/mjec/khefin"
license=('GPL3')
depends=('bash' 'libfido2' 'libcbor' 'libsodium' 'libcap')
makedepends=('git')
optdepends=('bash-completion: bash completion support'
            'mkinitcpio: initramfs support'
            'openssh: ssh-askpass support'
            'libnotify: ssh-askpass support')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
  "${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '6927F7D45F567621E14121DDFD1D670D31F82A81' # Michael Cordover; available from https://keybase.io/mjec/pgp_keys.asc?fingerprint=6927f7d45f567621e14121ddfd1d670d31f82a81
)
sha256sums=(
  '8fc370abcfac0e6beb99ed237e8e7222e51e270ad0b6b8952cce67c83fbd54cd'
  'b63dffc2a38398faae9d8b0722cbaa6e6c5742bb6b77db29684fddd2f24124ab'
)
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CC=gcc make all -j
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Adding file capabilities doesn't work during build, it will be done later through fido2-hmac-secret.install
  make DESTDIR="$pkgdir" PREFIX=/usr SETCAP_BINARY=0 install
}
