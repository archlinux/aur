# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-text2num
pkgver=3.1.0
pkgrel=2
pkgdesc='Parse and transcribe numbers expressed as natural language words'
arch=(x86_64)
url='https://github.com/allo-media/text2num'
license=(MIT)
depends=(glibc libgcc python)
makedepends=(rust python-build python-installer 'python-maturin>=1.7' 'python-maturin<2')
# Preserve the wheel's native extension bytes and its matching RECORD entry.
options=(!strip)
_commit=5007cc125e85f9c9954015be572072952549b6f9
source=("text2num-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('032b08292e93f8689c618f35513d28df1d86bcf7b879f1a5f8ba4290e35e41bc')

prepare() {
  cd "text2num-$_commit"
  export CARGO_HOME="${CARGO_HOME:-$srcdir/cargo}"
  cargo fetch --locked
}

build() {
  cd "text2num-$_commit"
  export CARGO_HOME="${CARGO_HOME:-$srcdir/cargo}" CARGO_NET_OFFLINE=true
  python -m build --wheel --no-isolation
}

check() {
  cd "text2num-$_commit"
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  PYTHONPATH="${site_packages[0]}" python -m unittest discover -s tests -v
}

package() {
  cd "text2num-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
    # Keep Maturin's SBOM references reproducible and its RECORD hashes valid.
    python - "$pkgdir" "$srcdir/text2num-$_commit" "$url/tree/$_commit" <<'PYRECORD'
import base64
import csv
import hashlib
from pathlib import Path
import sys
import sysconfig

site = Path(sys.argv[1]) / sysconfig.get_path("purelib").lstrip("/")
for record in site.glob("*.dist-info/RECORD"):
    changed = {}
    for sbom in record.parent.glob("sboms/*.json"):
        original = sbom.read_text()
        rewritten = original.replace("path+file://" + sys.argv[2], sys.argv[3])
        if rewritten == original:
            continue
        sbom.write_text(rewritten)
        data = sbom.read_bytes()
        digest = base64.urlsafe_b64encode(hashlib.sha256(data).digest()).rstrip(b"=").decode()
        changed[str(sbom.relative_to(site))] = ["sha256=" + digest, str(len(data))]
    if changed:
        with record.open(newline="") as stream:
            rows = list(csv.reader(stream))
        for row in rows:
            if row[0] in changed:
                row[1:] = changed[row[0]]
        with record.open("w", newline="") as stream:
            csv.writer(stream, lineterminator="\n").writerows(rows)
PYRECORD
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
