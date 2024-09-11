# Maintainer: Cortex
# Forked from vesktop
pkgname=equibop
_pkgname=Equibop
pkgdesc="Equibop is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=2.0.9
# Reminder for devs: don't forget to update the electron version on equibop.sh
pkgrel=1
electron=electron31
arch=('x86_64' 'aarch64')
url="https://github.com/Equicord/Equibop"
license=('GPL3')
depends=("${electron}")
makedepends=('pnpm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
conflicts=('equibop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'io.github.equicord.equibop.desktop'
        'equibop.sh')
sha256sums=('b6ec6474de14ac718a577a2fe2a178800caab3322ba9d58fb6292691dba7324d'
            'd84e7ae91a126374948ccaa86bf2d0e64bb198f748596f8c086e19a1bf3827ad'
            'ae9f22bb24ffe42a14ac59b20e7d48c807aa96272eb2c2c36b93b4aee161d02c')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
}

build() {
  cd "$_pkgname-$pkgver"

  pnpm i
  pnpm package:dir
}

package() {
  cd "$srcdir"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  cp "$_pkgname-$pkgver/dist/linux-unpacked/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 "./equibop.sh" "$pkgdir/usr/bin/equibop"

  install -Dm 644 "io.github.equicord.equibop.desktop" "$pkgdir/usr/share/applications/io.github.equicord.equibop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
