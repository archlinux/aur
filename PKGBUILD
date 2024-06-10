# Maintainer: EinfxchFinn <finn.kuenstner@gmail.com>
pkgname=vesktop_electron
_pkgname=Vesktop
pkgdesc="Vesktop gives you the performance of web Discord and the comfort of Discord Desktop, using the system provided Electron"
pkgver=1.5.2
pkgrel=3
arch=('x86_64' 'aarch64')
url="https://github.com/Vencord/Vesktop"
license=('GPL3')
depends=('electron30')
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
sha256sums=('2795891c71d3ec39fd412cf1396a3172499b58619b2e7f92ce81de3db19d5de7'
            'f279b1e469fb965cdf6dba9b4f428b0a7f28f414d84a47c6481b726adeb99c2b'
            'a644d0eccfdf6d5e02cb5103711b2751d7dca6b7c689267262f2a8467a48143e')
prepare() {
  # Accept any pnpm version
  sed -i 's/"pnpm@.*/"pnpm@"\,/' "$srcdir/$_pkgname-$pkgver/package.json"
  # Use system's electron
  sed -i '/linux/s/^/        "electronDist": "\/usr\/lib\/electron30",\n/' "$srcdir/$_pkgname-$pkgver/package.json"
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
