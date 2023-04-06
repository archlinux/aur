# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-vagrant
pkgver=1.0.0
pkgrel=3
pkgdesc="Python bindings for interacting with Vagrant virtual machines."
url="https://github.com/todddeluca/python-vagrant"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('vagrant')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('a90e8c10122f0119088f96b75dfc353b067273cf1dc05a2eb5dc60f8154656d6b2e0f91c941936dd482faf82ea3e00ea8492b76ff7ffab78d3a20e534a019fe9')

prepare() {
  cd ${pkgbase}-${pkgver}

  sed -e '/setuptools_scm_git_archive/d' -i pyproject.toml
}

build() {
  cd ${pkgbase}-${pkgver}
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

# Disabled, because they need Vagrant. Systemd-nspawn doesn't support this.
#check() {
#  cd "${srcdir}/${pkgbase}-${pkgver}"
#  python setup.py test
#}

package() {
  cd ${pkgbase}-${pkgver}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
