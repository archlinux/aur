# Maintainer: Vyrnexis
#
# Event-driven status feeder for nimdow-wl, built from git.
#   cd packaging/arch && makepkg -si
#
# The only Nim dependency (parsetoml) is a pinned source tarball, so nothing
# but the sources below is downloaded at build time.
pkgname=nimdow-wl-status-git
pkgver=0.3.0.r12.gf04820a
pkgrel=1
pkgdesc='Event-driven status bar feeder for the nimdow-wl window manager'
arch=('x86_64' 'aarch64')
url='https://github.com/Vyrnexis/nimdow-wl-status'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'nim')
optdepends=('nimdow-wl-git: the window manager whose bar this feeds'
            'networkmanager: Wi-Fi SSID in the net segment (nmcli)'
            'pacman-contrib: scripts/updates.sh (checkupdates)'
            'libpulse: scripts/volume.sh (pactl)'
            'curl: scripts/weather.sh')
provides=('nimdow-wl-status')
conflicts=('nimdow-wl-status')
source=('nimdow-wl-status::git+https://github.com/Vyrnexis/nimdow-wl-status.git#branch=main'
        'parsetoml-0.7.2.tar.gz::https://github.com/NimParsers/parsetoml/archive/refs/tags/v0.7.2.tar.gz')
sha256sums=('SKIP'
            '568acfd8193ca9e2bdb5f40ed71c2ccf35d4f50778bb25c8d26ed1e8896f89c8')

pkgver() {
  cd nimdow-wl-status
  local version
  version=$(sed -n 's/^version *= *"\(.*\)"/\1/p' nimdow_wl_status.nimble)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd nimdow-wl-status
  mkdir -p bin
  nim c -d:release --hints:off \
    --nimcache:"$srcdir/nimcache" \
    --path:"$srcdir/parsetoml-0.7.2/src" \
    --passC:"$CFLAGS" --passL:"$LDFLAGS" \
    -o:bin/nimdow-wl-status src/nimdow_wl_status.nim
}

package() {
  cd nimdow-wl-status
  install -Dm755 bin/nimdow-wl-status "$pkgdir/usr/bin/nimdow-wl-status"
  install -Dm644 config.default.toml "$pkgdir/usr/share/nimdow-wl-status/config.default.toml"
  install -Dm755 -t "$pkgdir/usr/share/nimdow-wl-status/scripts" scripts/*.sh
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
