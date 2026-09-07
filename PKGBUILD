# Maintainer: mahoshojoHCG <hcgstd at proton dot me>
# SPDX-License-Identifier: GPL-3.0-only

pkgname=yay-auto-review
pkgver=0.3.0
pkgrel=1
pkgdesc='Review AUR package recipes with Codex before yay builds them'
arch=('any')
url='https://github.com/HCGStudio/yay-auto-review'
license=('GPL-3.0-only')
# yay-bin and yay-git provide an unversioned 'yay'; enable checks for yay >= 13.
depends=('python>=3.11' 'git' 'yay' 'openai-codex')
makedepends=('python-build' 'python-installer' 'python-setuptools>=77' 'python-wheel')
checkdepends=('lua51')
install=yay-auto-review.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ae9f00f8a81be0b322a682947af2ab1dd1d2d1169dee2d756e6919172e874af')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  LC_ALL=C.UTF-8 YAY_AUTO_REVIEW_LANG=en python -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # AUR build directories and PYTHONPATH must never supply Python modules to
  # the reviewer or makepkg guard, including before per-user enablement.
  local command
  for command in yay-auto-review yay-auto-review-makepkg; do
    sed -i '1c#!/usr/bin/python -I' "$pkgdir/usr/bin/$command"
  done
  sed -i \
    -e 's@local command = "yay-auto-review"@local command = "/usr/bin/yay-auto-review"@' \
    -e 's@local guard = "yay-auto-review-makepkg"@local guard = "/usr/bin/yay-auto-review-makepkg"@' \
    "$pkgdir/usr/share/yay-auto-review/yay-auto-review.lua"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.en.md "$pkgdir/usr/share/doc/$pkgname/README.en.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
