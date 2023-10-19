# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=4.1.3
pkgrel=1
pkgdesc="Python IDE for beginners"
arch=('any')
url="https://thonny.org"
license=('MIT')
depends=('esptool' 'hicolor-icon-theme' 'mypy' 'python-asttokens' 'python-docutils' \
          'python-jedi' 'python-pip' 'python-pylint' 'python-pillow' 'python-ptyprocess' \
          'python-send2trash' 'python-setuptools' 'python-wheel' 'tk')
makedepends=('python-build' 'python-installer')
optdepends=('python-birdseye: Debug support with Birdseye'
            'python-pgzero: Run programs made with Pygame Zero')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('8490c692f0030d3116ed83e5126e87c41a7287a1702d42f1e22af04a956f53188a8c81eecc04c30636f69d76195a6eee178c6b7d14bbb58f7654c6de345b4072')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  _xdg_desktop_name=org.${pkgname}.${pkgname^}

  install -Dm 644 "packaging/linux/${_xdg_desktop_name}.desktop" \
                  "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  sed -i "s/Icon=${pkgname}/Icon=${_xdg_desktop_name}/" \
         "${pkgdir}/usr/share/applications/${_xdg_desktop_name}.desktop"

  install -Dm 644 "packaging/linux/${_xdg_desktop_name}.appdata.xml" \
                  "${pkgdir}/usr/share/metainfo/${_xdg_desktop_name}.appdata.xml"

  for size in 16 22 32 48 64 128 256; do
    install -Dm 644 "packaging/icons/${pkgname}-${size}x${size}.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_xdg_desktop_name}.png"
  done

  install -Dm 644 "LICENSE.txt" \
                  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
