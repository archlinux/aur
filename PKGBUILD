# Maintainer: Michael Cordover <khefin@mjec.net>

# WARNING:
# This package will be deprecated and removed from the AUR at the end of 2022.
# See https://github.com/mjec/khefin/issues/42 for more information.

pkgname=khefin
pkgver=0.6.1
pkgrel=3
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
replaces=('fido2-hmac-secret')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
  "${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '6927F7D45F567621E14121DDFD1D670D31F82A81' # Michael Cordover; available from https://keybase.io/mjec/pgp_keys.asc?fingerprint=6927f7d45f567621e14121ddfd1d670d31f82a81
)
sha256sums=(
  '0655c4a7d258e976337c3b0154a712187cc01f737478aaa0a02115a6d3a5ef12'
  'b860ad459d112bdec0be28f7c36721978cfe183db9ca762bee05b09a9746e5c6'
)
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/usr CC=gcc make all mkinitcpio -j
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Adding file capabilities doesn't work during build, it will be done later through fido2-hmac-secret.install
  make DESTDIR="$pkgdir" PREFIX=/usr SETCAP_BINARY=0 install
}
