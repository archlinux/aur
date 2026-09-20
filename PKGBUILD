# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-nkeys
_pkgname=nkeys.py
pkgver=0.2.1
pkgrel=1
pkgdesc="Public-key signature system based on Ed25519 for the NATS ecosystem"
arch=('any')
url="https://github.com/nats-io/nkeys.py"
license=('Apache-2.0')
depends=(
    'python>=3.6'
    'python-pynacl'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools>=68'
    'python-wheel'
)
_archive="$_pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1586d7bd60a89f5b5613c6426361d9550add92a6d7475b95de1729a6ca9ddc8c')

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"

    local _checkroot="$srcdir/_check"
    local _site
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # Run the complete upstream unittest suite against the built wheel.
    cd "$srcdir"
    PYTHONPATH="$_checkroot$_site" \
        python -m unittest discover -v -s "$_archive/tests" -p '*_test.py'

    # Exercise the principal key lifecycle: decode, sign, verify and wipe.
    PYTHONPATH="$_checkroot$_site" python - <<'PY'
import nkeys

seed = bytearray(b"SUAMLK2ZNL35WSMW37E7UD4VZ7ELPKW7DHC3BWBSD2GCZ7IUQQXZIORRBU")
key_pair = nkeys.from_seed(seed)
payload = b"private-nats-challenge"
signature = key_pair.sign(payload)
assert key_pair.verify(payload, signature) is True
assert key_pair.public_key == b"UCK5N7N66OBOINFXAYC2ACJQYFSOD4VYNU6APEJTAVFZB2SVHLKGEW7L"
try:
    key_pair.verify(payload + b"-tampered", signature)
except nkeys.ErrInvalidSignature:
    pass
else:
    raise AssertionError("tampered payload unexpectedly verified")
key_pair.wipe()
PY
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
