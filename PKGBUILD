# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=3.0
pkgrel=2
pkgdesc="Linux shell cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
sha1sums=('fc826eacfcd27789a7eec819ced6e7e013d5694d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  PIP_CONFIG_FILE=/dev/null pip install \
    --root="$pkgdir" \
    --isolated \
    --ignore-installed \
    --no-deps \
    --disable-pip-version-check \
    --no-python-version-warning \
    --no-warn-script-location \
    --no-cache-dir \
    --no-compile \
    --progress-bar=off \
    --root-user-action=ignore \
    .

  local pdir=$(python -c "import site; print(site.getsitepackages()[0])")
  local _pkgname="${pkgname//-/_}"
  cd "$pkgdir/$pdir"
  rm -f $_pkgname-*.dist-info/direct_url.json
  sed -i "/\/direct_url.json,/d" $_pkgname-*.dist-info/RECORD
  python -O -m compileall -q .
}

# vim:set ts=2 sw=2 et:
