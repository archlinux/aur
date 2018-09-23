# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=python-moto
_pkgname=moto
# Wrong tag? https://github.com/spulec/moto/pull/1733#issuecomment-423787842
_commit=57f9691a52245ffd9d7c0317e90953d054070c65
pkgver=1.3.6
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python-aws-xray-sdk' 'python-boto' 'python-boto3-legacy'
         'python-cryptography' 'python-dateutil' 'python-docker' 'python-jinja'
         'python-jsondiff' 'python-jose' 'python-mock' 'python-pyaml'
         'python-pytz' 'python-requests' 'python-responses' 'python-xmltodict'
         'python-werkzeug')
checkdepends=('python-flask' 'python-freezegun' 'python-nose' 'python-sure' 'tk')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/spulec/moto/archive/$_commit.tar.gz"
        remove-dep-upper-bounds.patch)
sha256sums=('d8fc2c169faf9cea3973a00b51e87a512e81002e2c12d06cef9f02db33c12471'
            'f7c965571483b5b77419b0448ec98675bf4ec2b657c95dc7320d1eb1f2b81fb9')

prepare() {
  cd $_pkgname-$_commit

  patch -Np1 -i ../remove-dep-upper-bounds.patch
}

build() {
  cd $_pkgname-$_commit

  python setup.py build
}

check(){
  cd $_pkgname-$_commit

  TZ=UTC nosetests -sv ./tests/ --exclude='test_iot.*' --exclude='test_lambda.*'
}

package(){
  cd $_pkgname-$_commit

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:ft=sh
