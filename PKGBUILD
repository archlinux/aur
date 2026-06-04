# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-django-simple-history
_srcname=django-simple-history
pkgver=3.11.0
pkgrel=1
pkgdesc='Store Django model history (track changes, view/revert to prior states)'
arch=('any')
url='https://github.com/jazzband/django-simple-history'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-django'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-hatch-vcs'
)
optdepends=(
    'python-asgiref: async-safe historical-user tracking middleware'
)
# GitHub release tarball (the PyPI sdist omits the tests + runtests.py)
source=("$_srcname-$pkgver.tar.gz::https://github.com/jazzband/django-simple-history/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('142343fc0a83d20b73ffef444009244f450165cdb7134e5303be7bdab9c28373')

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_srcname-$pkgver"

    # simple_history reads its own version via importlib.metadata, which scans
    # sys.path for the .dist-info regardless of where the module imports from. So
    # install the built wheel to a temp prefix and put it on PYTHONPATH: the
    # version lookup succeeds while the in-tree tests still load from the source.
    local _site
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")

    # 1) upstream test suite (Django DiscoverRunner, sqlite3 default)
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python runtests.py

    # 2) smoke test simulating real use: register history on a real model and
    #    confirm the generated historical model tracks who/when/what changed.
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python - <<'PY'
import django
from django.conf import settings
settings.configure(
    INSTALLED_APPS=['django.contrib.contenttypes', 'django.contrib.auth', 'simple_history'],
    DATABASES={'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': ':memory:'}},
    USE_TZ=True)
django.setup()
from django.contrib.auth.models import Group
from simple_history import register
register(Group)
hist = Group.history.model
fields = {f.name for f in hist._meta.get_fields()}
# the historical table records the value, the change type, when, and by whom
assert {'name', 'history_date', 'history_type', 'history_user'} <= fields, fields
assert hist._meta.get_field('history_type').choices, 'history_type must enumerate +/~/-'
print('django-simple-history smoke OK: historical model tracks',
      sorted(f for f in fields if f.startswith('history')))
PY
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
