# Maintainer: mahoshojoHCG <hcgstd at proton dot me>
# SPDX-License-Identifier: GPL-3.0-only

pkgname=yay-auto-review
pkgver=0.2.0
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
sha256sums=('6697eb996cce02eda70fa2f1482e646571ceaedc44aa72fb66f4c681ef1b4caa')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  LC_ALL=C.UTF-8 AUR_AUTO_REVIEW_LANG=en python -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # AUR build directories and PYTHONPATH must never supply Python modules to
  # the reviewer or makepkg guard, including before per-user enablement.
  local command
  for command in yay-auto-review aur-auto-review aur-auto-review-makepkg; do
    sed -i '1c#!/usr/bin/python -I' "$pkgdir/usr/bin/$command"
  done
  sed -i \
    -e 's@local command = "aur-auto-review"@local command = "/usr/bin/aur-auto-review"@' \
    -e 's@local guard = "aur-auto-review-makepkg"@local guard = "/usr/bin/aur-auto-review-makepkg"@' \
    "$pkgdir/usr/share/aur-auto-review/aur-auto-review.lua"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 README.en.md "$pkgdir/usr/share/doc/$pkgname/README.en.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
