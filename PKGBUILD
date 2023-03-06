# Current Maintainer: Sean Snell <ssnell@lakecs.net>
# Previous Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
pkgver=2.0.14
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside6' 'python-pynput' 'python-elgato-streamdeck>=0.9.1' 'python-xlib' 'python-filetype' 'python-cairosvg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
conflicts=('streamdeck-ui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/timothycrosley/streamdeck-ui/archive/refs/tags/v${pkgver}.tar.gz"
        "60-streamdeck.rules"
        "streamdeck-ui.desktop"
        "elgato.png"
        "streamdeck.service")

# Upstream tar.gz
# 60-streamdeck.rules
# streamdeck-ui.desktop
# elgato.png
# streamdeck.service

sha512sums=('493ce2ccd9b5b5876183023c23741e0f09d703ccb8693805779548cd4dcd42a583431885e68e420879c2e181ef084279a83b36fe04b7dad875570b7e5445bd6f'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f'
            '963960c17336b4143ddd3560248dcd0484978b821c860b8d8f30a7ee4e623289aed96c375fe7a34177156d7b6c6296008307a4ca24ffe3972b1e787c14891a6f'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2'
            'b8ceae9cf25fe0e9934fcbe4403bb42f2785c11317b9f91722c484e036bc2a8d3b2d5448b2189dd2e876bb74b17d15e8b0b467ef143e44e600c5c578cfaa0679')

build() {
  cd "${pkgname}-${pkgver}"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "$srcdir/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "$srcdir/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "$srcdir/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
  install -Dm 644 "$srcdir/streamdeck.service" "${pkgdir}/etc/systemd/system/streamdeck.service"
}
