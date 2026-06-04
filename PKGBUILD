# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-django-model-utils
_srcname=django-model-utils
pkgver=5.0.0
pkgrel=1
pkgdesc='Django model mixins and utilities (TimeStampedModel, FieldTracker, Choices, StatusField)'
arch=('any')
url='https://github.com/jazzband/django-model-utils'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-django'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'python-setuptools-scm'
)
checkdepends=(
    'python-pytest'
    'python-pytest-django'
    'python-time-machine'
)
# GitHub release tarball (the PyPI sdist omits the tests/ dir)
source=("$_srcname-$pkgver.tar.gz::https://github.com/jazzband/django-model-utils/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2d9225e10904aef52436685b878da40cc93622c41139e76ac954b5d17e2a1d2c')

build() {
    cd "$_srcname-$pkgver"
    # built from the release tarball (no .git), so feed setuptools-scm the version
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_srcname-$pkgver"

    # 1) upstream test suite (pytest-django picks up tests.settings from setup.cfg).
    #    SQLITE=1 makes tests/settings.py use the in-memory sqlite backend instead
    #    of its default PostgreSQL (which would need a running server + psycopg).
    #    test_join_manager.py is deselected: JoinManager emits multi-statement SQL
    #    that only PostgreSQL accepts (sqlite raises "one statement at a time").
    SQLITE=1 PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest -v \
        --ignore=tests/test_managers/test_join_manager.py

    # 2) smoke test simulating real model use: define a realistic TimeStampedModel
    #    with a Choices-driven StatusField and a FieldTracker, then verify the
    #    mixins wired the model the way a user relies on (the upstream suite covers
    #    the DB-level behaviour; this proves the installed mixins inject correctly).
    PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import django
from django.conf import settings
settings.configure(INSTALLED_APPS=['django.contrib.contenttypes', 'django.contrib.auth'],
                   DATABASES={'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': ':memory:'}},
                   USE_TZ=True)
django.setup()
from django.db import models
from model_utils.models import TimeStampedModel
from model_utils.fields import StatusField
from model_utils import Choices
from model_utils.tracker import FieldTracker

class Task(TimeStampedModel):
    STATUS = Choices('open', 'in_progress', 'done')
    title = models.CharField(max_length=50)
    status = StatusField()
    tracker = FieldTracker()
    class Meta:
        app_label = 'mu_smoke'

fields = {f.name for f in Task._meta.get_fields()}
assert {'created', 'modified', 'title', 'status'} <= fields, fields      # TimeStampedModel + StatusField
assert Task.STATUS.open == 'open' and [c[0] for c in Task.STATUS] == ['open', 'in_progress', 'done']
assert Task._meta.get_field('status').default == 'open'                   # StatusField defaults to first choice
inst = Task(title='ship it', status=Task.STATUS.in_progress)
assert inst.status == 'in_progress' and hasattr(Task, 'tracker')          # FieldTracker descriptor installed
print('django-model-utils smoke OK: TimeStamped fields + Choices + StatusField default + FieldTracker wired')
PY
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
