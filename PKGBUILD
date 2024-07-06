# Maintainer: EinfxchFinn <finn.kuenstner@gmail.com>
pkgname=vesktop_electron
_pkgname=Vesktop
pkgdesc="Vesktop gives you the performance of web Discord and the comfort of Discord Desktop, using the Electron provided by the system"
pkgver=1.5.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('electron31')
makedepends=('pnpm' 'git')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
  'arrpc: Rich presence support'
)
provides=('vesktop')
conflicts=('vesktop' 'vesktop-bin' 'vesktop-git')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'vesktop.desktop'
        'vesktop.sh')
sha256sums=('615ed9275a03974a0c6486c0095cfcd0af246363a4f62ec0bdc985c763cc6334'
            'f279b1e469fb965cdf6dba9b4f428b0a7f28f414d84a47c6481b726adeb99c2b'
            '7b3853ee6574bda3d20f34df0b7977db5bd8d7b3a111e44caff2698a3cafae2b')
prepare() {
  # Use system's electron
  sed -i '/linux/s/^/        "electronDist": "\/usr\/lib\/electron31",\n/' "$srcdir/$_pkgname-$pkgver/package.json"
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
  install -Dm 644 "$_pkgname-$pkgver/static/icon.png" "$pkgdir/usr/share/pixmaps/vesktop.png"
  install -Dm 644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
