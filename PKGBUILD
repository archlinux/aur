# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-q2templates
pkgver=2026.10.0
pkgrel=3
pkgdesc='HTML templates and interactive reports for QIIME 2 visualizations'
arch=(any)
url=https://github.com/qiime2/q2templates
license=(BSD-3-Clause MIT Unlicense)
depends=(python python-jinja python-pandas)
makedepends=(python-build python-installer python-setuptools python-versioningit python-wheel nodejs npm uglify-js)
checkdepends=(python-pytest chromium)
_commit=59d47eb8072d70f9e6f984dff4f052620a62a91e
_bootstrap_commit=0b9c4a4007c44201dce9a6cc1a38407005c26c86
_jquery_commit=63e5d534d1ebdb84ee99365c70a7521a86b4ee76
_sizzle_commit=1fb882d7076593de74686f5656393869b44b6a66
_normalize3_commit=2bdda84272650aedfb45d8abe11a6d177933a803
_normalize5_commit=f06565fe8e0e1ad1b88f2732719e28ed97bde40f
_h5bp_commit=aa0396eae757c9e03dda4e463fb0d4db5a5f82d7
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "bootstrap-3.3.7.tar.gz::https://github.com/twbs/bootstrap/archive/$_bootstrap_commit.tar.gz"
        "jquery-3.2.0.tar.gz::https://github.com/jquery/jquery/archive/$_jquery_commit.tar.gz"
        "sizzle-2.3.3.tar.gz::https://github.com/jquery/sizzle/archive/$_sizzle_commit.tar.gz"
        "normalize-3.0.3.tar.gz::https://github.com/necolas/normalize.css/archive/$_normalize3_commit.tar.gz"
        "normalize-5.0.0.tar.gz::https://github.com/necolas/normalize.css/archive/$_normalize5_commit.tar.gz"
        "html5-boilerplate-$_h5bp_commit.tar.gz::https://github.com/h5bp/html5-boilerplate/archive/$_h5bp_commit.tar.gz"
        runtime-modules.js matryoshka-vite.config.ts runtime-notices.py
        static-package.json static-package-lock.json build-static-assets.cjs
        static-notices.py check-static-assets.py)
sha256sums=('abd54379f9c422e2e9a65460a339511f725c8b33570ccad376a30534ebee8682'
            'd66816a1cb83602eea2d534a03295d1453f247c9ce863684fdd4be27258efa55'
            '4131ab7a92679348dad892166e86c76bf645ac52fd122e9468e3790fb8ad69a9'
            '0879b980e8a409de8b672a8d6e6c69b79382498c723836217014ff071517fb8f'
            '3c824b30385940b89e5d922362d364ba0fffa8f3c947dcbe17828e2f48d6d08e'
            'd4341fba6a4bd90d49c90b34fa34871480e02a95de125ef0f0fcf98a63580ab0'
            '550719bd92851c365f796de90e7374f56c9ed99b3bbce4aaa3f154411d2eba78'
            '3c5e2dfe3205420c87a9551eef6e292ed0c927c1072e58a3ab3f72f6e6f6a225'
            '4f2885e1596469dafceb7034cd980392a2b8bf6744546e41f05c488722cd19d5'
            '7b7adcf9b697a79bd988ee855e5e9b91b70cd1dbd9cccdbe7123950db85a634d'
            '0809ac2a82bb1ea37a8b8e4d7fbc7499c69018efb839f6eed25bd90feead1e20'
            '5be0a54a7915f431a546bddeafe851900542bbe489f97e3795c9e94891f71889'
            'db082a6eff6323b26823064f901b0a57c5678e7b5e232a1095745cdacb204aa2'
            '00accd4fdd0313e99223c2c412f106359909ec40d32f34942450118ff8c22e6c'
            'eaad78ab0b186bfa8f58291477bf835a334da17409a4f6f076c537e9a2ed55cf')

prepare() {
  mkdir -p static-tools
  cp static-package.json static-tools/package.json
  cp static-package-lock.json static-tools/package-lock.json
  npm ci --prefix static-tools --ignore-scripts --no-audit --no-fund
  cd "q2templates-$_commit"
  cp "$srcdir/"{runtime-modules.js,matryoshka-vite.config.ts} reports/matryoshka/
  npm ci --prefix reports/matryoshka --no-audit --no-fund
}

build() {
  cd "q2templates-$_commit"
  node "$srcdir/build-static-assets.cjs" "$srcdir/static-tools" \
    "$srcdir/bootstrap-$_bootstrap_commit" "$srcdir/jquery-$_jquery_commit" \
    "$srcdir/sizzle-$_sizzle_commit" "$PWD/q2templates/templates/assets"
  cmp "$srcdir/normalize.css-$_normalize5_commit/normalize.css" \
    q2templates/templates/assets/css/normalize.css
  python "$srcdir/static-notices.py" "$srcdir" q2templates/templates/assets
  npm run build --prefix reports/matryoshka -- --config matryoshka-vite.config.ts
  (cd reports/matryoshka && python "$srcdir/runtime-notices.py")
  install -d q2templates/reports/built_assets/matryoshka
  cp -r reports/matryoshka/build/. q2templates/reports/built_assets/matryoshka/
  python -m build --wheel --no-isolation
}

check() {
  python -m venv --system-site-packages --without-pip "$srcdir/check-env"
  "$srcdir/check-env/bin/python" -m installer "q2templates-$_commit"/dist/*.whl
  "$srcdir/check-env/bin/python" -I - "$srcdir" <<'PY'
from pathlib import Path
import sys
import pytest
import q2templates

installed = Path(q2templates.__file__).resolve().parent
assert installed.is_relative_to(Path(sys.prefix).resolve())
result = pytest.main(['--pyargs', 'q2templates', '--import-mode=importlib', '-v',
                     '--junitxml=' + sys.argv[1] + '/pytest-results.xml'])
for name, module in tuple(sys.modules.items()):
    if name == 'q2templates' or name.startswith('q2templates.'):
        filename = getattr(module, '__file__', None)
        if filename:
            assert Path(filename).resolve().is_relative_to(installed), (name, filename)
print('PASS: complete q2templates suite uses installed wheel modules')
raise SystemExit(result)
PY
  "$srcdir/check-env/bin/python" -I "$srcdir/check-static-assets.py"
}

package() {
  cd "q2templates-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -r reports/matryoshka/build/third-party-licenses "$pkgdir/usr/share/licenses/$pkgname/"
  cp -r q2templates/templates/assets/third-party-licenses \
    "$pkgdir/usr/share/licenses/$pkgname/static-assets"
}
