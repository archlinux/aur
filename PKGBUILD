# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=stitch-fuzz
_pyname=stitch_fuzz
pkgver=0.2.0
pkgrel=1
pkgdesc="Automatic, expressive, and scalable API fuzzing with typed stubs and a Docker-based CLI"
arch=('any')
url="https://github.com/hgarrereyn/STITCHplusplus"
license=('MIT')
# The CLI builds and runs every harness in containers and shells out to `docker buildx` for every image build.
# Bundled language runtime assets execute inside those images, so their interpreters are not host dependencies.
depends=('python' 'docker' 'docker-buildx')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hgarrereyn/STITCHplusplus/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('3c2ecc6c45888907750f50fe601ca95b292ff77253e7fc46f62f8a517e3b0595')

latestver() {
    curl -fsSL https://pypi.org/pypi/stitch-fuzz/json |
        python -c 'import json,sys; print(json.load(sys.stdin)["info"]["version"])'
}

build() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_pyname}-${pkgver}"
    rm -rf "$srcdir/check-root"
    python -m installer --destdir="$srcdir/check-root" dist/*.whl

    local site_dir
    site_dir=$(find "$srcdir/check-root" -type d -name stitch_fuzz -printf '%h\n' | head -1)
    [[ -n $site_dir ]] || return 1

    PKGVER="$pkgver" PYTHONPATH="$site_dir" python -c '
import importlib, os, pkgutil, stitch_fuzz
for module in pkgutil.walk_packages(stitch_fuzz.__path__, "stitch_fuzz."):
    if module.name != "stitch_fuzz.__main__":
        importlib.import_module(module.name)
assert stitch_fuzz.__version__ == os.environ["PKGVER"]
' || return 1

    local changelog
    changelog=$(PYTHONPATH="$site_dir" python -m stitch_fuzz changelog --all --json) || return 1
    printf '%s' "$changelog" | PKGVER="$pkgver" python -c '
import json, os, sys
data = json.load(sys.stdin)
assert data["ok"] is True
assert data["installed"] == os.environ["PKGVER"]
assert any(entry["version"] == os.environ["PKGVER"] for entry in data["entries"])
'
}

package() {
    cd "$srcdir/${_pyname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
