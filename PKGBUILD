# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=matlab-engine-for-python
pkgver=9.1
pkgrel=1
pkgdesc='MATLAB Engine API for Python'
arch=('any')
url='http://www.mathworks.com/help/matlab/matlab-engine-for-python.html'
license=('custom')
depends=('python') # and MATLAB >= 2016b.
makedepends=()
checkdepends=()
source=()
sha256sums=()

# Run MATLAB only once, as its startup is slow.
_pkgver_and_root=$(\
    matlab -nosplash -nodesktop \
        -r "v = ver('MATLAB'); fprintf([v.Version, '\n', matlabroot, '\n']); quit" \
    | tail -3 | head -2)

pkgver() {
    readarray -t pkgver_and_root <<<"$_pkgver_and_root"
    echo "${pkgver_and_root[0]}"
}

# We need to run `setup.py` in `build()` as it can only be run from its original folder.

build() {
    readarray -t pkgver_and_root <<<"$_pkgver_and_root"
    matlabroot="${pkgver_and_root[1]}"
    cd "$matlabroot/extern/engines/python" 
    python setup.py build --build-base="$srcdir" install --root="$srcdir" --optimize=1
}

package() {
    readarray -t pkgver_and_root <<<"$_pkgver_and_root"
    matlabroot="${pkgver_and_root[1]}"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "$matlabroot/license_agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
