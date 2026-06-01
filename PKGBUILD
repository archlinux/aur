# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=thonny
pkgver=5.0.0
pkgrel=1
pkgdesc="Python IDE for beginners"
arch=('any')
url="https://thonny.org"
license=('MIT')
depends=('basedpyright' 'esptool' 'hicolor-icon-theme' 'mypy' \
         'python-asttokens' 'python-docutils' 'python-minny' \
         'python-pip' 'python-pylint' 'python-pillow' \
         'python-pyserial' 'python-send2trash' \
         'python-setuptools' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-birdseye: Debug support with Birdseye'
            'python-pgzero: Run code made with Pygame Zero')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('7ab21e5605397f2e7e8a0e34559a1c1c55bba377890c5be90fe6da37cc08bff8403d54152b92a7bf43ce1ff79f4598db6fc890cb08dc491750bae8713fbec5e3')

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
