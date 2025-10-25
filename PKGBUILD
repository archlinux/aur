# Maintainer: Cortex
# Forked from vesktop
pkgname=equibop
_pkgname=Equibop
pkgdesc="Equibop is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=3.0.4
# Reminder for devs: don't forget to update the electron version on equibop.sh
pkgrel=1
electron=electron38
arch=('x86_64' 'aarch64')
url="https://github.com/Equicord/Equibop"
license=('GPL3')
install=equibop.install
depends=("${electron}")
makedepends=('bun' 'cmake' 'gcc')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
conflicts=('equibop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'org.equicord.equibop.desktop'
        'equibop.sh'
        'equibop.install')
sha256sums=('ff6ce12e32d5afed2b671d0ee330e2fde0b942150e25c6675ab8ffd727a513b2'
            '1e4766362fab2657e6b9a6a0a742518b545a5678f211ba25f7fdd3f5080d48d5'
            'c3d06d3b1e2ecb73c082fa1b5f919a6890dab0cae05b7320214031670bf16d36'
            '18b5fbb1bf53b47b8a7438b2127b1f1a31d23c69d39a156cde66e1616710a18a')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  #  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
}

build() {
  cd "$_pkgname-$pkgver"

  bun install
  bun run buildLibVesktop
  bun run package:dir
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/"
  cp -r "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname}/"
  cp -r "$_pkgname-$pkgver/dist/linux-unpacked/resources/bun" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 "./equibop.sh" "$pkgdir/usr/bin/equibop"

  install -Dm 644 "org.equicord.equibop.desktop" "$pkgdir/usr/share/applications/org.equicord.equibop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
