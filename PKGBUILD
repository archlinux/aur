# Maintainer:  Tim Jester-Pfadt <t.jp at gmx.de>

pkgname=python-fuel-git
pkgver=497.732f35e
pkgrel=1
pkgdesc='A data pipeline framework for machine learning.'
arch=(x86_64)
url='https://github.com/mila-udem/fuel'
license=('MIT')
depends=('python' 'python-pyzmq' 'python-progressbar' 'python-h5py' 'python-pytables' 'python-pyyaml' 'python-picklable-itertools-git')
source=('git+https://github.com/mila-udem/fuel.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-fuel')

pkgver() {
	cd "$srcdir"/fuel
  	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  	cd fuel
  	python setup.py build
}

check() {
  	cd fuel
  	python setup.py test --verbose
}

package() {
  	cd fuel

  	# We don't need anything related to git in the package
  	rm -rf .git*

  	# script tries to force develop mode - force install mode by echoing install to the script
  	echo "install" | python setup.py install --root="${pkgdir}" --optimize=1

  	# Install License
  	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  	# Install Documentation
  	install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
