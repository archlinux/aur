# Maintainer: enzomtp
pkgname=pawtop
_pkgname=Pawtop
pkgdesc="A custom Discord desktop app with PawsomeVencord pre-installed"
pkgver=3.3.4
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/enzomtpYT/Pawtop"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'nss')
makedepends=('bun' 'cmake' 'gcc' 'nodejs' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
  'xdg-desktop-portal: Screensharing with Wayland'
)
options=('!strip')
conflicts=('pawtop-bin')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
        'pawtop.desktop'
        'pawtop.sh')
sha256sums=('3ffcf80cdb7ad9540fed80e458f11906d3a8f5c2b50402f6944660abd8023a4a'
            'b6b5a49e34a7185f16968be64fdc3f3d2254202e6b9ed380d1590fe77b860c4b'
            'e6ed7a0cdf84a832c3f2d543111516bac00ca622c562c565055c3585edcd28d2')

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

  install -Dm755 "$srcdir/pawtop.sh" "$pkgdir/usr/bin/pawtop"
  install -Dm644 "$srcdir/pawtop.desktop" "$pkgdir/usr/share/applications/pawtop.desktop"
  install -Dm644 "static/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
