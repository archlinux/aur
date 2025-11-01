# Maintainer: Cortex
# Forked from vesktop
pkgname=equibop
_pkgname=Equibop
pkgdesc="Equibop is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=3.1.0
# Reminder for devs: don't forget to update the electron version on equibop.sh
pkgrel=1
electron=electron39
arch=('x86_64' 'aarch64')
url="https://github.com/Equicord/Equibop"
license=('GPL3')
install=equibop.install
depends=("${electron}")
makedepends=('bun-bin' 'cmake' 'gcc' 'nodejs')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!strip')
conflicts=('equibop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'org.equicord.equibop.desktop'
        'equibop.sh'
        'equibop.install')
sha256sums=('c7b7c868c426071e7d3f1579ab8858b369392c0a6013bc18c84bfaf888dacf56'
            '1e4766362fab2657e6b9a6a0a742518b545a5678f211ba25f7fdd3f5080d48d5'
            '837f21015857b60fb7a9de2e7f7e1865d4c42ca5b8c96927208b6bdf28ec4e06'
            '18b5fbb1bf53b47b8a7438b2127b1f1a31d23c69d39a156cde66e1616710a18a')

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

  install -Dm 644 "org.equicord.equibop.desktop" "$pkgdir/usr/share/applications/org.equicord.equibop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
