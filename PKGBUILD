# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyfastani
pkgname=python-${_name}
pkgver=0.5.1
pkgrel=1
pkgdesc="Cython bindings and Python interface to FastANI, a method for fast whole-genome similarity estimation"
url="https://github.com/althonos/${_name}"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=("MIT")
groups=()
makedepends=('python-setuptools' 'cython' 'python-build' 'python-installer')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=(ad6c28303290a2389c29ed20db8266bbc4bf89a5b1bf64a7514d1bc9c6ba2d92)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local impl=$(python -c 'import platform; print(platform.python_implementation().lower())')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${impl}-${pyver}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
