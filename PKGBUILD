pkgname=python-briar-wrapper-git
_pkgname=python-briar-wrapper
conflicts=('python-briar-wrapper')
pkgver=0.0.7.r1.gf188420
pkgrel=2
pkgdesc='A wrapper for the Briar headless API.'
arch=('any')
url='https://code.briarproject.org/briar/python-briar-wrapper'
license=('GNU Affero GPL')
makedepends=('python-setuptools' 'git' 'python-flit' 'python-toml')
depends=('python' 'python-websockets' 'python-requests' 'briar-headless-git')
source=("git+https://code.briarproject.org/briar/python-briar-wrapper.git"
        'address_error.patch')
sha256sums=('SKIP'
            'dff2e1645420e76c543065d3bedcfe17fc4669bb01627f6ba43a66c225b52f18')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

prepare() {
  cd "${_pkgname}"
  python -m flit build --setup-py

  tar -xvf dist/*.tar.gz --wildcards --no-anchored '*/setup.py' --strip=1

  # fix uncaught OSError / 'Cannot assign requested address' while waiting for briar-headless to come up
  patch -Np1 -i ../address_error.patch
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
