# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=debugpy
pkgname=python-$_pkgname
pkgver=1.0.0rc1
pkgrel=1
pkgdesc="A debugger for Python used with Visual Studio and Visual Studio Code"
url="https://github.com/microsoft/$_pkgname"
license=("MIT")
arch=("x86_64")
depends=("python>=3.5")
makedepends=("python-pip")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('08b10939f219183855f665c173ba76640503db71')

package() {
  cd $_pkgname-$pkgver

  _vers="$pkgver-$pkgrel"
  sed -i "/version=/s/=.*/=\'$_vers\',/" setup.py

  PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir" \
    --quiet \
    --isolated \
    --ignore-installed \
    --disable-pip-version-check \
    --no-python-version-warning \
    --no-compile \
    --no-cache-dir \
    --no-deps \
    --no-binary=:all: \
    .

  local pdir=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$pkgdir/$pdir"
  rm -rf $_pkgname-*.dist-info
  cd "$_pkgname"

  sed -i "/\"version\":/s/\"[^\"]*\"$/\"$_vers\"/" _version.py

  # Compile bytecode. Ignore failures on legacy python2 files ..
  python -O -m compileall -qq . || true
}

# vim:set ts=2 sw=2 et:
