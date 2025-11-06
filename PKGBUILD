# Contributor: Luis Falcon <falcon at gnuhealth dot org>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mygnuhealth
_name=mygnuhealth
pkgver=2.2.1
pkgrel=1
pkgdesc="The GNU Health Personal Health Record (PHR)"
arch=('any')
url="https://www.gnuhealth.org"
license=('GPL3')
depends=('python' 'python-requests' 'python-bcrypt' 'python-kivy' 'python-pygal' 'python-tinydb' 'python-bleak' 'python-dateutil')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('69027a34c3a4659928b9d617bdb007de6cec9eced768d524c9a854061f496869')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
  # root installing the package via setup.py gives the wrong permissions to variants.db
  # we use this workaround until a definitive fix is found
  chmod 444 build/lib/mygnuhealth/data/variants.db
}

package() {
  cd "$_name-$pkgver"
  # install the actual package with the right permissions
  python -m installer --destdir="$pkgdir" dist/*.whl
}
