# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-django-simple-history
_srcname=django-simple-history
pkgver=3.13.0
pkgrel=1
pkgdesc='Store Django model history (track changes, view/revert to prior states)'
arch=('any')
url='https://github.com/django-commons/django-simple-history'
license=('BSD-3-Clause')
depends=(
    'python'
    'python-asgiref'
    'python-django'
)
makedepends=(
    'python-build'
    'python-hatch-fancy-pypi-readme'
    'python-hatch-vcs'
    'python-hatchling'
    'python-installer'
)
# GitHub release tarball (the PyPI sdist omits the tests + runtests.py)
source=("$_srcname-$pkgver.tar.gz::https://github.com/django-commons/django-simple-history/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23eb63348c71bfebd443fb1435c5629b26a80afd3c6f88f09adfb1c66f250769')

build() {
    cd "$_srcname-$pkgver"

    # GitHub's generated tarball has no VCS metadata for hatch-vcs.
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
        python -m build --wheel --no-isolation
}

check() {
    cd "$_srcname-$pkgver"

    # The wheel deliberately excludes the tests. Install it to a temporary root,
    # overlay only the upstream test modules, then run from outside the source
    # tree so the suite exercises the wheel's packaged library.
    local _site _checkroot="$srcdir/_check"
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")
    cp -a simple_history/tests simple_history/registry_tests \
        "$_checkroot$_site/simple_history/"
    cp runtests.py "$_checkroot/"

    # 1) upstream test suite (Django DiscoverRunner, SQLite default). The other
    # upstream variants require live PostgreSQL, MySQL, or MariaDB services.
    (
        cd "$_checkroot"
        PYTHONPATH="$_checkroot$_site" python runtests.py
    )

    # 2) installed-wheel smoke test: create and update a real Django model, then
    # confirm both states and their change types were persisted in its history.
    (
        cd "$_checkroot"
        SIMPLE_HISTORY_EXPECTED_VERSION="$pkgver" \
        PYTHONPATH="$_checkroot$_site" python - <<'PY'
import os
import django
from django.conf import settings
settings.configure(
    INSTALLED_APPS=[
        'django.contrib.contenttypes',
        'simple_history',
    ],
    DATABASES={'default': {'ENGINE': 'django.db.backends.sqlite3', 'NAME': ':memory:'}},
    USE_TZ=True)
django.setup()
from django.core.management import call_command
from django.db import connection, models
import simple_history
from simple_history.models import HistoricalRecords

assert simple_history.__version__ == os.environ['SIMPLE_HISTORY_EXPECTED_VERSION']
call_command('migrate', verbosity=0, interactive=False)

class Article(models.Model):
    title = models.CharField(max_length=100)
    history = HistoricalRecords(
        history_user_id_field=models.IntegerField(null=True),
    )

    class Meta:
        app_label = 'simple_history'

HistoricalArticle = Article.history.model
with connection.schema_editor() as schema:
    schema.create_model(Article)
    schema.create_model(HistoricalArticle)

article = Article.objects.create(title='First draft')
article.title = 'Published'
article.save()

records = list(article.history.order_by('history_date'))
assert [record.history_type for record in records] == ['+', '~'], records
assert [record.title for record in records] == ['First draft', 'Published'], records
assert records[0].instance.title == 'First draft'
print('django-simple-history smoke OK:', simple_history.__version__,
      [(record.history_type, record.title) for record in records])
PY
    )
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
