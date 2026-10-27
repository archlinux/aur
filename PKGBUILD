# Maintainer: Dmitry Olyenyov <dmitry.olyenyov at gmail dot com>

pkgname=pi-remote-control-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='Remote control for running Pi sessions: prc server with the mobile web UI built in'
arch=('x86_64' 'aarch64')
url='https://github.com/mipsel64/pi-remote-control'
license=('MIT')
depends=('glibc' 'libgcc')
provides=("pi-remote-control=$pkgver")
conflicts=('pi-remote-control' 'pi-remote-control-git')
options=('!debug')
install="$pkgname.install"

source_x86_64=("prc-$pkgver-linux-amd64.tar.gz::https://github.com/mipsel64/pi-remote-control/releases/download/v$pkgver/prc-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("prc-$pkgver-linux-arm64.tar.gz::https://github.com/mipsel64/pi-remote-control/releases/download/v$pkgver/prc-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('cd8efec86f49b57a0f1c65709ef9860ae00c73ab1ded6985d5d00795305cb868')
sha256sums_aarch64=('48487305dbdc810949297735a6ca01f0bfec7faa4843d38fc56e942458f28bf3')

prepare() {
  # The tarball has no top-level directory, so makepkg unpacks it in place.
  # Upstream ships the service template with a ~/.local/bin path; use ours.
  sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/prc serve|' \
    examples/linux/pi-remote-control.service
  # Fail the build rather than silently shipping a unit we did not rewrite.
  grep -q '^ExecStart=/usr/bin/prc serve$' examples/linux/pi-remote-control.service
}

package() {
  install -Dm755 prc "$pkgdir/usr/bin/prc"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/linux/pi-remote-control.service \
    "$pkgdir/usr/lib/systemd/user/pi-remote-control.service"
}
