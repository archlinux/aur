# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=rachis-cli
pkgver=2026.10.0
pkgrel=1
pkgdesc='Command line interface and artifact viewer for the Rachis framework'
arch=(any)
url=https://github.com/rachis-org/rachis-cli
license=(BSD-3-Clause MIT Zlib AGPL-3.0-or-later CC-BY-SA-3.0)
depends=('python' 'python-rachis>=2026.10.0' 'python-q2templates>=2026.10.0' 'python-click>=8.5' 'python-tomlkit' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-versioningit' 'python-wheel' 'nodejs' 'npm')
checkdepends=('python-pytest' 'python-selenium' 'chromium')
optdepends=('python-pytest: run the shipped CLI test suite'
            'xdg-utils: open artifact views in the default desktop browser')
_commit=2602df0bed35d79c418b2fa8e4a2561337097f18
_view_commit=5ee9aee6564e94c2d84ed41e10429fe2ed344b1a
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "q2view-$_view_commit.tar.gz::https://github.com/qiime2/q2view/archive/$_view_commit.tar.gz"
        "resolve-ef9e9dae6ccced153292eead6dfbc040ae680a95.tar.gz::https://codeload.github.com/tapjs/resolve/tar.gz/ef9e9dae6ccced153292eead6dfbc040ae680a95"
        package-lock.json click-8.5.patch
        q2view-runtime-modules.js q2view-vite.config.ts copy-viewer-licenses.py
        "citeproc-73bc1b44bc7d54d0bfec4e070fd27f5efe024ff9.tar.gz::https://codeload.github.com/Juris-M/citeproc-js/tar.gz/73bc1b44bc7d54d0bfec4e070fd27f5efe024ff9"
        "MIT.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/MIT.txt"
        "AGPL-3.0-or-later.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/AGPL-3.0-or-later.txt"
        "CC-BY-SA-3.0.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/CC-BY-SA-3.0.txt")
sha256sums=('f09eba1a708d9235a33d65d5e6ab7cb06d5e555606a44e687f9564f00971c406'
            '12eaa8b859da996f3783eb2ec03ba1e1a55a9449cc521daf9aeec65819c36423'
            'a83cdd3bb9b3abd07365e4320e237d589292b2690c070624126828dd3a062528'
            'aeac463eec3598be0895558572f50b05e38e8fac150d4dd5e95484dcc5d81c95'
            '069de1c054d7e0000883ef8f0b8e369d7fd8da62db6e957f473bd5bf65463870'
            'bd88877adbf2eb48829dbb9e5b134e63a0e26257c3cc46f21d8e0d4e7f2a26dc'
            'fd702e735ab7bdbff8792b8c51ae489f511ffd5aafa4f7bffdd3f6be6fcf8186'
            '01c6ddbbb726925eae200fb978612f3d4c1b4ce4ab5af7b32e62ad7c0326408a'
            'da00c73384be59e634dbbab912345f0199fae2913f501aa9d08eef7ee1d8abd4'
            'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
            'd8a6cc31abc16b6748c7a21f21611f5a1ec33f67d22ca23d7da1c19b95496bee'
            '3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f')

prepare() {
  patch -d "rachis-cli-$_commit" -Np1 -i "$srcdir/click-8.5.patch"
  cp -r "q2view-$_view_commit"/. "rachis-cli-$_commit/q2view/"
  cp q2view-runtime-modules.js "rachis-cli-$_commit/q2view/"
  cp q2view-vite.config.ts "rachis-cli-$_commit/q2view/vite.config.ts"
  # Retain upstream's resolve fork while fetching its pinned source over HTTPS.
  cp package-lock.json "rachis-cli-$_commit/q2view/package-lock.json"
  # npm 12 requires opt-in for the pinned transitive source tarball.
  npm ci --prefix "rachis-cli-$_commit/q2view" --allow-remote=all --no-audit --no-fund
}

build() {
  cd "rachis-cli-$_commit"
  npm_config_vendor_dir=../rachis_cli/assets/view npm run vendor --prefix q2view
  python "$srcdir/copy-viewer-licenses.py" "$srcdir"
  python -m build --wheel --no-isolation
}

check() {
  local check_status=0
  npm test --prefix "rachis-cli-$_commit/q2view" -- --run || check_status=1
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "rachis-cli-$_commit"/dist/*.whl
  PATH="$srcdir/check-env/bin:$PATH" Q2CLIDEV=1 QIIMETEST=1 MPLBACKEND=Agg "$srcdir/check-env/bin/python" -I - --import-mode=importlib -v \
    "rachis-cli-$_commit/rachis_cli" --junitxml="$srcdir/pytest-results.xml" <<'PYTEST' || check_status=1
from pathlib import Path
import sys
import pytest
import rachis_cli

installed = Path(rachis_cli.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve()), installed
status = pytest.main(sys.argv[1:])
for name, module in tuple(sys.modules.items()):
    if name != 'rachis_cli' and not name.startswith('rachis_cli.'):
        continue
    origin = getattr(module, '__file__', None)
    if origin is None or 'tests' in name.split('.')[1:]:
        continue
    path = Path(origin).resolve()
    assert path.is_relative_to(installed), (name, path)
print('Installed runtime origin check passed:', installed)
raise SystemExit(status)
PYTEST
  return "$check_status"
}

package() {
  cd "rachis-cli-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -r rachis_cli/assets/view/third-party-licenses "$pkgdir/usr/share/licenses/$pkgname/viewer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 q2view/LICENSE "$pkgdir/usr/share/licenses/$pkgname/q2view-LICENSE"
  install -Dm644 "$srcdir/resolve-ef9e9dae6ccced153292eead6dfbc040ae680a95/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/resolve-LICENSE"
}
