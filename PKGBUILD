# Maintainer: Andy Alt <arch_stanton5995 at proton.me>

pkgname=dealers-choice
pkgver=0.0.14
pkgrel=1
pkgdesc="Online Multiplayer Stud and Draw Poker, Texas Hold'em and Omaha"
arch=('x86_64')
url="https://github.com/Dealer-s-Choice/dealers-choice"
license=('MIT')
depends=(
  'canfigger'
  'glibc'
  'hicolor-icon-theme'
  'libsodium'
  'pcg-c'
  'protobuf-c'
  'sdl2'
  'sdl2_image'
  'sdl2_ttf'
)
makedepends=(
  'meson'
  'ninja'
)

source=("https://github.com/Dealer-s-Choice/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c7589d3aa2e201919c26e1f8d21daaee626f55c8beb8b8b36a6aed4f6d1b01b8')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

check() {
  # Deterministic suites + fast unit tests only. The networked game_logic
  # tests and the tcpme loopback tests are skipped on purpose: they are
  # timing-sensitive and flaky inside build sandboxes.
  meson test -C build --no-rebuild --print-errorlogs --suite deckhandler --suite pokeval
  meson test -C build --no-rebuild --print-errorlogs \
    test_serialization test_get_next_player test_debug_print_cards \
    test_layout_cards test_no_peek test_rate_limit test_sodium_compat
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
