# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FoxDot
pkgname=foxdot
pkgver=0.8.12
pkgrel=2
pkgdesc="Live Coding with Python"
arch=('any')
url="https://foxdot.org"
license=('CCPL')
groups=('pro-audio')
depends=('python' 'supercollider' 'tk')
makedepends=('gendesk' 'imagemagick' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=('sc3-plugins: use additional UGens')
# pypi sdist doesn't contain tests: https://github.com/Qirky/FoxDot/issues/188
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_name}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Qirky/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('d0b59bb117871ba5a785c2ab3ce83048a6649f02e8d07f1248432868ec49262bcd44fdf98dc5cb2694e1f8a9b38d76c2ac111c21708ef43fda7ce0d4d8471d64')
b2sums=('38bd7781daabb4abe3385444fcb254d36a24c532de789fc86063f35ddaacba8092e65bbf4e8b1eb62aff02f2705b35284fcebdfdacca5b0ad5260ffff7293989')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  gendesk -n \
          --pkgname "${pkgname}" \
          --name "${_name}" \
          --exec "${_name}" \
          --genericname "Live Coding Editor" \
          --categories "AudioVideo;Audio" \
          --comment "Live Coding with Python and SuperCollider"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
  convert -verbose FoxDot/lib/Workspace/img/icon.gif +set date:create +set date:modify "${pkgname}.png"
}

check() {
  cd "$pkgname-$pkgver"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr \
                          --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}" \
                          --verbose
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications"
  install -vDm 644 "${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {README.md,changelog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
