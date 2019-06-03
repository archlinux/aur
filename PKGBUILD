# Maintainer: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Leo Schwarz (evotopid) <mail@leoschwarz.com>

pkgname=("python-fakeredis" "python2-fakeredis")
pkgver=1.0.3
pkgrel=2
pkgdesc="Fake implementation of redis API (redis-py) for testing purposes"
arch=("any")
url="https://github.com/jamesls/fakeredis"
license=("BSD")
checkdepends=(
    "python-nose" "python2-nose"
    "python-lupa" "python2-lupa"
    "python-hypothesis" "python2-hypothesis"
)
options=(!emptydirs)
source=("https://github.com/jamesls/fakeredis/archive/$pkgver.tar.gz")
sha256sums=("4d5a501a39c321acfdb9e41c9a66851852caa6f3ed4d1c7de8ea2bf17ef6e457")

build() {
    cd "$srcdir"
    rm -rf python{2,3}-build
    for builddir in python{2,3}-build; do
        cp -r "fakeredis-$pkgver" "$builddir"
        pushd "$builddir"
            "${builddir%-build}" setup.py build
        popd
    done
}

check() {
  cd "$srcdir/python3-build"
  python3 setup.py test
  cd "$srcdir/python2-build"
  python2 setup.py test
}

package_python-fakeredis() {
    depends=("python" "python-redis" "python-sortedcontainers")
    optdepends=("python-lupa: Lua scripts")
    cd "$srcdir/python3-build"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-fakeredis() {
    depends=("python" "python2-redis")
    optdepends=("python2-lupa: Lua scripts")
    cd "$srcdir/python2-build"
    python2 setup.py install --root="$pkgdir" -O1
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
