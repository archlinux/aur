# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyfastani
pkgname=python-${_name}
pkgver=0.3.1
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
sha256sums=(4e07d52017183ab58f78df881f82be5e18ca720153f12566eab5224cfbdd8637)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
    local machine=$(python -c 'import platform; print(platform.machine())')
    cd "${srcdir}/${_name}-${pkgver}/build/lib.linux-${machine}-${pyver}"
    python -m unittest ${_name}.tests
}

package() {
    local abitag=$(python -c 'import sys; print(*sys.version_info[:2], sep="")')
    local machine=$(python -c 'import platform; print(platform.machine())')
    python -m installer --destdir="$pkgdir" "${srcdir}/${_name}-${pkgver}/dist/${_name}-${pkgver}-cp${abitag}-cp${abitag}-linux_${machine}.whl"
    install -Dm644  ${srcdir}/${_name}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
