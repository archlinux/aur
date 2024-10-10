# Maintainer: Mutker Telag <dark.dusk53443@fastmail.com>

pkgname=nvidiactl-git
_pkgname=${pkgname%-git}
pkgver=r24.7f13bca
pkgrel=1
pkgdesc='A tool providing dynamic fan speed and power limit adjustments for NVIDIA GPUs, balancing performance and noise. It can optionally be run as a systemd service.'
arch=('x86_64')
options=('!strip')
license=('MIT')
depends=('NVIDIA-MODULE')
makedepends=('git' 'go>=1.23' 'upx')
optdepends=('sudo' 'doas')
url="https://codeberg.org/mutker/$_pkgname"
source=("$_pkgname::git+$url.git")
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
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname"
  export CGO_ENABLED=1
  go build \
    -ldflags="-s -w" \
    -gcflags=all="-l -B" \
    -tags smallpt \
    -trimpath \
    -o build/"$_pkgname" .
  upx -qqq build/"$_pkgname"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm 755 build/"$_pkgname"  "$pkgdir"/usr/bin/"$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm 644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
