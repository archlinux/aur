# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-rjieba
pkgver=0.2.2
pkgrel=1
pkgdesc="Fast Chinese text segmentation with jieba-rs Python bindings"
arch=('x86_64')
url="https://github.com/messense/rjieba-py"
license=('MIT')
_commit=8cc8808dbae251afc50a88f11ba8143283a6c6b1
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-installer' 'python-maturin' 'rust')
checkdepends=('python-pytest')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('ed593aeca6208584d0ee60d1b3078ad1614d40b210f0b22191e49eb3698322df')

prepare() {
    cd "rjieba-py-$_commit"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "rjieba-py-$_commit"
    maturin build --release --locked --offline --strip
}

check() {
    cd "rjieba-py-$_commit"
    python -m venv --system-site-packages --without-pip "$srcdir/check-env"
    "$srcdir/check-env/bin/python" -m installer target/wheels/*.whl
    cd "$srcdir"
    "$srcdir/check-env/bin/python" -m pytest -v \
        "rjieba-py-$_commit/tests" --junitxml="$srcdir/pytest-results.xml"
}

package() {
    cd "rjieba-py-$_commit"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl

    # Keep Maturin's SBOM references reproducible and its RECORD hashes valid.
    python - "$pkgdir" "$srcdir/rjieba-py-$_commit" "$url/tree/$_commit" <<'PYRECORD'
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
