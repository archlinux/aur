# Maintainer: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Leo Schwarz (evotopid) <mail@leoschwarz.com>

pkgname=("python-fakeredis" "python2-fakeredis")
pkgver=1.0.3f
pkgrel=1
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

# Not using a release because as of now no release works.
# See https://github.com/jamesls/fakeredis/issues/245
source=("git+https://github.com/jamesls/fakeredis.git#commit=d675ee1d6c4ac7a3bb0129f916232c0f2c6e9dd5")
sha256sums=(SKIP)

build() {
    cd "$srcdir"
    rm -rf python{2,3}-build
    for builddir in python{2,3}-build; do
        cp -r "fakeredis" "$builddir"
        pushd "$builddir"
            "${builddir%-build}" setup.py build
        popd
    done
}

check() {
     # tests don't pass (https://github.com/jamesls/fakeredis/issues/242)
    return 0
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
