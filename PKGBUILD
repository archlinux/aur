# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Tim Schumacher <timschumi@gmx.de>

_name=ytmusicapi
pkgname=python-$_name
pkgver=0.24.1
pkgrel=1
pkgdesc="Unofficial API for YouTube Music"
arch=('any')
url="https://github.com/sigma67/ytmusicapi"
license=('MIT')
depends=('python-requests')
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-sphinx
    python-wheel
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f0d62eb6467047cb50cec57362c3a8e87764899e966c87289c38dc3b082cdcf3')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs text
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/build/text/*

  # Symlink license file
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s "$site_packages/$_name-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
