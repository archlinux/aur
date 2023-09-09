# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=2.26
pkgrel=3
pkgdesc="Utility to push an Arch hosts package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.10" "rsync" "sudo" "openssh" "python-requests"
         "python-ruamel-yaml" "pyalpm")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=("pacsync")
conflicts=("pacsync")
sha1sums=('7a10ddc00b8d9f5c614963f9176f6ad2b568600f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Require special handling for python data files on Arch
  local pdir=$(python -c "import site; print(site.getsitepackages()[0])")
  install -m 644 -t "$pkgdir/$pdir/$pkgname/" "$pkgname/${pkgname}.conf"
}

# vim:set ts=2 sw=2 et:
