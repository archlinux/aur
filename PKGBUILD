# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FoxDot
pkgname=foxdot
pkgver=0.8.11
pkgrel=1
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
sha512sums=('4f1bea5839ac14509dccad395054325f6fce0354ff012d9948800f4cddd08f5d4da29cfc009de42c785d7969fbda215530e9fba3c41d80d68c042d6daf6baa4d')

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
  convert -verbose FoxDot/lib/Workspace/img/icon.gif "${pkgname}.png"
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
