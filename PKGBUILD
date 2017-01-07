# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

# The MATLAB engine does not support Py3.6 so we masquerade as Py3.3 (the only
# Py3 version supported by all engines so far, 2014b-2016b) during `setup.py`
# using the `sitecustomize` mechanism, and then during execution by patching
# `matlab/engine/__init__.py`.

pkgname=matlab-engine-for-python
pkgver=9.1
pkgrel=2
pkgdesc='MATLAB Engine API for Python'
arch=('any')
url='http://www.mathworks.com/help/matlab/matlab-engine-for-python.html'
license=('custom')
depends=('python') # and MATLAB >= 2014b.
makedepends=()
checkdepends=()
source=('sitecustomize.py')
sha512sums=('cdb6ccf8045e464bde011bdb3cda91ee21ddf9594327c49da1dbd9ecf7166fe783bae08c2e5b9bfb4f2273344ae35f45514ce2bb4f1b56cc7f2e35d123c21561')

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
    PYTHONPATH="$srcdir" python setup.py build --build-base="$srcdir" install --root="$srcdir" --optimize=1
    cd "$srcdir"
    mv usr/lib/python3.{3,6}
    egg_info="$(ls usr/lib/python3.6/site-packages/*-py3.3.egg-info)"
    mv "$egg_info" "${egg_info%-py3.3.egg-info}-py3.6.egg-info"
    sed -i 's/sys.version_info/(3, 3, 0)/' usr/lib/python3.6/site-packages/matlab/engine/__init__.py
}

package() {
    readarray -t pkgver_and_root <<<"$_pkgver_and_root"
    matlabroot="${pkgver_and_root[1]}"
    cp -r "$srcdir/usr" "$pkgdir"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "$matlabroot/license_agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
