# Maintainer: lifespirit <life@crabs.pro>
# React admin frontend for Invoice Ninja (separate from the PHP backend).

pkgname=invoiceninja-ui
# Use YYYY.MM.DD.revision, unlike upstream DD.MM.YYYY.revision, so upgrades
# remain monotonic across year boundaries according to pacman vercmp.
pkgver=2026.11.23.1
pkgrel=1
_upstream_tag=23.11.2026.1
pkgdesc='React administration frontend for Invoice Ninja'
arch=('any')
url='https://github.com/invoiceninja/ui'
license=('LicenseRef-ELv2')
depends=('invoiceninja')
makedepends=('unzip' 'python')
source=(
  "$pkgname-$pkgver.zip::https://github.com/invoiceninja/ui/releases/download/${_upstream_tag}/invoiceninja-react.zip"
  "LICENSE::https://raw.githubusercontent.com/invoiceninja/ui/${_upstream_tag}/LICENSE"
)
sha256sums=(
  'd8cf37fe5ddeb75768aadb5890aa8dde752d9a2ea2268c325db8e21f394b3d3b'
  'SKIP'
)

prepare() {
  cd "$srcdir"
  test -s dist/index.html || { echo 'Missing dist/index.html in upstream UI release' >&2; return 1; }
  test -d dist/react || { echo 'Missing dist/react assets in upstream UI release' >&2; return 1; }
  # Fail closed if upstream changes release archive layout or public files.
  python - "$srcdir/dist" <<'PYTEST'
from pathlib import Path
import re, sys
base = Path(sys.argv[1])
allowed = {'index.html', 'favicon.ico', 'manifest.json', 'robots.txt', 'logo180.png'}
allowed_dirs = {'react', 'rsms', 'dap-logos', 'docuninja', 'tinymce_6.4.2', 'tinymce_7.9.3', 'gateway-card-images'}
for entry in base.iterdir():
    if entry.name not in allowed | allowed_dirs:
        raise SystemExit(f'Unexpected top-level UI asset: {entry.name}')
html = (base / 'index.html').read_text()
for path in re.findall(r'(?:src|href)=["\'](/[^"\']+)["\']', html):
    if path.startswith('//'):
        continue
    path = path.split('?', 1)[0]
    if not (base / path.lstrip('/')).is_file():
        raise SystemExit(f'React HTML refers to a missing static asset: {path}')
print('UI release layout and HTML assets verified')
PYTEST
}

package() {
  local target="$pkgdir/usr/share/webapps/invoiceninja"
  install -Dm644 "$srcdir/dist/index.html" \
    "$target/resources/views/react/index.blade.php"

  # Backend already owns favicon.ico, manifest.json, robots.txt and the
  # gateway-card-images tree. Do NOT overwrite them from the UI package.
  local asset
  for asset in react rsms dap-logos docuninja tinymce_6.4.2 tinymce_7.9.3 logo180.png; do
    if [[ -e "$srcdir/dist/$asset" ]]; then
      install -d "$target/public"
      cp -r -- "$srcdir/dist/$asset" "$target/public/$asset"
    fi
  done
  test -d "$target/public/react" || return 1
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
