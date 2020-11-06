# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=python-gilt
pkgver=1.2.2
pkgrel=2
pkgdesc="A GIT layering tool"
arch=('any')
url="https://github.com/retr0h/gilt"
license=('MIT')
depends=('python-click' 'python-colorama' 'python-fasteners'
'python-git-url-parse' 'python-pbr' 'python-yaml' 'python-sh')
makedepends=('python-setuptools')
checkdepends=('git' 'python-pytest' 'python-pytest-cov'
'python-pytest-helpers-namespace' 'python-pytest-mock' 'python-requests'
'yapf')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-1.2.1-ls_path.patch")
sha512sums=('34ac5d5ef5a8bc052fa41ac464b7dd4efa15f323ea5c95a6c280ab39a99ac0335707ef98449436122715cc2b44682100989dd31253e96395a087d5d1db3a7c7b'
            '8b0090f7374499b603bf383ea48f313f5baa7a8215f504c87350432873da557af07204c7f948aab4c05033c11ce10f2137f1912be6db5d6887b3d8a7c3f0dcbb')

prepare() {
  cd "$pkgname-$pkgver"
  # fixing issues with hardcoded paths
  # https://github.com/retr0h/gilt/issues/76
  patch -Np1 -i "../${pkgname}-1.2.1-ls_path.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {AUTHORS,CHANGELOG,CONTRIBUTING,README}.rst -t \
    "${pkgdir}/usr/share/doc/${pkgname}"
}
