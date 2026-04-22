# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3 Flash.

pkgname=paper2slides-git
pkgver=r25.941695a
pkgrel=1
pkgdesc="From paper to presentation in one click (CLI)"
arch=('any')
url="https://github.com/HKUDS/Paper2Slides"
license=('MIT')
depends=(
  'python'
  'python-fastapi'
  'python-huggingface-hub'
  'python-openai'
  'python-pillow'
  'python-pydantic'
  'python-dotenv'
  'python-python-multipart'
  'python-yaml'
  'python-requests'
  'python-reportlab'
  'python-tqdm'
  'uvicorn'
)
makedepends=('git')
optdepends=(
  'python-pip: install remaining upstream Python dependencies from requirements.txt (e.g. lightrag-hku, mineru[core])'
)
provides=('paper2slides')
conflicts=('paper2slides')
source=('git+https://github.com/HKUDS/Paper2Slides.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Paper2Slides"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/Paper2Slides"

  install -dm755 "$pkgdir/usr/lib/paper2slides"
  cp -a paper2slides "$pkgdir/usr/lib/paper2slides/"
  cp -a requirements.txt README.md "$pkgdir/usr/lib/paper2slides/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/paper2slides" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail
export PYTHONPATH="/usr/lib/paper2slides:${PYTHONPATH:-}"
exec python -m paper2slides.main "$@"
EOF
}
