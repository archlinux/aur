# Maintainer: Michael Cordover <khefin@mjec.net>

pkgname=khefin
pkgver=0.6.0
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
replaces=('fido2-hmac-secret')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
  "${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '6927F7D45F567621E14121DDFD1D670D31F82A81' # Michael Cordover; available from https://keybase.io/mjec/pgp_keys.asc?fingerprint=6927f7d45f567621e14121ddfd1d670d31f82a81
)
sha256sums=(
  '17718eac0ff5a8e618aa0a6c0aa7312884d856ac219c912e17b638349e4cefef'
  '0a5bf1f6f5b0bebc2e58134219f330e3d2fc71f7982e53ad4412a3ae06dc058b'
)
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PREFIX=/ur CC=gcc make all mkinitcpio -j
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Adding file capabilities doesn't work during build, it will be done later through fido2-hmac-secret.install
  make DESTDIR="$pkgdir" PREFIX=/usr SETCAP_BINARY=0 install
}
