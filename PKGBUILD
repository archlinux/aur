# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-vagrant
pkgver=1.1.0
pkgrel=3
pkgdesc="Python bindings for interacting with Vagrant virtual machines."
url="https://github.com/todddeluca/python-vagrant"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('vagrant')
source=(git+https://github.com/pycontribs/python-vagrant#tag=v$pkgver)
sha512sums=('60a18c56b658d08f36a4bba4a67ffc76a216671cfb311164076cb8cff696c371cc021d747f1904e6f7a428f5be364220ff4e9afc4dc13c6faae05c0f84a1759e')

prepare() {
  cd ${pkgbase}

  sed -e '/setuptools_scm_git_archive/d' -i pyproject.toml
}

build() {
  cd ${pkgbase}
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

# Disabled, because they need Vagrant. Systemd-nspawn doesn't support this.
#check() {
#  cd "${srcdir}/${pkgbase}-${pkgver}"
#  python setup.py test
#}

package() {
  cd ${pkgbase}

  python -m installer --destdir="${pkgdir}" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
