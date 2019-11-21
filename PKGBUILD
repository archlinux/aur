# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

_pkg=locust
pkgname="python-$_pkg-git"
pkgver=0.13.2.r6.g989fa24
pkgrel=1
pkgdesc="Scalable user load testing tool written in Python"
arch=('any')
url="https://github.com/locustio/$_pkg"
license=('MIT')
depends=('python-flask'
         'python-gevent'
		 'python-geventhttpclient-wheels'
         'python-msgpack'
         'python-pyzmq'
		 'python-requests'
         'python-six')
makedepends=('git'
             'python-setuptools')
provides=("python-$_pkg")
conflicts=("python-$_pkg")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname" || exit
	local _ver
	_ver="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	printf '%s\n' "${_ver#v}"
}


build() {
	cd "$pkgname" || exit
    sed -i 's/msgpack-python/msgpack/' setup.py
    sed -i 's/        "\([[:alpha:]-]*\).=.*"/        "\1"/' setup.py
    python setup.py build
}

package() {
	cd "$pkgname" || exit
    python setup.py install --skip-build --root="$pkgdir"/ --optimize=1
}
