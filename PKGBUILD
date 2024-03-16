# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=python-stdlib-list
pkgver=0.10.0
pkgrel=1
pkgdesc='A list of Python Standard Libraries'
arch=('any')
url='https://github.com/pypi/stdlib-list'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
checkdepends=('python-pytest')
_commit='21e67eef5898d27004442f68e84f2b8a847e319a'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md{,.old}

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/stdlib_list-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
