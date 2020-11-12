# Maintainer: David Runge <dvzrv@archlinux.org>

_name=jinja2-time
pkgname=python-jinja-time
pkgver=0.2.0
pkgrel=5
pkgdesc="Jinja2 Extension for Dates and Times"
arch=('any')
url="https://github.com/hackebrot/jinja2-time"
license=('MIT')
depends=('python-arrow' 'python-jinja')
makedepends=('python-setuptools')
checkdepends=('python-freezegun' 'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${pkgname}-0.2.0-arrow_shift.patch")
sha512sums=('8ac4686312cde689f7a431001833d5d477030c4f5e9470d949bd07a40fcb9521f6ddcde37a72468093121ff9451e352a0bb43d20a796d7a204cf94e8a7545f2c'
            '0286a608702bb445cf29da7900ec04f5b1f64d1e9658b84f9a90018adf5fce5cc959832abff73fa017afcaf0a0f6be85060e52a79038bf770b8b37d8c96a5e7d')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # fixing the way python-arrow is used:
  # https://github.com/hackebrot/jinja2-time/issues/15
  patch -Np1 -i "../${pkgname}-0.2.0-arrow_shift.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
#  python setup.py test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {CONTRIBUTING,CONTRIBUTORS,HISTORY,README}.rst \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
