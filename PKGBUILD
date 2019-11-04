# Maintainer: David Runge <dave@sleepmap.de>

_name=FoxDot
pkgname=foxdot
pkgver=0.8.3
pkgrel=2
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
sha512sums=('4d1bde56f6cefc9360874a6462ebb12869a19168ffe22f4bd3fc18558ea38a90bf267852f1dafd05a00503395d37413d6df3bbb117618880a0d34daf0adcaac1')

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
