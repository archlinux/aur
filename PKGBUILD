# Maintainer: picokan <todaysoracle@protonmail.com>
pkgname=vencord-desktop
_pkgname=Vesktop
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=0.4.3
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL')

depends=("electron")
makedepends=("pnpm" "git")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vencord")
conflicts=("vencord")

source=($url/archive/refs/tags/v$pkgver.tar.gz vencord-desktop.desktop vencord-desktop.sh use_system_electron.diff)

sha256sums=(50b527efe2cd4c329acc3d5209bd82fd7765504fb0241cad327b0d9bc5e2d084
            'SKIP'
            b1c9ce99ba545b0baaba0eb63e5bb7a2f88cf335f66d775f32fa139ce6b479ab
            6c0f1977fb304fb70a53625d99aa1dd6859597fb932e100c0021fd933cdd4616)

prepare() {
    patch "$srcdir/$_pkgname-$pkgver/package.json" < use_system_electron.diff
}

build() {
  cd "$_pkgname-$pkgver"

  pnpm i
  pnpm package:dir
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/lib/vencord
  cp -R "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/vencord"
  install -Dm755 "./vencord-desktop.sh" "$pkgdir/usr/bin/vencord-desktop"

  install -Dm 644 "vencord-desktop.desktop" "$pkgdir/usr/share/applications/vencord-desktop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/vencord.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname-$pkgver/LICENSE"
}
