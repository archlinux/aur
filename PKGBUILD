# Maintainer: David Runge <dave@sleepmap.de>

_name=FoxDot
pkgname=foxdot
pkgver=0.7.39
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
sha512sums=('a35d7dccddc5b8e9496ceb46e719c14abd0eea3ba7a2ca8dee8029fb8aecb76a6205f7f69344132a29919d348790ab2ca5c1bc9da574c363357db979798a6b4d')

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
