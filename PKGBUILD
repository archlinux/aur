# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python38-aiobotocore
_pkgname=aiobotocore
# https://github.com/aio-libs/aiobotocore/releases
pkgver=2.4.0
pkgrel=1
pkgdesc='asyncio support for botocore library using aiohttp'
arch=(any)
url='https://github.com/aio-libs/aiobotocore'
license=(Apache)
depends=(python38 python38-aiohttp python38-botocore python38-wrapt python38-aioitertools)
makedepends=(python38-setuptools)
checkdepends=(python38-moto python38-pytest python38-pytest-asyncio
              # moto optdepends
              python38-docker python38-openapi-spec-validator python38-yaml python38-flask python38-flask-cors)
source=("https://github.com/aio-libs/aiobotocore/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('13cd39bdbec4583384c3c68ac36959e82acf81a131b3cc27d20df98ecd8f1519')

prepare() {
  cd $_pkgname-$pkgver

  # Disable dependency pinning
  # Upstream tracking issue: https://github.com/aio-libs/aiobotocore/issues/670
  sed --in-place=.orig -r "s#'(botocore.*),<.*',#'\1',#" setup.py
  diff -u setup.py{.orig,} || true

  # moto 3.1 rename
  sed -i "s#'dynamodb2'#'dynamodb'#" tests/mock_server.py

  # For pytest-asyncio >= 0.19
  # https://github.com/aio-libs/aiobotocore/issues/965
  echo asyncio_mode = auto >> pytest.ini
}

build() {
  cd $_pkgname-$pkgver
  python3.8 setup.py build
}

check() {
  cd $_pkgname-$pkgver

  export PYTHONPATH="$PWD"
  # Needed since 2.3.0 https://github.com/aio-libs/aiobotocore/issues/948
  export AWS_SECRET_ACCESS_KEY=test
  export AWS_ACCESS_KEY_ID=test
  # test_lambda uses moto.awslambda, which requires a running Docker service
  # See: https://github.com/spulec/moto/issues/3276
  # test_version checks lower and upper bounds for dependencies in setup.py,
  # and they are patched away in prepare()
  # test_load_sso_credentials_with_cache_expired: failed with newer botocore
  pytest -m moto tests \
      --ignore=tests/test_patches.py \
      --ignore=tests/test_lambda.py \
      --ignore=tests/test_version.py \
      -k 'not test_load_sso_credentials_with_cache_expired'
}

package() {
  cd $_pkgname-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
