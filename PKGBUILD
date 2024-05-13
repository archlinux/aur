# Maintainer: Arne Brücher <archlinux[at]arne-bruecher[dot]de>
# Contributor: Bruno Antunes <sardaukar.siet@gmail.com>

pkgname=tailscale-systray-git
_realname=tailscale-systray
pkgver=r31.e7f8893
pkgrel=1
pkgdesc='Linux port of tailscale system tray menu.'
arch=('x86_64')
url="https://github.com/mattn/tailscale-systray"
license=('MIT')
depends=('tailscale' 'libappindicator-gtk3' 'libayatana-appindicator')
makedepends=('go' 'git' 'gcc' 'gtk3')
source=( 'tailscale-systray.desktop'
         'icon.png'
         'LICENSE'
         'git+https://github.com/mattn/tailscale-systray')
sha256sums=( '47f2e6019aaed0bd61d6f8b096a8bd41f9e58ec4c84d16c44bb6890ff77906ce'
             'daffb052995411f5c25ac8977531bccb63a82d259817d4bd7808668fd4b5373c'
             'd467163815d58e1aa199ffb6985cdc252b7c71fb454c5b6c5860498806c56670'
             'SKIP')
pkgver() {
  cd "$_realname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

_gitname=tailscale-systray

build() {
  cd "$srcdir/tailscale-systray"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build
}

package() {
  cd "$srcdir/tailscale-systray"

  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/icons/tailscale-systray
  mkdir -p $pkgdir/usr/share/licenses/tailscale-systray-git
  mkdir -p $pkgdir/usr/share/applications

  install -m755 $srcdir/tailscale-systray/tailscale-systray $pkgdir/usr/bin/tailscale-systray
  install -m644 $srcdir/icon.png $pkgdir/usr/share/icons/tailscale-systray/icon.png
  install -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/tailscale-systray-git/LICENSE
  install -Dm644 $srcdir/tailscale-systray.desktop $pkgdir/usr/share/applications/tailscale-systray.desktop
}
