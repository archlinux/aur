# Maintainer: Cortex
# Forked from vesktop
pkgname=sunroof
_pkgname=Sunroof
pkgdesc="Sunroof is a Vesktop fork that gives you the performance of web Discord and the comfort of Discord Desktop, with additional plugins."
pkgver=1.6.1
# Reminder for devs: don't forget to update the electron version on sunroof.sh
pkgrel=5
electron=electron31
arch=('x86_64' 'aarch64')
url="https://github.com/verticalsync/Sunroof"
license=('GPL3')
depends=("${electron}")
makedepends=('pnpm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
conflicts=('sunroof-bin')
source=("https://github.com/verticalsync/Sunroof/archive/refs/tags/v${pkgver}.tar.gz"
        'me.verticalsync.sunroof.desktop'
        'sunroof.sh')
sha256sums=('b021131a858ef7b4773dd0695e8fc7b7f8b575baec8a9fcce633fbd10b5fffd7'
            '5c6ee4df61afe818b0c3196d358b911a78ae337a4f2a8a4d753bf50d39b759e5'
            'ecaa2845dbe8cf86da4d1d23bef9460564762966cf3c769dcc2d7da159cd3e87')

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
  install -Dm755 "./sunroof.sh" "$pkgdir/usr/bin/sunroof"

  install -Dm 644 "me.verticalsync.sunroof.desktop" "$pkgdir/usr/share/applications/me.verticalsync.sunroof.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
