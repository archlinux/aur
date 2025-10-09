# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcin Kolenda <marcinkolenda419@gmail.com>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Marco Elver <marco.elver AT gmail.com>
# Contributor: apkawa <apkawa@gmail.com>

pkgname=python-celery
pkgver=5.4.0
pkgrel=2
pkgdesc='Distributed Asynchronous Task Queue'
arch=('any')
url='http://celeryproject.org/'
license=('BSD-3-Clause')
depends=('python-billiard' 'python-click-didyoumean' 'python-click-plugins' 'python-click-repl'
         'python-kombu' 'python-pytz' 'python-vine')
optdepends=('python-cryptography: for celery.security'
            'python-pymongo: for celery.backends.mongodb'
            'python-msgpack: for using the msgpack serializer'
            'python-pyro: for using Pyro4 message transport'
            'python-redis: for celery.backends.redis'
            'python-sqlalchemy: for celery.backends.database'
            'python-boto3: for SQS transport'
            'python-yaml: for using the yaml serializer'
            'python-pyzmq: for using ZeroMQ transport')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
# checkdepends on systemd for sysusers hook to create 'bin' user, because celery's test suite requires gid 1 to exist
checkdepends=('python-pytest-celery' 'python-pytest-subtests' 'python-pytest-timeout'
              'python-cryptography' 'python-gevent' 'python-pymongo' 'python-msgpack' 'python-pyro'
              'python-redis' 'python-sqlalchemy' 'python-boto3' 'python-yaml' 'python-pyzmq'
              'python-eventlet' 'python-moto' 'python-pytest-click' 'systemd')
source=("https://pypi.io/packages/source/c/celery/celery-$pkgver.tar.gz"
        celery@.service celery.tmpfiles.d)
options=('!emptydirs')
sha512sums=('e59b62878f7da0af79be13df816e899c948f71f1063643baaabc1244dd44fd3114a5b3d724c010307ca8091c6b4343a4322213bc6154b843b79893b8f772476c'
            '3c6c9dbdacca2de12d49c03526b34797fd867c14d04115af0d1fda64d2848a5d3f64ceb6d284be319a81d932dc86e69c157b6f5f859f2fa213fc2f43a6052c65'
            '67279b75c3b44d065811c9c90aee006296164000912d5bb97c74956b26ee4ad4f0847e846052a896d379848b869c849300367e676d3f689cf29e3a0c7ae5310b')

build() {
  cd celery-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd celery-$pkgver
  # t/unit/apps/test_multi.py & t/unit/bin/test_multi.py: needs write permission to /var/run/celery
  # t/unit/backends/test_mongodb.py and t/unit/concurrency/test_eventlet.py: https://github.com/celery/celery/discussions/8422
  # t/unit/backends/test_gcs.py: needs https://aur.archlinux.org/packages/python-google-cloud-storage, --ignore instead of --deselect to avoid ModuleNotFoundError
  python -m pytest \
    --deselect t/unit/apps/test_multi.py \
    --deselect t/unit/bin/test_multi.py \
    --ignore t/unit/backends/test_gcs.py \
    --deselect t/unit/backends/test_mongodb.py \
    --deselect t/unit/concurrency/test_eventlet.py
}

package() {
  cd celery-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "$srcdir"/celery@.service "$pkgdir"/usr/lib/systemd/system/celery@.service
  install -Dm644 "$srcdir"/celery.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/celery.conf

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/celery-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
