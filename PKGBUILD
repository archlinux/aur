# Maintainer: Sean Snell <ssnell@lakecs.net>
# Previous Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
gitname=streamdeck-linux-gui
pkgver=3.0.1
pkgrel=2
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://streamdeck-linux-gui.github.io/streamdeck-linux-gui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside6' 'python-pynput' 'python-elgato-streamdeck' 'python-xlib' 'python-filetype' 'python-cairosvg' 'python-xcffib')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
conflicts=('streamdeck-ui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/streamdeck-linux-gui/${gitname}/archive/refs/tags/v${pkgver}.tar.gz"
        "60-streamdeck.rules"
        "streamdeck-ui.desktop"
        "elgato.png"
        "streamdeck.service")

# Upstream tar.gz
# 60-streamdeck.rules
# streamdeck-ui.desktop
# elgato.png
# streamdeck.service

sha512sums=('c3cf76fc842750b76aaa9ab89b38c08bdf9250ff6cb7b0a1faadad1845484fd3fe6167b7282b7208f2ca7025f7783bdfd4144803ca60560890d69a796fd3819f'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f'
            'd043978e9f80a88cef84a5dbc74c17c5e77670f88863a501a30ec93d41ed58f1cf19b293dabc1b3260f950527a0459416a18ef108422da0b4c8971a7fad4114c'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2'
            '56edf11da7a42574e5545362838ae202e636f92e175dbf7e8467840086065995bca25904d539002d78a276330f955c91d5230335c46ec02d30176dac4474cb19')

build() {
  cd "${gitname}-${pkgver}"
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${gitname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "${srcdir}/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "${srcdir}/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "${srcdir}/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
  install -Dm 644 "${srcdir}/streamdeck.service" "${pkgdir}/etc/systemd/user/streamdeck.service"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
