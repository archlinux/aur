# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groovy
pkgname=python-${_name}
pkgver=0.1.2
pkgrel=1
pkgdesc='A small Python library created to help developers protect their applications from Server Side Request Forgery (SSRF) attacks.'
arch=(any)
url='https://github.com/gradio-app/groovy'
license=('Apache-2.0')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('25c1dc09b3f9d7e292458aa762c6beb96ea037071bf5e917fc81fb78d2231083')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
chechdepends=('python-pytest')

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -U gradio # Prevent cercular dependencies
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
