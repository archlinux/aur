# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=1.8.2
pkgrel=4
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server"
url='https://opendev.org/jjb/python-jenkins/'
license=('BSD-3-Clause')
arch=('any')
depends=(
  'python-six>=1.3.0'
  'python-pbr>=0.8.2'
  'python-multi_key_dict'
  'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=(
  'python-mock'
  'python-testscenarios'
  'python-multiprocess'
  'python-requests-mock'
)
optdepends=('python-requests-kerberos: Kerberos authentication support')
source=("$_pkgname-$pkgver.tar.gz::https://opendev.org/jjb/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('da0da245b7df2a08d1f9d715682abc95d3e5baa514223ad6a39b8e6cd93c9c58b819d01c8a040c989e073bcd2e9815cf6cab5d3999a4a71b24316486b701afc8')

prepare() {
  cd "$_pkgname"
  # see https://review.opendev.org/c/jjb/python-jenkins/+/928313
  sed -i "s/VersionInfo('jenkins')/VersionInfo('python-jenkins')/" jenkins/version.py
}

build() {
  export PBR_VERSION="$pkgver"

  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  python -m unittest
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
