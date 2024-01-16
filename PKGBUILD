# Maintainer: picokan <todaysoracle@protonmail.com>
pkgname=vesktop
_pkgname=Vesktop
pkgdesc="A standalone Electron app that loads Discord & Vencord"
pkgver=1.5.0
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

source=($url/archive/refs/tags/v$pkgver.tar.gz vesktop.desktop vesktop.sh)

sha256sums=(7f20edeb4612386ae98d5dccfa4b37ad1f5336d4551de3375c3b16e81925b10a
            80d0c3dac36676b73e0716a83467e19707c4a069f826f1ebca9e9b6a531d77a5
            b1c9ce99ba545b0baaba0eb63e5bb7a2f88cf335f66d775f32fa139ce6b479ab)

prepare() {
    #grabbin path for an installed electron
    #any ideas for a better way of doing this are welcome
    find /usr/lib -maxdepth 1 -type d -name electron* |\
    sed 's/\/usr\//        "electronDist": "\/usr\//' |\
    sed 's/$/",/' |\
    sed -i '74e cat /dev/stdin' "$srcdir/$_pkgname-$pkgver/package.json"
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
  install -Dm755 "./vesktop.sh" "$pkgdir/usr/bin/vesktop"

  install -Dm 644 "vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/vencord.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname-$pkgver/LICENSE"
}
