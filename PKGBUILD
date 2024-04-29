# Maintainer: EinfxchFinn <finn.kuenstner@gmail.com>
pkgname=vesktop_electron
_pkgname=Vesktop
pkgdesc="Vesktop gives you the performance of web Discord and the comfort of Discord Desktop, using the system provided Electron"
pkgver=1.5.1
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('electron29')
makedepends=('pnpm' 'git')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
provides=('vesktop')
conflicts=('vesktop')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'vesktop.desktop'
        'vesktop.sh')
sha256sums=('28f2fdc9a5d017446ad59f119dad0e2e649692d46c6ce8330891e7f0c725a33f'
            'f279b1e469fb965cdf6dba9b4f428b0a7f28f414d84a47c6481b726adeb99c2b'
            'f497f7897a3ee262c0ad69709d1241ae829454acc582d27f21e8cd70119ca687')
prepare() {
  # Use system's electron
  sed -i '/linux/s/^/        "electronDist": "\/usr\/lib\/electron29",\n/' "$srcdir/$_pkgname-$pkgver/package.json"
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
  install -Dm755 "./vesktop.sh" "$pkgdir/usr/bin/vesktop"

  install -Dm 644 "vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
