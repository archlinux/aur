# Maintainer: 0x90shell
pkgname=gamepad-osk-git
pkgver=r50.dbdfc16
pkgrel=1
pkgdesc="Gamepad-controlled on-screen keyboard for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/0x90shell/gamepad-osk"
license=('MIT')
depends=('sdl3' 'sdl3_ttf' 'wayland' 'libx11' 'ttf-promptfont')
makedepends=('git' 'go' 'libx11' 'wayland' 'wlr-protocols')
provides=('gamepad-osk')
conflicts=('gamepad-osk' 'gamepad-osk-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=gamepad-osk-git.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o gamepad-osk .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 gamepad-osk "$pkgdir/usr/bin/gamepad-osk"
  install -Dm644 config.example "$pkgdir/usr/share/gamepad-osk/config"
  install -Dm644 gamepad-osk.service "$pkgdir/usr/lib/systemd/user/gamepad-osk.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/gamepad-osk/README.md"
  install -Dm644 gamepad-osk.udev "$pkgdir/usr/lib/udev/rules.d/80-gamepad-osk.rules"
}
