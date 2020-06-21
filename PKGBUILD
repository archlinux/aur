# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

# yubikey-agent can be started with `systemctl --user start yubikey-agent.service`
# Enabled with the user session with `systemctl --user enable yubikey-agent.service`
# The PC/SC Smart Card Daemon must activated: `systemctl enable --now pcscd.socket`
# Socket path is "${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"

pkgname=yubikey-agent
pkgver=0.1.2
pkgrel=1
pkgdesc='A seamless ssh-agent for YubiKeys'
arch=('x86_64')
url="https://filippo.io/yubikey-agent"
license=('BSD')
depends=('pcsclite' 'pinentry')
makedepends=('go')
source=(
  "https://github.com/FiloSottile/yubikey-agent/archive/v${pkgver}.tar.gz"
  'yubikey-agent.service'
)
sha256sums=(
  '0ce2bb4ca2140d225420e4121b17e2c9fd6ddb1e25f0dc61741ba832e9e857a6'
  'f50e0876cb6d13d7cbbb325053f3c6702aabc16948e266cc7c92a0ffc9ace0b9'
)

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "$srcdir"/yubikey-agent.service "$pkgdir"/usr/lib/systemd/user/yubikey-agent.service
}
