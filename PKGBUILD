# Maintainer: picokan <todaysoracle@protonmail.com>
pkgname=vencord-desktop
_pkgname=Vesktop
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=0.4.4
pkgrel=3

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

source=($url/archive/refs/tags/v$pkgver.tar.gz vencord-desktop.desktop vencord-desktop.sh)

sha256sums=(98776a826017803826b8f24483ac460ce9d725d75882ea1b79a303c3d25da620
            'SKIP'
            b1c9ce99ba545b0baaba0eb63e5bb7a2f88cf335f66d775f32fa139ce6b479ab)

prepare() {
    #grabbin path for an installed electron
    #any ideas for a better way of doing this are welcome
    find /usr/lib -type d -name electron* |\
    sed 's/\/usr\//        "electronDist": "\/usr\//' |\
    sed 's/$/",/' |\
    sed -i '72e cat /dev/stdin' "$srcdir/$_pkgname-$pkgver/package.json"
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
