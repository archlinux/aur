# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
# Maintainer: Kyle Laker <kyle+aur@laker.email>
pkgname=python-readchar
pkgver=3.1.0
pkgrel=1
pkgdesc="Python library to read characters and key strokes"
arch=("any")
url="https://github.com/magmax/python-readchar"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/magmax/python-readchar/archive/v$pkgver.tar.gz"
        "LICENSE")
md5sums=('99b33910013ad441350e462b314a7cd9'
         '688183518094c78c59f08f1b74493a98')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"

    # Flake8 only required for tests
    sed -i '/flake8/d' setup.py
    # Fix the tests getting included in the package
    sed -i' ' -e's/"tests"/"tests*"/' setup.py
}

build() {
    cd "${srcdir}/$pkgname-$pkgver"

    GITHUB_REF="refs/tags/$pkgver" python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
