# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-django-ratelimit
pkgver=4.1.0
pkgrel=1
pkgdesc='Cache-based rate-limiting for Django views'
arch=('any')
url='https://github.com/jsocol/django-ratelimit'
license=('Apache-2.0')
depends=(
    'python'
    'python-django'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-pytest-django'
    'python-pymemcache'
    'python-django-redis'
)
# GitHub release tarball (the PyPI sdist omits the tests + test_settings.py)
source=("django-ratelimit-$pkgver.tar.gz::https://github.com/jsocol/django-ratelimit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9563bab593ab2c48df1bf20aae3f9bf5bd4a02e5b0ca34a9dc53e66276b6018')

build() {
    cd "django-ratelimit-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "django-ratelimit-$pkgver"

    # 1) upstream test suite (ships its own test_settings.py). Pass -c /dev/null so
    #    pytest does not try to parse the repo's tox.ini (which has a duplicate-key
    #    that configparser rejects); pytest-django activates via the env var below.
    DJANGO_SETTINGS_MODULE=test_settings PYTHONPATH="$PWD:$PYTHONPATH" \
        python -m pytest django_ratelimit/tests.py -c /dev/null -p django -p no:cacheprovider -v

    # 2) smoke test simulating real use: decorate a view and confirm a 1/minute
    #    limit lets the first request through and blocks the next from the same IP.
    PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import django
from django.conf import settings
settings.configure(
    INSTALLED_APPS=['django.contrib.contenttypes', 'django.contrib.auth'],
    CACHES={'default': {'BACKEND': 'django.core.cache.backends.locmem.LocMemCache'}},
    DATABASES={'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': ':memory:'}},
    ROOT_URLCONF=None, USE_TZ=True)
django.setup()
from django.http import HttpResponse
from django.test import RequestFactory
from django_ratelimit.decorators import ratelimit
from django_ratelimit.exceptions import Ratelimited

@ratelimit(key='ip', rate='1/m', method='GET', block=True)
def my_view(request):
    return HttpResponse('ok')

rf = RequestFactory()
resp = my_view(rf.get('/'))
assert resp.status_code == 200 and resp.content == b'ok', resp
blocked = False
try:
    my_view(rf.get('/'))           # same IP, over the 1/minute budget
except Ratelimited:
    blocked = True
assert blocked, 'second request from same IP should be rate-limited'
print('django-ratelimit smoke OK: 1st request allowed, 2nd blocked via @ratelimit decorator')
PY
}

package() {
    cd "django-ratelimit-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
