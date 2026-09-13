# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-json-log-formatter
_srcname=json-log-formatter
pkgver=1.2.1
pkgrel=1
pkgdesc='JSON log formatter for the Python logging module'
arch=('any')
url='https://github.com/marselester/json-log-formatter'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-django'
    'python-pytest'
    'python-simplejson'
    'python-ujson'
)
optdepends=(
    'python-simplejson: alternative JSON encoder'
    'python-ujson: alternative JSON encoder'
)
# GitHub release tarball (the PyPI sdist omits tests.py)
source=("$_srcname-$pkgver.tar.gz::https://github.com/marselester/json-log-formatter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d3203de11c6dee3c9d033f2453d8a3fda4fb6612319c0cd837cc6956d557daf')

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_srcname-$pkgver"

    # 1) upstream test suite
    PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest -s tests.py -v

    # 2) smoke test simulating real application logging: attach the formatter to a
    #    logger and emit regular, exception, and circular-value records, then parse
    #    the lines back as JSON and verify that no record or useful field is lost.
    PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import io, json, logging, json_log_formatter

stream = io.StringIO()
handler = logging.StreamHandler(stream)
handler.setFormatter(json_log_formatter.JSONFormatter())
log = logging.getLogger('app')
log.addHandler(handler)
log.setLevel(logging.DEBUG)

log.info('request handled', extra={'method': 'GET', 'path': '/users', 'status': 200})
try:
    1 / 0
except ZeroDivisionError:
    log.error('boom', exc_info=True)

circular = {}
circular['self'] = circular
log.warning(
    'serialization fallback',
    extra={'event': 'request_failed', 'status': 500, 'context': circular},
)

lines = [json.loads(l) for l in stream.getvalue().splitlines()]
assert len(lines) == 3, lines
ok, err, fallback = lines
assert ok['message'] == 'request handled' and ok['method'] == 'GET' and ok['status'] == 200, ok
assert err['message'] == 'boom' and 'ZeroDivisionError' in err.get('exc_info', ''), err
assert fallback['message'] == 'serialization fallback', fallback
assert fallback['event'] == 'request_failed' and fallback['status'] == 500, fallback
assert fallback['context'] == str(circular), fallback
assert 'time' in ok, ok          # formatter stamps a timestamp by default
print('json-log-formatter smoke OK: parsed %d JSON log lines with extras, traceback, and fallback' % len(lines))
PY
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
