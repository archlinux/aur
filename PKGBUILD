pkgname=ljprint-git
pkgver=r2.29e8196
pkgrel=1
pkgdesc="BLE CLI for LuckJingle / DingDang thermal printers (reverse-engineered protocol)"
arch=('any')
url="https://github.com/MrSlopster/ljprint"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-bleak'
  'python-numpy'
  'python-pillow'
  'python-pypdfium2'
  'python-barcode'
  'python-qrcode'
)
makedepends=(
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
provides=('ljprint' 'luckjingle-print')
conflicts=('ljprint' 'luckjingle-print')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Shell completions (cover both the luckjingle-print and ljprint entry points)
  install -Dm644 src/luckjingle/completions/luckjingle_print.bash \
    "$pkgdir/usr/share/bash-completion/completions/luckjingle-print"
  ln -s luckjingle-print "$pkgdir/usr/share/bash-completion/completions/ljprint"
  install -Dm644 src/luckjingle/completions/_luckjingle_print \
    "$pkgdir/usr/share/zsh/site-functions/_luckjingle_print"

  install -Dm644 README.md PROTOCOL.md -t "$pkgdir/usr/share/doc/$pkgname"
}
