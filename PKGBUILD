# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko (OM2LT) <erik@brocko.eu>

pkgname=python-csdr-luarvique
pkgver=0.18.37
pkgrel=3
pkgdesc="Python bindings for the csdr library."
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/pycsdr"
license=('GPL-3.0-or-later')
depends=('python' 'gcc-libs' "csdr-luarvique>=$pkgver")
makedepends=('git' 'python-setuptools')
conflicts=('python-csdr')
provides=('python-csdr')
source=("$pkgname"::"git+https://github.com/luarvique/pycsdr#tag=${pkgver}"
        "fix-gcc16-designated-initializers.patch")
md5sums=('bfbd199d68fd2e16ce167a326e8e54b7'
         '59ad728f657e435ecfd31b2c247f4995')

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 -i "$srcdir/fix-gcc16-designated-initializers.patch"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build -b ../build -t ../build-tmp
}

package() {
    cd "$srcdir/$pkgname"
    # Sadly, setuptools still don't support separate build directory: https://github.com/pypa/setuptools/issues/1347
    python setup.py build -b ../build -t ../build-tmp install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1
}
