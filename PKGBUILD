# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=sleep-inhibitor
_pkgname="${pkgname/-/_}"
pkgver=1.24
pkgrel=1
pkgdesc="Program to run plugins to inhibit system sleep/suspend"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
backup=("etc/$pkgname.conf")
depends=("python>=3.7" "python-ruamel-yaml")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('a4f50903e00c69f2b6af2e3793a6382dea8d0b83')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Require special handling for python data files on Arch
  local pdir=$(python -c "import site; print(site.getsitepackages()[0])")
  install -m 644 -t "$pkgdir/$pdir/$_pkgname/" "$_pkgname/${pkgname}.conf"
  install -m 644 -t "$pkgdir/$pdir/$_pkgname/" "$_pkgname/${pkgname}.service"
  install -Dm 644 -t "$pkgdir/usr/lib/systemd/system/" "$_pkgname/${pkgname}.service"
}

# vim:set ts=2 sw=2 et:
