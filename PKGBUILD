# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname=maia3
pkgname="$_pkgname-git"
pkgver=r6.1e13597
pkgrel=1
pkgdesc='Accurate and efficient human chess move prediction engine. (Git version)'
arch=('any')
url='https://github.com/CSSLab/maia3'
license=('AGPL-3.0-or-later')
depends=(
  'python>=3.10'
  'python-huggingface-hub'
  'python-numpy'
  'python-chess'
  'python-pytorch'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=68' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/CSSLab/maia3.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( 
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
