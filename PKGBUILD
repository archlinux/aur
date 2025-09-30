# Maintainer: Cortex
# Forked from vesktop
pkgname=equibop
_pkgname=Equibop
pkgdesc="Equibop is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=2.1.7
# Reminder for devs: don't forget to update the electron version on equibop.sh
pkgrel=1
electron=electron38
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
sha256sums=('38a86c0248f28cc1d0e656babc4b7a87c840c85ebc36ae8a78080e627c9cfd48'
            '1e4766362fab2657e6b9a6a0a742518b545a5678f211ba25f7fdd3f5080d48d5'
            'c3d06d3b1e2ecb73c082fa1b5f919a6890dab0cae05b7320214031670bf16d36')

prepare() {
  cd "$_pkgname-$pkgver"

  # Use system's electron
  #  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${electron}\",\n/" package.json
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
