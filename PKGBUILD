# Maintainer: Philip Zingmark philip.zingmark@gmail.com
pkgname=kubemerger-git
pkgver=0.1.1
pkgrel=1
pkgdesc="A daemon that finds and merges kubeconfigs inta a single kubeconfig"
arch=('any')
url="https://github.com/Phillezi/kubemerger"
license=('MIT')
depends=('systemd')
makedepends=('go' 'git')
source=("git+https://github.com/Phillezi/kubemerger.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/kubemerger"
}

build() {
  cd "$srcdir/kubemerger"

  # Build
  go run build.go
}

package() {
  cd "$srcdir/kubemerger"

  # Copy the binary
  install -Dm755 ./bin/kubemergerd "$pkgdir/usr/local/bin/kubemergerd"

  # Install the systemd user service
  install -Dm644 ./dist/kubemergerd.service "$pkgdir/usr/lib/systemd/user/kubemergerd.service"
}

post_install() {
  # Enable and start the systemd service
  systemctl --user daemon-reload
  systemctl --user enable --now kubemergerd.service
}

post_remove() {
  # Disable and stop the systemd service
  systemctl --user stop kubemergerd.service
  systemctl --user disable kubemergerd.service
  systemctl --user daemon-reload

  # Remove the binary and the systemd service file
  rm -f "$pkgdir/usr/local/bin/kubemergerd"
  rm -f "$pkgdir/usr/lib/systemd/user/kubemergerd.service"
}

