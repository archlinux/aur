# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-json-log-formatter
_srcname=json-log-formatter
pkgver=1.1.1
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
checkdepends=('python-pytest' 'python-ujson' 'python-simplejson')
# GitHub release tarball (the PyPI sdist omits tests.py)
source=("$_srcname-$pkgver.tar.gz::https://github.com/marselester/json-log-formatter/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71b0f37d2ed79431b9710e97c6faa27169e1e78140745a7c588ecf294ec5b318')

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_srcname-$pkgver"

    # 1) upstream test suite
    PYTHONPATH="$PWD:$PYTHONPATH" python -m pytest tests.py -v

    # 2) smoke test simulating real application logging: attach the formatter to a
    #    logger and emit info + error-with-exception + extra fields, then parse the
    #    emitted lines back as JSON and assert the structured content is correct.
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

lines = [json.loads(l) for l in stream.getvalue().splitlines()]
assert len(lines) == 2, lines
ok, err = lines
assert ok['message'] == 'request handled' and ok['method'] == 'GET' and ok['status'] == 200, ok
assert err['message'] == 'boom' and 'ZeroDivisionError' in err.get('exc_info', ''), err
assert 'time' in ok, ok          # formatter stamps a timestamp by default
print('json-log-formatter smoke OK: parsed %d JSON log lines with extras + traceback' % len(lines))
PY
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
