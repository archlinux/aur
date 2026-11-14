# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: pjvm <pjvm742@disroot.org>

pkgname=python-farama-notifications
_name=Farama-Notifications
pkgver=0.0.6
pkgrel=1
pkgdesc="Notices from the Farama Foundation; given as a dependency for all of their packages."
arch=('any')
url="https://github.com/Farama-Foundation/Farama-Notifications"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('714358f247467f23dc63fab040fcbce3b0ecdbaa5900077d1126fbd3b18f2d3a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    local site
    site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    rm -rf "$srcdir/check-root" "$srcdir/check-suite"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl
    # Upstream CI runs this script directly. Run a copy outside the checkout
    # so that it imports the staged wheel rather than the source tree.
    mkdir -p "$srcdir/check-suite/tests"
    cp tests/ci-test.py "$srcdir/check-suite/tests/"
    PYTHONPATH="$srcdir/check-root$site" python -P - "$srcdir/check-root" <<'PY'
import sys
from pathlib import Path
import farama_notifications
assert Path(farama_notifications.__file__).resolve().is_relative_to(Path(sys.argv[1]).resolve())
PY
    PYTHONPATH="$srcdir/check-root$site" python -P "$srcdir/check-suite/tests/ci-test.py"
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
