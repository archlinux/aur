# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

# yubikey-agent can be started with `systemctl --user start yubikey-agent.service`
# Started with the user session with `systemctl --user enable yubikey-agent.service`
# Socket path is "${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"

pkgname=yubikey-agent
pkgver=0.1.1
pkgrel=2
pkgdesc='A seamless ssh-agent for YubiKeys'
arch=('x86_64')
url="https://filippo.io/yubikey-agent"
license=('BSD')
depends=('pcsclite')
makedepends=('go-pie')
source=(
  "https://github.com/FiloSottile/yubikey-agent/archive/v${pkgver}.tar.gz"
  'yubikey-agent.service'
)
sha256sums=(
  'ba105395ec8321512742f69ce9cf7fc2fe4e107cf667c2b48d13749efff23d5c'
  'f50e0876cb6d13d7cbbb325053f3c6702aabc16948e266cc7c92a0ffc9ace0b9'
)

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "$srcdir"/yubikey-agent.service "$pkgdir"/usr/lib/systemd/user/yubikey-agent.service
}
