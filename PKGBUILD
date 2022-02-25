# Maintainer: Simon Hayessen <simon at lnqs dot io>

pkgname=knoepfe
pkgver=0.1.0
pkgrel=1
pkgdesc="Connect and control Elgato Stream Decks"
arch=(any)
url='https://github.com/lnqs/knoepfe'
license=('GPL3')
depends=('python' 'python-schema' 'python-appdirs' 'python-docopt'
         'python-elgato-streamdeck' 'python-pillow'
         'python-pulsectl-asyncio>=0.2' 'python-obs-websocket')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lnqs/knoepfe/archive/refs/tags/v${pkgver}.tar.gz"
        "95-streamdeck.rules")
sha256sums=('34a1a68d4704f4bfc7b6e50186d74184916ed89e60503cf1778661d638eb3895'
            '09a8e6067a8f66a742ba065724be287fa1eb96761d1d447e5a197d869a86f803')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  GIT_CEILING_DIRECTORIES="${PWD}/.." python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${srcdir}/95-streamdeck.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
}

