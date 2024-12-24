# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Contributer: Coelacanthus <coelacanthus@outlook.com>

pkgname=python-pystun3
_pkgname="${pkgname##python-}"
pkgver=2.0.0
pkgrel=2
pkgdesc='A Python STUN client for getting NAT type and external IP '
arch=('any')
license=('MIT')
url='https://github.com/talkiq/pystun3'
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
# upstream does not tag the commit, so use commit hash instead
_commit=5fdc6fa446924b575250acf853a8f7eea0c8b8c9
source=("$_pkgname-$_commit.tar.gz::https://github.com/talkiq/pystun3/archive/$_commit.tar.gz")
sha512sums=('dd1100d7836ac93731a6e70c352b37e28b61225c67d43fad12beeae193baf10e040b2c7e3161b248935a210078885336f2e9605a1b8981d6b2cfec3e94a87513')

prepare() {
	cd "$_pkgname-$_commit"
	# https://wiki.archlinux.org/title/Python_package_guidelines#Test_directory_in_site-package
	sed -i 's/find_packages()/find_packages(exclude=("tests",))/' setup.py
}

build() {
	cd "$_pkgname-$_commit"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$_commit"
	pytest
}

package() {
	cd "$_pkgname-$_commit"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$site_packages/$_pkgname-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
