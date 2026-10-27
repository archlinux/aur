# Maintainer: kutu OS contributors <release@kutu.so>

pkgname=python-mempressure
_pkgname=libmempressure
pkgver=0.2.1
pkgrel=1
pkgdesc='Python binding for libmempressure: memory-pressure events from kernel PSI'
arch=('x86_64' 'aarch64')
url='https://github.com/kutuso/libmempressure'
license=('MIT')
depends=('python' 'glibc')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4772859a141dc81e989790227ba4265a49d6cb030c1f278381ee6e6e7b1facf1')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local stage="$srcdir/stage"
  python -m installer --destdir="$stage" dist/*.whl
  printf 'some avg10=0.00 avg60=0.00 avg300=0.00 total=0\nfull avg10=0.00 avg60=0.00 avg300=0.00 total=0\n' \
    > "$srcdir/psi.fixture"
  PYTHONPATH="$(echo "$stage"/usr/lib/python3*/site-packages)" python - "$srcdir/psi.fixture" <<'PY'
import sys
import mempressure as mp
assert mp.start(psi_path=sys.argv[1], interval=0.05, hysteresis=1)
assert mp.current_level() == 0
assert mp.psi()["some_avg10"] == 0.0
mp.stop()
PY
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
