# Maintainer: zt <nwowens32@gmail.com>
pkgname=vencord-desktop-git
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=r142.d884b7d
pkgrel=3

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Desktop"
license=('GPL')

depends=()
makedepends=("pnpm" "git")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vencord")
conflicts=("vencord")

source=("$pkgname::git+$url.git" "vencord.desktop")

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

  install -Dm 644 "vencord.desktop" "$pkgdir/usr/share/applications/vencord.desktop"
  install -Dm 644 "$pkgname/static/icon.png" "$pkgdir/usr/share/pixmaps/vencord.png"
  install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir"/usr/bin
  ln -s /opt/vencord/vencorddesktop "$pkgdir"/usr/bin/vencord
}
