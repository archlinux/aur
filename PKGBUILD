# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=sysconfigpatcher
pkgname=python-$_name
pkgver=0.3.1
pkgrel=2
pkgdesc="Patch sysconfigdata and pkgconfig files in a python installation from indygreg's python builds."
arch=('any')
url="https://github.com/bluss/$_name"
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-hatchling' 'python-installer')
source=("git+$url.git#tag=$pkgver")
sha256sums=('30b1db731f8e2d0d4d6d7ddc75b116772cf7d3a98943da6aab8c360bcd5f9dee')

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # https://wiki.archlinux.org/title/Python_package_guidelines#Using_site-packages
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  install -d "$pkgdir/usr/share/licenses"
  local _licenses_path="$_site_packages/$_name-$pkgver.dist-info/licenses"
  [ -f "$pkgdir/$_licenses_path/LICENSE.md" ] || { echo "License file not found"; exit 1; }
  ln -s "$_licenses_path" "$pkgdir/usr/share/licenses/$pkgname"
}
