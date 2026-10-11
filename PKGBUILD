# Maintainer: Rasi <rasi@xssn.at>

pkgname=pocketlink-git
_pkgname=pocketlink
pkgver=0.4.0.r2.g8242f63
pkgrel=1
pkgdesc='Lightweight phone companion for sway, niri & co: notifications, clipboard, files, media remote and calls'
arch=('x86_64' 'aarch64')
url='https://github.com/carnager/pocketlink'
license=('GPL-3.0-or-later')
depends=('glibc' 'wl-clipboard' 'xdg-utils')
makedepends=('git' 'go')
optdepends=(
  'wireplumber: lower the volume during phone calls (wpctl)'
  'dms-shell: panel widget for pairing and settings'
  'gvfs-dnssd: browse phone files in Thunar and Nautilus (dav://)'
  'nautilus-python: "Send to phone" in the Nautilus context menu'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  go mod download -modcacherw
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  go build -o build/ ./cmd/pocketlink
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/pocketlink -t "$pkgdir/usr/bin/"

  # The repo's unit points at ~/.local/bin for source installs.
  sed 's|^ExecStart=.*|ExecStart=/usr/bin/pocketlink daemon|' contrib/pocketlink.service |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/pocketlink.service"

  # DankMaterialShell's system-wide plugin directory.
  install -Dm644 contrib/dms/pocketlink/* -t "$pkgdir/etc/xdg/quickshell/dms-plugins/pocketlink/"

  # "Send to phone" in file managers' context menus.
  local fm=contrib/filemanager
  install -Dm644 $fm/pocketlink-send.servicemenu.desktop "$pkgdir/usr/share/kio/servicemenus/pocketlink-send.desktop"
  install -Dm644 $fm/pocketlink.thunar-sendto.desktop "$pkgdir/usr/share/Thunar/sendto/pocketlink.desktop"
  install -Dm644 $fm/pocketlink-send.nemo_action -t "$pkgdir/usr/share/nemo/actions/"
  install -Dm644 $fm/pocketlink-nautilus.py "$pkgdir/usr/share/nautilus-python/extensions/pocketlink.py"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
}
