# Maintainer: Thomas Gerbet <thomas at gerbet dot me>

# yubikey-agent can be started with `systemctl --user start yubikey-agent.service`
# Enabled with the user session with `systemctl --user enable yubikey-agent.service`
# The PC/SC Smart Card Daemon must activated: `systemctl enable --now pcscd.socket`
# Socket path is "${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"

pkgname=yubikey-agent
pkgver=0.1.6
pkgrel=1
pkgdesc='A seamless ssh-agent for YubiKeys'
arch=('x86_64' 'aarch64')
url="https://filippo.io/yubikey-agent"
license=('BSD')
depends=('pcsclite' 'pinentry')
makedepends=('go')
source=(
  "https://github.com/FiloSottile/yubikey-agent/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'f156d089376772a34d2995f8261d821369a96a248ab586d27e3be0d9b72d7426'
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

  install -Dm644 contrib/systemd/user/yubikey-agent.service "$pkgdir"/usr/lib/systemd/user/yubikey-agent.service
}
