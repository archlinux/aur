# Maintainer: creations
pkgname=equibop
_pkgname=Equibop
pkgdesc="A custom Discord desktop app with Equicord pre-installed"
pkgver=3.2.1
# Reminder for devs: don't forget to update the electron version on equibop.sh
pkgrel=2
electron=electron40
arch=('x86_64' 'aarch64')
url="https://github.com/Equicord/Equibop"
license=('GPL3')
depends=("${electron}")
makedepends=('bun' 'cmake' 'gcc' 'nodejs' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!strip')
conflicts=('equibop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'equibop.desktop'
        'equibop.sh')
sha256sums=('1446c5e67948fbb834479b75df5ff252dba45b9f0f85b36bd69eadb05e620a13'
            '2df1651c56f3ac253b679db81500474f54e9887321db0daa4d3ac2a1ebad5f4d'
            '1e9d4af9873cc2c97d4400579f169f337aef0f36b8e67175013a6dbf4d56ea40')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  #  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
}

build() {
  cd "$_pkgname-$pkgver"

  export SKIP_BUN_DOWNLOAD=true
  CI=true bun install
  bun run buildLibVesktop
  bun run package:dir
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/"
  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app-update.yml" "${pkgdir}/usr/lib/${pkgname}/"
  cp -r "$_pkgname-$pkgver/dist/linux-unpacked/resources/arrpc" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 "./equibop.sh" "$pkgdir/usr/bin/equibop"

  install -Dm 644 "equibop.desktop" "$pkgdir/usr/share/applications/equibop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
