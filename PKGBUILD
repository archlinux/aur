# Maintainer: Shawn McCool <shawn@mccool.email>
pkgname=wolverine-ctl
pkgver=0.1.1
pkgrel=1
pkgdesc="Configure Razer Wolverine controllers on Linux: polling rate and button mapping, stored on the controller"
arch=('x86_64' 'aarch64')
url="https://github.com/ShawnMcCool/wolverine-ctl"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/ShawnMcCool/wolverine-ctl.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=v${pkgver}" -o wolverine-ctl .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 wolverine-ctl "$pkgdir/usr/bin/wolverine-ctl"
  # Under /usr/lib so pacman's systemd-udev hook reloads rules on install/remove.
  install -Dm644 udev/70-wolverine-ctl.rules "$pkgdir/usr/lib/udev/rules.d/70-wolverine-ctl.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md SOURCES.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
