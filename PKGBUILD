# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-kgb
_pkgname=kgb
pkgver=7.3
pkgrel=1
pkgdesc='Utilities for spying on function calls in unit tests'
arch=('any')
url='https://github.com/beanbaginc/kgb'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
optdepends=(
    'python-pytest: pytest plugin for spy assertions'
)
checkdepends=('python-pytest')
# kgb 7.3 was published to PyPI without a matching git tag (upstream's latest tag
# is release-7.2), so pin the exact "Release KGB 7.3" commit from the repo.
source=("git+https://github.com/beanbaginc/kgb.git#commit=c77c3f4133a405e38b38e60ae4282583762b408b")
sha256sums=('SKIP')

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname"

    # 1) upstream test suite. kgb's pytest-plugin tests need its entry point
    #    registered, so run against the built wheel installed to a temp prefix.
    local _site
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python -m pytest --pyargs kgb -v

    # 2) smoke test simulating real unit-test usage: spy on a "costly" collaborator
    #    so the code under test never really calls it, then assert how it was used.
    PYTHONPATH="$srcdir/_check$_site:$PYTHONPATH" python - <<'PY'
from kgb import SpyAgency

# a module-level dependency the code under test calls (e.g. a network charge)
def charge(amount, currency='USD'):
    raise AssertionError('real charge must never run in tests')

def checkout(cart):
    return charge(sum(cart), currency='USD')

agency = SpyAgency()
spy = agency.spy_on(charge, call_fake=lambda amount, currency='USD': {'ok': True, 'amount': amount})

result = checkout([10, 20, 12])
assert result == {'ok': True, 'amount': 42}, result
assert spy.called and len(spy.calls) == 1, len(spy.calls)
assert spy.called_with(42, currency='USD'), spy.calls
assert spy.calls[0].args == (42,) and spy.calls[0].kwargs == {'currency': 'USD'}, spy.calls[0]
assert spy.calls[0].returned({'ok': True, 'amount': 42})
print('kgb smoke OK: faked collaborator, calls=%d args=%s' % (len(spy.calls), spy.calls[0].args))
PY
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
