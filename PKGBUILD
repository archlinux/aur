# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-kgb
_pkgname=kgb
pkgver=7.3
pkgrel=2
_commit=c77c3f4133a405e38b38e60ae4282583762b408b
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
)
optdepends=(
    'python-pytest: pytest plugin for spy assertions'
)
checkdepends=('python-pytest')
# kgb 7.3 was published to PyPI without a matching git tag (upstream's latest tag
# is release-7.2), so pin the exact "Release KGB 7.3" commit from the repo.
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/beanbaginc/kgb/archive/$_commit.tar.gz"
    'Build-release-version.patch'
)
sha256sums=(
    '69da9b30b35db18c76c9376c0d991c563e5854856122c0670403917aa3b231c4'
    '89d700ee91ed3c6203e0abb6796b65dc33f11cd33814d26b4983d3f770a66172'
)

prepare() {
    cd "$_pkgname-$_commit"
    patch -Np1 --fuzz=0 -i "$srcdir/Build-release-version.patch"
}

build() {
    cd "$_pkgname-$_commit"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$_commit"

    # 1) upstream test suite. kgb's pytest-plugin tests need its entry point
    #    registered, so run against the built wheel installed to a temp prefix.
    local _site
    rm -rf "$srcdir/_check"
    python -m installer --destdir="$srcdir/_check" dist/*.whl
    _site=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "$srcdir"
    PYTHONNOUSERSITE=1 PYTHONPATH="$srcdir/_check$_site" \
        python -m pytest --pyargs kgb -v

    # 2) smoke test simulating real unit-test usage: spy on a "costly" collaborator
    #    so the code under test never really calls it, then assert how it was used.
    PYTHONNOUSERSITE=1 PYTHONPATH="$srcdir/_check$_site" python - <<'PY'
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
    cd "$_pkgname-$_commit"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
