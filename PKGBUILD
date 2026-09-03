# Maintainer: bolikcraft <bolikcraft@gmail.com>

pkgname=vantah-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Unofficial GUI and tray front-end for the AdGuard VPN CLI (adguardvpn-cli)"
arch=('x86_64' 'aarch64')
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
# Ассеты релиза названы по .NET RID (linux-x64 / linux-arm64), а не по $CARCH,
# поэтому источники расписаны по архитектурам вручную.
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/vantah-$pkgver-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/vantah-$pkgver-linux-arm64.tar.gz")

sha256sums_x86_64=('f30b83085b2d69d9cbf0f93cd358eb7840227e6cccebd111375ce81e7d294b73')
sha256sums_aarch64=('407ab98ee50a595ea81f15a66dd1be9f63b0853b76c00000dec4d1b05341442e')

package() {
  # Каталог внутри архива повторяет имя ассета, т.е. RID, а не $CARCH.
  local _srcdir
  case "$CARCH" in
    x86_64)  _srcdir="vantah-$pkgver-linux-x64" ;;
    aarch64) _srcdir="vantah-$pkgver-linux-arm64" ;;
    *)       echo "unsupported CARCH: $CARCH" >&2; return 1 ;;
  esac

  cd "$_srcdir"

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
