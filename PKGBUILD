# Maintainer: David Runge <dvzrv@archlinux.org>

_name=FoxDot
pkgname=foxdot
pkgver=0.8.5
pkgrel=1
pkgdesc="Live Coding with Python"
arch=('any')
url="https://foxdot.org"
license=('CCPL')
groups=('pro-audio')
depends=('python' 'supercollider' 'tk')
makedepends=('gendesk' 'python-setuptools')
checkdepends=('python-pytest')
optdepends=('sc3-plugins: use additional UGens')
# pypi sdist doesn't contain tests: https://github.com/Qirky/FoxDot/issues/188
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_name}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Qirky/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('2191b66034e37042d3f3d8a4a760a724693344d7d860033b8b5855f27d142a9c4586d0da46cc01cb2fa41d232f0976ff525451bdbe574374d1194d71367c66fc')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  gendesk -n \
          --pkgname "${pkgname}" \
          --name "${_name}" \
          --exec "${_name}" \
          --genericname "Live Coding Editor" \
          --categories "AudioVideo;Audio"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  py.test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --prefix=/usr \
                          --skip-build \
                          --optimize=1 \
                          --root="${pkgdir}" \
                          --verbose
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {README.md,changelog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
