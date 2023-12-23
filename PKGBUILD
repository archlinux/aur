# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pook
pkgver=1.2.0
pkgrel=1
pkgdesc="Versatile and expressive HTTP traffic mocking and testing made simple in Python"
url="https://github.com/h2non/pook"
license=('MIT')
arch=('any')
depends=('python-furl' 'python-jsonschema' 'python-xmltodict')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-nose' 'python-pytest' 'python-aiohttp' 'python-requests')
source=("https://github.com/h2non/pook/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('8ce9e430334b82bbd4f5105bf153d28029b28bb512fc42ccf91bb4af43d76a47ab82288dc4f476ee620b3ca5407a9ef384abb273affc07682eb425353f64d6a7')

build() {
  cd pook-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd pook-$pkgver
  pytest
}

package() {
  cd pook-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  # It's only present when tests are enabled, so adding -f
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir"/$site_packages/tests
}
