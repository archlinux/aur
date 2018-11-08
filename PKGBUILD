# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=python-moto
_pkgname=moto
pkgver=1.3.7
pkgrel=1
pkgdesc="Moto is a library to mock out the boto library."
arch=('any')
url="https://github.com/spulec/moto"
license=('Apache')
depends=('python-aws-xray-sdk' 'python-boto' 'python-boto3'
         'python-cryptography' 'python-dateutil' 'python-docker' 'python-jinja'
         'python-jsondiff' 'python-jose' 'python-mock' 'python-pyaml'
         'python-pytz' 'python-requests' 'python-responses' 'python-xmltodict'
         'python-werkzeug')
checkdepends=('python-flask' 'python-freezegun' 'python-nose' 'python-sure' 'tk')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/spulec/moto/archive/$pkgver.tar.gz"
        remove-dep-upper-bounds.patch)
sha256sums=('5431738fef3bc3b589e37123df496b63d3c1348a49f3632d1c05da566b839cbe'
            'f7c965571483b5b77419b0448ec98675bf4ec2b657c95dc7320d1eb1f2b81fb9')

prepare() {
  cd $_pkgname-$pkgver

  patch -Np1 -i ../remove-dep-upper-bounds.patch
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check(){
  cd $_pkgname-$pkgver

  # https://github.com/spulec/moto/issues/1924
  export AWS_SECRET_ACCESS_KEY=foobar_secret
  export AWS_ACCESS_KEY_ID=foobar_key

  TZ=UTC nosetests -sv ./tests/ --exclude='test_iot.*' --exclude='test_lambda.*'
}

package(){
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:ft=sh
