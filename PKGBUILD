# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=python-stdlib-list
pkgver=0.12.0
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
source=("$pkgname::git+$url#commit=v$pkgver")
b2sums=('c017ad0067d39415551fb9ae6020965c07136faa0219dcd2880cdc6aecb58ff9191383902973c758b6e134606fb51a64c0ec35f3d8581e4cad4b14f0df95a9a2')

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
