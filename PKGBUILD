# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-aiorwlock
_pkgname=aiorwlock
pkgver=1.5.1
pkgrel=1
pkgdesc='Read-write lock for asyncio'
arch=('any')
url='https://github.com/aio-libs/aiorwlock'
license=('Apache-2.0')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
checkdepends=(
    'python-pytest'
    'python-pytest-asyncio'
)
# GitHub release tarball (the PyPI sdist omits the tests/ dir)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/aio-libs/aiorwlock/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b3a5297495452ed0a5b7fb9eb184cd531380856791792abe92f19c9906365def')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    # tests/test_version.py reads importlib.metadata.version("aiorwlock"), which
    # needs the installed .dist-info; run against the built wheel in a temp prefix
    # (testing the bare source tree would only pass if aiorwlock were already
    # installed system-wide).
    local _site
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")

    # 1) upstream test suite (pytest-asyncio config comes from the repo's setup.cfg)
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python -m pytest tests/ -v

    # 2) smoke test simulating real use: many concurrent readers may hold the lock
    #    together, but a writer is mutually exclusive with all of them.
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python - <<'PY'
import asyncio
from aiorwlock import RWLock

async def main():
    rwlock = RWLock()
    state = {'readers': 0, 'max_readers': 0, 'writer_saw_readers': None}

    async def reader(hold):
        async with rwlock.reader_lock:
            state['readers'] += 1
            state['max_readers'] = max(state['max_readers'], state['readers'])
            await asyncio.sleep(hold)
            state['readers'] -= 1

    async def writer():
        await asyncio.sleep(0.01)            # let readers grab the lock first
        async with rwlock.writer_lock:
            # while we hold the writer lock, no reader may be inside
            state['writer_saw_readers'] = state['readers']
            assert rwlock.writer_lock.locked
    await asyncio.gather(reader(0.05), reader(0.05), reader(0.05), writer())
    return state

s = asyncio.run(main())
assert s['max_readers'] == 3, ('readers should run concurrently', s)
assert s['writer_saw_readers'] == 0, ('writer must exclude readers', s)
print('aiorwlock smoke OK: concurrent_readers=%s writer_exclusive=%s'
      % (s['max_readers'], s['writer_saw_readers'] == 0))
PY
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
