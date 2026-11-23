# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=shed-tui
pkgver=0.4.0
pkgrel=1
pkgdesc='Terminal app for keeping your projects in order: workbench, shelf and attic'
arch=('x86_64' 'aarch64')
url='https://git.okoyono.de/f/shed'
license=('MIT')
depends=('xdg-utils')
conflicts=('shed')
makedepends=('git' 'go')
optdepends=('sudo: fix file ownership'
            'git: clone repositories'
            'curl: download files'
            'wget: download files'
            'tar: unpack archives'
            'unzip: unpack zip archives'
            'glib2: move files to the trash with gio'
            'trash-cli: move files to the trash'
            'zenity: password prompt when fixing ownership (GNOME/GTK)'
            'kdialog: password prompt when fixing ownership (KDE)')
source=("$pkgname::git+https://git.okoyono.de/f/shed.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export GOFLAGS='-modcacherw'
  go mod download -x
}

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags "-X main.version=v$pkgver" -o shed ./cmd/
}

check() {
  cd "$pkgname"
  export HOME="$srcdir/home"
  mkdir -p "$HOME"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 shed "$pkgdir/usr/bin/shed"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md CONFIGURATION.md KEYBINDINGS.md -t "$pkgdir/usr/share/doc/$pkgname"
}
