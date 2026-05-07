# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=mistune
pkgname=python-mistune1
pkgver=0.8.4
pkgrel=4
pkgdesc="A fast yet powerful Python Markdown parser with renderers and plugins"
arch=('any')
url="https://github.com/lepture/mistune"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
conflicts=('python-mistune')
provides=("python-mistune=${pkgver}")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('36c3ef5d5537f5cceaa43e4da20a84b27c378cb744a93f0380024faefde490bcb42c453f79002ca049083fc437278f4afb3e10de5462f9eeb9077ca2a2fcaea7')
b2sums=('e65d45c5c95706a49a7fd407afe5f10e82a475766ca272ec3bebba8c89e670fe6efced7b09537efb69d3fd36e75091e370170a15ad7488b5cbe9186e2ccaf4db')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  #Patch from Yield tests to Parametrized because of modern python
  patch --forward --strip=1 --input="../parametrized_test.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
