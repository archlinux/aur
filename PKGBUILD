# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=ssh-audit
pkgver=3.2.0
pkgrel=1
pkgdesc='SSH configuration auditing'
arch=('any')
url='https://github.com/jtesta/ssh-audit'
license=('MIT')
depends=('python')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('30803f7cad987cf381973df285f0a85110c2da571a85f920b78ec25cae952d44201cb4bb427551b05cfa14811009a4b9b2d324298b95086a71f1bd8153640bd1')
b2sums=('0ab4843bd1c5ad49f8b04febbe1f58a0a41befdddfacc86268176c0e555cd2b329abfff7efe2fe0e16574c5b44141e4bf4d91f06015af6f3b8c92c7a1f5c0b86')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/build/lib" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$pkgname.1"

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/ssh_audit-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
