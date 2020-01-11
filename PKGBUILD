# Maintainer: Michael Cordover <fido2-hmac-secret@mjec.net>

pkgname=fido2-hmac-secret
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple way to generate password-proteceted secrets from a FIDO2 authenticator with the hmac-secret extension"
arch=('x86_64')
url="https://github.com/mjec/fido2-hmac-secret"
license=('GPL3')
depends=('bash' 'libfido2' 'libcbor' 'libsodium' 'libcap')
makedepends=('git')
optdepends=('bash-completion: bash completion support'
            'mkinitcpio: initramfs support')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
  "${url}/releases/download/v${pkgver}/v${pkgver}.tar.gz.sig"
)
validpgpkeys=(
  '6927F7D45F567621E14121DDFD1D670D31F82A81' # Michael Cordover; available from https://keybase.io/mjec/pgp_keys.asc?fingerprint=6927f7d45f567621e14121ddfd1d670d31f82a81
)
sha256sums=(
  '2c933b489527de920457704e2bfab2fb0349cfd4fbff1bccad8af513f95b213f'
  'c3f72a1358415ec4919f55e16e15842247410fb33c0208109a760d217e1857d3'
)
install="$pkgname.install"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CC=gcc make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Adding file capabilities doesn't work during build, it will be done later through fido2-hmac-secret.install
  make DESTDIR="$pkgdir" PREFIX=/usr SETCAP_BINARY=0 install
}
