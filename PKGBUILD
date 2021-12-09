# Maintainer: Bruno Antunes <sardaukar.siet@gmail.com>
pkgname=tailscale-systray-git
pkgver=20211209
pkgrel=1
pkgdesc='Linux port of tailscale system tray menu.'
arch=('x86_64')
url="https://github.com/mattn/tailscale-systray"
license=('MIT')
depends=('tailscale' 'libappindicator-gtk3')
makedepends=('go' 'git' 'gcc' 'gtk3')
source=( 'tailscale-systray.desktop'
         'icon.png'
         'LICENSE'
         'git+https://github.com/mattn/tailscale-systray')
sha256sums=( 'a218407cfc354f3fa0844007aaac38c255e60a45aad09601208d73b03f3b7ebc'
             'daffb052995411f5c25ac8977531bccb63a82d259817d4bd7808668fd4b5373c'
             'd467163815d58e1aa199ffb6985cdc252b7c71fb454c5b6c5860498806c56670'
             'SKIP')

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
