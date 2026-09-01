# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Jonathan Wright <jon@than.io>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=jenkins_job_builder
pkgname="python-jenkins-job-builder"
pkgver=6.5.0
pkgrel=2
pkgdesc='Takes simple descriptions of Jenkins jobs in YAML or JSON format and uses them to configure Jenkins'
url='https://jenkins-job-builder.readthedocs.io/en/latest/'
license=('Apache-2.0')
arch=('any')
makedepends=('python-setuptools')
depends=(
  'python-six>=1.9.0'
  'python-yaml>=3.13'
  'python-pbr>=1.8'
  'python-stevedore>=1.17.1'
  'python-python-jenkins>=1.8.2'
  'python-fasteners'
  'python-jinja>=2')
source=("https://files.pythonhosted.org/packages/af/c9/b2fa858f3825c0347a201d0e542c0235605167fcb61b161648585b5ab248/${_pkgname}-${pkgver}.tar.gz"
        'pkg_resources-removal.patch')
sha256sums=('f44ded591f68969019ae5a21fddc6c233b73d8f2497d126b3d4cccbe9b8b149d'
            '56176b0d6a97810969593832dfa010cbf600a1aa136273eed87776faf6befcb7')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # setuptools >= 82 dropped pkg_resources; jjb still used it directly for
  # entry point discovery, so port those bits to importlib.metadata instead.
  patch -Np1 -i "${srcdir}/pkg_resources-removal.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
