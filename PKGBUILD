# Maintainer: creations
pkgname=equibop
_pkgname=Equibop
pkgdesc="A custom Discord desktop app with Equicord pre-installed"
pkgver=3.3.3
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/Equicord/Equibop"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'nss')
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
sha256sums=('b4fcbb4ee3db745647c608d2aabb83ac9959cfbc46e56f42e542b2886227c513'
            '2df1651c56f3ac253b679db81500474f54e9887321db0daa4d3ac2a1ebad5f4d'
            '2b191fca6474ba8150c3f3627c83578129c6e5328effa8eb74d8f70f64f8f5ea')

build() {
  cd "$_pkgname-$pkgver"

  export SKIP_BUN_DOWNLOAD=true
  CI=true bun install
  bun run buildLibVesktop
  bun run package:dir
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  case "${CARCH}" in
    aarch64) _unpacked="linux-arm64-unpacked" ;;
    *) _unpacked="linux-unpacked" ;;
  esac

  install -d "${pkgdir}/usr/lib/${pkgname}"
  cp -R "dist/${_unpacked}/." "${pkgdir}/usr/lib/${pkgname}/"

  install -Dm755 "$srcdir/equibop.sh" "$pkgdir/usr/bin/equibop"
  install -Dm644 "$srcdir/equibop.desktop" "$pkgdir/usr/share/applications/equibop.desktop"
  install -Dm644 "static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
