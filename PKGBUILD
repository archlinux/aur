# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-sphn
pkgver=0.2.1
pkgrel=3
pkgdesc="Rust-backed Python audio decoding, resampling and Opus streaming"
arch=('x86_64')
url="https://github.com/kyutai-labs/sphn"
license=('MIT OR Apache-2.0')
_commit=760a9464a3a2b9772e75ee11f42ac51146406dc1
depends=('python' 'python-numpy' 'gcc-libs' 'glibc' 'opus')
makedepends=('python-installer' 'python-maturin' 'rust' 'cmake' 'pkgconf')
checkdepends=('ffmpeg')
options=('!lto' '!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        'Cargo.lock')
sha256sums=('39439dedcc3603702c390734185b6bf3e9c041a665105fa4b04d7ea27ae3365c'
            'a39258e1700488465fea49fd43bc1695d15c9d7d1f56227b208e29c9bd65b447')

prepare() {
    cd "sphn-$_commit"
    cp "$srcdir/Cargo.lock" Cargo.lock
    cargo fetch --locked
}

build() {
    cd "sphn-$_commit"
    # The system Opus library avoids the bundled version's obsolete CMake code.
    pkg-config --exists opus
    maturin build --release --locked --offline --strip --compatibility linux
}

check() {
    cd "sphn-$_commit"
    python -m venv --system-site-packages --without-pip "$srcdir/check-env"
    "$srcdir/check-env/bin/python" -m installer target/wheels/*.whl
    mkdir -p "$srcdir/check-data"
    cd "$srcdir/check-data"
    ffmpeg -hide_banner -loglevel error -nostdin -y \
        -f lavfi -i 'sine=frequency=440:sample_rate=24000:duration=1' \
        -ac 1 -codec:a libmp3lame bria.mp3
    "$srcdir/check-env/bin/python" "$srcdir/sphn-$_commit/test/basic.py"
    "$srcdir/check-env/bin/python" "$srcdir/sphn-$_commit/test/stream.py"
}

package() {
    cd "sphn-$_commit"
    python -m installer --destdir="$pkgdir" target/wheels/*.whl

    # Keep Maturin's SBOM references reproducible and its RECORD hashes valid.
    python - "$pkgdir" "$srcdir/sphn-$_commit" "$url/tree/$_commit" <<'PYRECORD'
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
