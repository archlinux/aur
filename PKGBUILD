# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-polychord
pkgver=1.22.2
pkgrel=2
pkgdesc="Next generation nested sampling (python library)"
arch=(any)
url="https://github.com/PolyChord/PolyChordLite"
groups=()
depends=(gcc-fortran openmpi)
license=('custom')
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/PolyChord/PolyChordLite/archive/${pkgver}.tar.gz")
sha256sums=('f7407a3ad24cba9f0f0fef41e1f3646d72d1c308355e20b21abc222c17cb3509')

prepare() {
    # setup.py invokes `make` with a whitelisted env that omits HOME; OpenMPI 5.x's
    # opal_init aborts ("Unable to get the user home directory") without it.
    cd "$srcdir/PolyChordLite-$pkgver"
    sed -i 's/\["CC", "CXX", "FC"\]/["CC", "CXX", "FC", "HOME"]/' setup.py
}

build() {
    cd "$srcdir/PolyChordLite-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PolyChordLite-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}

