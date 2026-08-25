# Maintainer: psdkjoon <psdkjoon@gmail.com>
# This package installs the prebuilt release from GitHub — no Flutter/Dart
# SDK is required to build or install it. pkgver is updated automatically
# by .github/workflows/publish.yml on every tagged release. The tarball is
# verified in prepare() against the release's own SHA256SUMS manifest, so
# no hash needs to be baked into this file.
pkgname=plm-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="PSDK Login Manager — a minimal Flutter/PAM login manager (prebuilt)"
arch=('x86_64')
url="https://github.com/psdkjoon/plm"
license=('MIT')
depends=('gtk3' 'pam' 'cage')
provides=('plm')
conflicts=('plm')
install=plm.install
source=("plm-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/plm-${pkgver}-linux-x86_64.tar.gz"
        "SHA256SUMS::${url}/releases/download/v${pkgver}/SHA256SUMS")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir"
  grep " plm-${pkgver}-linux-x86_64.tar.gz\$" SHA256SUMS | sha256sum -c -
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/plm"
  cp -r bundle/. "$pkgdir/usr/lib/plm/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/plm/plm "$pkgdir/usr/bin/plm"

  install -Dm755 packaging/plm-session "$pkgdir/usr/lib/plm/plm-session"
  install -Dm644 packaging/pam.d/plm "$pkgdir/etc/pam.d/plm"
  install -Dm644 packaging/systemd/plm.service \
    "$pkgdir/usr/lib/systemd/system/plm.service"
  install -Dm644 packaging/systemd/session@.service \
    "$pkgdir/usr/lib/systemd/system/session@.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/plm/README.md"
}
