# Maintainer: Marco Cilloni <marco.cillon@zuru.com>

pkgbase=dicey
pkgname=('dicey' 'python-dicey')
pkgver=0.3.1
pkgrel=1
pkgdesc='Quick and dirty IPC library written in C'
arch=('x86_64' 'i686' 'aarch64')
url=https://github.com/zurutech/dicey
license=('APACHE')
makedepends=(
  'git'
  'cmake'
  'ninja'

  'python'
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  git+https://github.com/zurutech/dicey.git#tag=${pkgver}
)
b2sums=('SKIP')

build() {
  cmake \
    -S "${srcdir}/dicey" \
    --preset release 

  cmake --build "${srcdir}/dicey/build-rel"

  # Python
  cmake --install "${srcdir}/dicey/build-rel" --prefix "${srcdir}/dicey/bindings/python/dicey/deps"

  cd dicey/bindings/python

  python3 -m build --wheel --no-isolation
}

package_dicey() {
  depends=('gcc-libs' 'libxml2' 'libuv')
  provides=('libdicey.so')

  cmake --install "${srcdir}/dicey/build-rel" --prefix "${pkgdir}/usr"
  install -Dm 644 "${srcdir}/dicey/LICENSE" -t "${pkgdir}"/usr/share/licenses/$pkgname/
}

package_python-dicey() {
  pkgdesc='Python bindings for the Dicey IPC lib'
  depends=('dicey' 'python-inflection')

  python -m installer --destdir="$pkgdir" "${srcdir}/dicey/bindings/python/dist"/*.whl
  install -Dm644 "${srcdir}/dicey/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: ts=2 sw=2 et:
