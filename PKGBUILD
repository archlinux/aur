# Maintainer: Mutker Telag <hello@mutker.com>

pkgname=nvidiactl-git
_pkgname=${pkgname%-git}
pkgver=v0.5.0.r0.gea6b5ed
pkgrel=1
pkgdesc='A tool providing dynamic fan speed and power limit adjustments for NVIDIA GPUs, balancing performance and noise. It can optionally be run as a systemd service.'
arch=('x86_64')
options=('!strip')
license=('MIT')
depends=('NVIDIA-MODULE')
makedepends=('git' 'go>=1.26' 'gcc')
optdepends=('sudo' 'doas')
url="https://codeberg.org/mutker/$_pkgname"
source=("$_pkgname::git+$url.git")
install=nvidiactl.install
backup=('etc/nvidiactl.conf')
conflicts=("$_pkgname")
provides=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  if [ ! -d "cmd/nvidiactl" ]; then
    echo "Error: cmd/nvidiactl directory not found"
    return 1
  fi
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_ENABLED=1
  local version
  version=$(tr -d '[:space:]' < VERSION)
  go build -v \
    -ldflags="-s -w -X main.Version=${version}" \
    -trimpath \
    -o build/"$_pkgname" ./cmd/nvidiactl
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 build/"$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 "$_pkgname.example.conf" "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.example.conf"
  install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 "$_pkgname.example.conf" "$pkgdir/etc/$_pkgname.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
