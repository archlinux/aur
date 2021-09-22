# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs
pkgname=python-calmjs
pkgver=3.4.1
pkgrel=4
pkgdesc="framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=('any')
url="https://github.com/calmjs/calmjs"
license=('GPL2')
depends=('python-calmjs.parse' 'python-calmjs.types' 'python-setuptools')
checkdepends=('npm' 'python-pytest' 'yarn')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha512sums=('3ac22ee03b0450141376ddcad1ac559e23fc15b7b496937a3b43c7334510ee1b6338b3a21c5ea875c908f4c8bb0c3657f18d83ac77cd9c76cc9f584a330316ca')
b2sums=('ed9d99ffbe7e5a1f8583791ae6a0680aa4a1ecdf74de8332a5fc1d6b8065d7318d0abb0cd8bd100594794e83ddf98cecde4de47ef9e8ae9b31a836a11c9f45e6')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  local test_dir="test_dir"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${test_dir}"
  # remove unnecessary tests:
  # https://github.com/calmjs/calmjs/issues/60
  find "${test_dir}" -type f -iname "*test_dist.py" -delete
  PATH="${test_dir}/usr/bin:${PATH}" PYTHONPATH="${test_dir}/${site_packages}:${PWD}:${PYTHONPATH}" python -Wignore -m unittest calmjs.tests.make_suite
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
