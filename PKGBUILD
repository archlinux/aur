# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python38-aws-xray-sdk
_pkgname=aws-xray-sdk-python
pkgver=2.11.0
_commit=b37ae1100350780a3862297fe9d2c364bb39510f
pkgrel=2
pkgdesc='AWS X-Ray SDK for Python'
arch=(any)
url='https://github.com/aws/aws-xray-sdk-python'
license=(Apache)
depends=(python3.8 python-botocore python-wrapt)
# See extensions in https://github.com/aws/aws-xray-sdk-python/tree/master/aws_xray_sdk/ext
optdepends=(python38-aiobotocore python38-aiohttp python38-bottle python38-django
            python38-flask python38-flask-sqlalchemy python38-httpx python38-mysql-connector
            python38-pg8000 python38-psycopg2 python38-pymongo python38-pymysql
            python38-pynamodb python38-requests python38-sqlalchemy)
makedepends=(git python38-setuptools ${optdepends[@]})
checkdepends=(python38-pytest python38-pytest-asyncio python38-testing.postgresql
              python38-webtest python38-django-fake-model python38-pytest-benchmark)
source=("git+https://github.com/aws/aws-xray-sdk-python.git#commit=$_commit")
sha256sums=('SKIP')

_backports=(
  # The following three are from https://github.com/aws/aws-xray-sdk-python/pull/364 (ongoing)
  # Use fixture event_loop instead of the deprecated fixture loop
  72dcbf97a27a44e87123630fe78ff828eafa4d4c
  # Do not pass event loop to asyncio.sleep() and wait() on Python 3.8+
  dde50155e7a912aef80199a1d0c2e9900002af5f
  # Do not pass coroutine objects directly to asyncio.wait()
  b3d605d145dda82b9bcaa2fdac7eb593770886b2
)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # this loop is stolen from core/systemd :)
  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done

  cat > pytest.ini <<EOF
[pytest]
asyncio_mode = auto
EOF
}

build() {
  cd $_pkgname
  python3.8 setup.py build
}

check() {
  cd $_pkgname

  # See setenv= in upstream tox.ini
  export DJANGO_SETTINGS_MODULE=tests.ext.django.app.settings
  export AWS_SECRET_ACCESS_KEY=fake_key
  export AWS_ACCESS_KEY_ID=fake_id

  # * the test suite for aiohttp uses test_client fixture, which is
  #   dropped in the latest pytest-aiohttp
  # * the test suite for pymysql uses testing.mysqld, which is not
  #   compatible with MariaDB [1]
  # * tests fail with pg8000 > 1.20.0 and upstream explicitly
  #   states no support [2]
  # [1] https://github.com/tk0miya/testing.mysqld/issues/3
  # [2] https://github.com/aws/aws-xray-sdk-python/pull/324
  pytest -v tests --ignore tests/ext/aiohttp \
                  --ignore tests/ext/pg8000 \
                  --ignore tests/ext/pymysql
}

package() {
  cd $_pkgname
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
