#Maintainer: louson

_name=yocto-cooker
pkgname=python-yocto-cooker-git
pkgver=1.4.0.r0.g1fc0160
pkgrel=1
url="https://github.com/cpb-/yocto-cooker"
pkgdesc="yocto-cooker is a easy yocto manager."
arch=(any)
depends=(python python-jsonschema python-urllib3 python-pyjson5)
makedepends=(git python-setuptools)
checkdepends=(cmake)
provides=(python-yocto-cooker)
conflicts=(python-yocto-cooker)

source=("${pkgname}::git+https://github.com/cpb-/yocto-cooker.git")
md5sums=('SKIP')
license=('GPL2')

pkgver() {
  cd "$srcdir/$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/$pkgname"
    install -Dm644 sample-menus/* "$pkgdir/usr/share/$pkgname"
}

check() {
    mkdir "tests" && cd tests
    cmake "$srcdir/$pkgname/test/"
    make
    ctest
}
