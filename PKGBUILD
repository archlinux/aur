# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-frictionless
pkgver=5.21.0
pkgrel=1
pkgdesc='Describe, extract, validate and transform tabular data'
arch=(any)
url=https://github.com/frictionlessdata/frictionless-py
license=(MIT)
depends=('python' 'python-petl' 'python-marko' 'python-attrs' 'python-jinja' 'python-yaml' 'python-isodate' 'python-rfc3986' 'python-chardet' 'python-pydantic' 'python-requests' 'python-humanize' 'python-tabulate' 'python-jsonschema' 'python-referencing' 'python-simpleeval' 'python-typer' 'python-validators' 'python-slugify' 'python-dateutil' 'python-typing_extensions' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-lazy-fixtures' 'python-pytest-mock' 'python-pytest-vcr' 'python-sqlalchemy' 'python-requests-mock' 'python-ijson' 'python-jsonlines' 'python-yattag' 'python-tatsu')
_commit=c08fa29cb0708427ae65bb689ded8e2691078a82
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        tatsu-config-import.patch)
sha256sums=('be7d9faf038028485b4375564e3b6198b96544ca5fd4abe9378330955155c782'
            'db48b121d8ffc56954286792cfb2f84e6ceaee3130e4041343cf37ca8f895325')
optdepends=('python-tatsu: WKT geometry validation' 'python-ijson: streamed JSON resources' 'python-jsonlines: JSON Lines resources' 'python-pandas: data frame resources' 'python-pyarrow: Parquet and pandas resources' 'python-openpyxl: Excel resources' 'python-xlrd: legacy Excel input' 'python-xlwt: legacy Excel output' 'python-sqlalchemy: SQL resources' 'python-boto3: AWS storage' 'python-pygithub: GitHub resources' 'python-pyquery: HTML resources')
prepare() {
  cd "frictionless-py-$_commit"
  # Use TatSu's supported compatibility module for generated parser configuration.
  patch -Np1 -i "$srcdir/tatsu-config-import.patch"
}

build() {
  cd "frictionless-py-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "frictionless-py-$_commit"
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer dist/*.whl
  # Exercise the complete core schema, validation and transformation suites,
  # plus CSV/JSON formats, without requiring external database or cloud services.
  "$srcdir/check-env/bin/python" -I -m pytest --import-mode=importlib -v \
    frictionless/{schema,fields,checks,validator,checklist,metadata,detector,dialect,error,errors,report,table,pipeline,transformer,steps} \
    frictionless/formats/{csv,json} --junitxml="$srcdir/pytest-results.xml"
}

package() {
  cd "frictionless-py-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Keep test fixtures in check(), with coherent installed wheel metadata.
  python - "$pkgdir" <<'PYTHON'
import csv
import pathlib
import shutil
import sys
site = next(pathlib.Path(sys.argv[1]).glob("usr/lib/python*/site-packages"))
for directory in (site / "frictionless").rglob("__spec__"):
    shutil.rmtree(directory)
for path in (site / "frictionless").rglob("conftest.py"):
    path.unlink()
for path in (site / "frictionless").rglob("conftest.*.pyc"):
    path.unlink()
record = next(site.glob("frictionless-*.dist-info/RECORD"))
with record.open(newline="") as source:
    rows = [row for row in csv.reader(source)
            if "/__spec__/" not in row[0]
            and not row[0].endswith("/conftest.py")
            and "/__pycache__/conftest." not in row[0]]
with record.open("w", newline="") as target:
    csv.writer(target).writerows(rows)
PYTHON
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
