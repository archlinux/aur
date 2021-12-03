# Maintainer: David Runge <dvzrv@archlinux.org>

_name=calmjs
pkgname=python-calmjs
pkgver=3.4.2
pkgrel=3
pkgdesc="framework for building toolchains and utilities for working with the JavaScript/Node.js ecosystem"
arch=('any')
url="https://github.com/calmjs/calmjs"
license=('GPL2')
depends=('python-calmjs.parse' 'python-calmjs.types' 'python-setuptools')
checkdepends=('npm' 'python-pytest' 'yarn')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
sha512sums=('7730a392acb511227fc455774557ed74286aeea71d94f3fe53588dd5119d9bd90c43a49999a324d83dda8ed0d1282d4d2d9b0263b4ad5b853ea8669a87a68919')
b2sums=('436d85e40882902f9c0b4efe338124eff6a401e46d187a554d1d3b7621929f2e682a662d1beb8bc3b8d404d96dbf857d92f4b8daacbb30fe072debf3d0ca7416')

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
