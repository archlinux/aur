# Maintainer: bolikcraft <bolikcraft@gmail.com>

pkgname=vantah-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="Unofficial GUI and tray front-end for the AdGuard VPN CLI (adguardvpn-cli)"
arch=('x86_64')
url="https://github.com/bolikcraft/vantah"
license=('GPL-3.0-or-later')
# Сборка self-contained: рантайм .NET внутри бинаря, системными остаются только
# библиотеки, которые он и Avalonia грузят динамически. namcap считает часть из них
# лишними — он видит только NEEDED в ELF, а ICU, OpenSSL и иксовые библиотеки .NET и
# Avalonia открывают через dlopen, поэтому список оставлен полным.
depends=('glibc' 'gcc-libs' 'zlib' 'icu' 'openssl' 'fontconfig' 'libx11' 'libice' 'libsm'
         'hicolor-icon-theme')
# CLI намеренно не в depends: её ставят и официальным установщиком AdGuard, минуя pacman.
optdepends=('adguardvpn-cli-bin: the AdGuard VPN CLI itself — Vantah is useless without it')
provides=('vantah')
conflicts=('vantah')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/vantah-$pkgver-linux-x64.tar.gz")
sha256sums=('61a56f6bfc12020cc5fa4983cd0ef5f20b0e5b99e4f32f810fe28c472f2bc7e8')

package() {
  cd "vantah-$pkgver-linux-x64"

  # Бинарь в /usr/lib: он самодостаточный и не предназначен для запуска из PATH напрямую.
  install -Dm755 vantah "$pkgdir/usr/lib/vantah/vantah"
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/vantah/vantah "$pkgdir/usr/bin/vantah"

  install -Dm644 share/applications/vantah.desktop \
    "$pkgdir/usr/share/applications/vantah.desktop"
  install -Dm644 share/metainfo/io.github.bolikcraft.vantah.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.bolikcraft.vantah.metainfo.xml"

  for icon in share/icons/hicolor/*/apps/vantah.png; do
    size=$(basename "$(dirname "$(dirname "$icon")")")
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/vantah.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
