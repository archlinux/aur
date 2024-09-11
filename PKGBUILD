# Maintainer: Yuki Sireneva <yuki dot utk8g at gmail dot com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: graysky <graysky AT archlinux DOT us>

_pkgbasename=ssh-audit
pkgname=$_pkgbasename-git
pkgver=3.2.0.r15.g06ebdbd
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
conflicts=($_pkgbasename)
checkdepends=('python-pytest')
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

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

  local basename=${pkgname%-git}

  python -m installer --destdir="$pkgdir" dist/*.whl

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$basename.1"

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$basename"
  ln -s "$site_packages/ssh_audit-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$basename/LICENSE"
}
