# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyopal
pkgname=python-${_name}
pkgver=0.4.0
pkgrel=2
pkgdesc="Cython bindings and Python interface to Opal, a SIMD-accelerated database search aligner."
url="https://github.com/althonos/pyopal"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(16f6a41dc245a4d356c54586d5ede874fe19dc66f52d01b5062383da7da44f20)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local impl=$(python -c 'import sys; print(sys.implementation.name)')
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${impl}-${abitag}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
