# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=python-stdlib-list
pkgver=0.11.1
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
b2sums=('b5b32df65b31bcd9c55c41cc5a46707d837e9ffc3180b28ae7509eb3f1b47d757f494d2166616daa94e5c4aa0c4b3423008b24b84699ac39e7f30b19c8c12c27')

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
