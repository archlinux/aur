# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=sleep-inhibitor
_pkgname="${pkgname/-/_}"
pkgver=1.22
pkgrel=1
pkgdesc="Program to run plugins to inhibit system sleep/suspend"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
backup=("etc/$pkgname.conf")
depends=("python>=3.7" "python-ruamel-yaml")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('2b63fba47cfba3f0e2bfc5751c9813ee67bb895c')

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
}

# vim:set ts=2 sw=2 et:
