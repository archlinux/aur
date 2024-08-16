# Maintainer: weilinfox <caiweilin at iscas.ac.cn>

_pkgname=xingque
pkgname=python-xingque
pkgver=0.2.0
pkgrel=1
pkgdesc="Yet another Python binding to starlark-rust, exposing the Starlark language to your Python projects."
arch=('x86_64')
url="https://github.com/xen0n/xingque"
license=(Apache-2.0)
depends=('python>=3.8')
makedepends=(maturin)
checkdepends=(python-pytest)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/xen0n/xingque/archive/${pkgver}.tar.gz")
sha256sums=('ba5768f62122ad2ce0abe85d2db7782f03a94da67bd71f576ce6362022e9d2d2')
sha512sums=('866593df8a05e32f7ebe42362dbd3baac4cf1e0a55379a8e0ab96c1c14b366409d0cc30cb8872c8f67f392b4676a20ce649dc5c92f1d115406a31a06c3094724')

build() {
  cd "$_pkgname-$pkgver"

  maturin build --release --strip
}

check() {
  cd "$_pkgname-$pkgver"

  python -m venv test_venv --system-site-packages
  test_venv/bin/pip install target/wheels/xingque-*.whl
  test_venv/bin/python -m pytest -v
}

package() {
  cd "$_pkgname-$pkgver"

  test_venv/bin/pip install --isolated --no-deps --prefix="$pkgdir" --ignore-installed target/wheels/xingque-*.whl

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 {CHANGELOG,README}.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
