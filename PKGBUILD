# Maintainer: 4s3ti <4s3ti@4s3ti.net>

pkgname=streamdeck-ui-develop
gitname=streamdeck-linux-gui
pkgver="3.1.0.develop.4"
_pkgver=3.1.0-develop.4
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck (development pre-releases)"
arch=('any')
url="https://streamdeck-linux-gui.github.io/streamdeck-linux-gui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside6' 'python-pynput' 'python-elgato-streamdeck' 'python-xlib' 'python-filetype' 'python-cairosvg' 'python-xcffib')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('streamdeck-ui')
conflicts=('streamdeck-ui')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/streamdeck-linux-gui/${gitname}/archive/refs/tags/v${_pkgver}.tar.gz"
        "60-streamdeck.rules"
        "streamdeck-ui.desktop"
        "elgato.png"
        "streamdeck.service")

# Upstream tar.gz
# 60-streamdeck.rules
# streamdeck-ui.desktop
# elgato.png
# streamdeck.service

sha512sums=('d99ee43d08be54742858e7793202912b5f223d517bea48f306c3594690c32a0938a2f56006e0bbd28c6d78826a014e2b644666d805d44d1c156befc368f85e66'
            '690aa38c549b09c7c49d99e47dea74fc47d778881ce1947d9da37f6d1d94f8745c4724c23a702167e6d714ea9b4fd13a4414eb6945b17728eef9b5319b9a6c0f'
            '310f5c511b8475ef10629d3e00d03c1e8d7281a60b8d7d4d8e59b748ec0d72ea45003df0144435c9e8d28260c7d83e5be629441f833cc5318c8b79d98221e674'
            '1145e8cdebdf950090d0833e40984cd402345d559c9faf8aab89f5ec4db5d5de685b68418faf39288f08e9a642fcf1cc53a719b1b11c8ebfac6dd8b42d4898d2'
            '56edf11da7a42574e5545362838ae202e636f92e175dbf7e8467840086065995bca25904d539002d78a276330f955c91d5230335c46ec02d30176dac4474cb19')


build() {
  cd "${gitname}-${_pkgver}" || exit
  DISABLE_CONAN=ON python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${gitname}-${_pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 "${srcdir}/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
  install -Dm 644 "${srcdir}/streamdeck-ui.desktop" "${pkgdir}/usr/share/applications/streamdeck-ui.desktop"
  install -Dm 644 "${srcdir}/elgato.png" "${pkgdir}/usr/share/pixmaps/elgato.png"
  install -Dm 644 "${srcdir}/streamdeck.service" "${pkgdir}/etc/systemd/user/streamdeck.service"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
