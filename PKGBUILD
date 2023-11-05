# Maintainer: zt <zt@zt64.dev>
pkgname=vencord-desktop-git
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=r220.b245354
pkgrel=3

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL')

depends=()
makedepends=("pnpm" "git")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vencord")
conflicts=("vencord")

source=("$pkgname::git+$url.git" "vencorddesktop.desktop")

sha256sums=('SKIP'
            'cd4d39fb009bfee33709c26c010a8fe70a76ee3c00006e822da2fec692a165d5')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"

  pnpm i
  pnpm package:dir
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"/opt/vencord
  cp -R "$pkgname/dist/linux-unpacked/." "$pkgdir/opt/vencord"

  install -Dm 644 "vencorddesktop.desktop" "$pkgdir/usr/share/applications/vencorddesktop.desktop"
  install -Dm 644 "$pkgname/static/icon.png" "$pkgdir/usr/share/pixmaps/vencord.png"
  install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir"/usr/bin
  ln -s /opt/vencord/vencorddesktop "$pkgdir"/usr/bin/vencord-desktop
}
