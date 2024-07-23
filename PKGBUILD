# Maintainer: Sean Snell <ssnell@lakecs.net>
# Previous Maintainer: GI Jack <GI_Jack@hackermail.com>
# Original: hexptr <hexptr@protonmail.com>

pkgname=streamdeck-ui
gitname=streamdeck-linux-gui
pkgver=4.1.2
pkgrel=2
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://streamdeck-linux-gui.github.io/streamdeck-linux-gui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside6' 'python-evdev' 'python-elgato-streamdeck' 'python-xlib' 'python-filetype' 'python-cairosvg' 'python-xcffib' 'python-importlib-metadata')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/streamdeck-linux-gui/${gitname}/archive/refs/tags/v${pkgver}.tar.gz"
        "streamdeck-ui.desktop"
        "elgato.png"
        "streamdeck.service"
        "image_filter.patch")

# Upstream tar.gz
# streamdeck-ui.desktop
# elgato.png
# streamdeck.service
# image_filter.patch

sha512sums=('8faa9e29d85582eb5e84ed8b627abbfb9375f9ba24c225f0c6619dadeb532ae035f09ba3ca13d05d0788e730df85850ca038b22169481a751cff3ca10d345ba0'
            '310f5c511b8475ef10629d3e00d03c1e8d7281a60b8d7d4d8e59b748ec0d72ea45003df0144435c9e8d28260c7d83e5be629441f833cc5318c8b79d98221e674'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2'
            '56edf11da7a42574e5545362838ae202e636f92e175dbf7e8467840086065995bca25904d539002d78a276330f955c91d5230335c46ec02d30176dac4474cb19'
            '7ca851baa7e4b280a4588a048acedb29e3aa5d676d3053f0d37cded554b9ce86696f4d7f266ed18b23957fc9bc41ed8a8e4553e408c4c2c1973113f43a4d535e')

build() {
  cd "${gitname}-${pkgver}"
  patch -p0 < ../image_filter.patch
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${gitname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 udev/60-streamdeck.rules "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "${srcdir}/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "${srcdir}/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
  install -Dm 644 "${srcdir}/streamdeck.service" "${pkgdir}/etc/systemd/user/streamdeck.service"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
