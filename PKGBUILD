# Maintainer: David Runge <dave@sleepmap.de>

_name=FoxDot
pkgname=foxdot
pkgver=0.7.40
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Qirky/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6bfcd1e7953f1b226b99bda8c8dd622062876833a2aedaf5dc4e54e958b860037ae42f36ed1301452711b42605860b0fecb457387a35bc493203d4171c9a1aad')

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
