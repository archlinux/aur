# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

# We masquerade as the newest supported Python version during `setup.py`
# using the `sitecustomize` mechanism, and then during execution by patching
# `matlab/engine/__init__.py`.

# This script can also be used independently of `makepkg`: run
#     bash -c 'source PKGBUILD && build'
# and copy the contents of the created, temporary site-packages to your main
# site-packages.

pkgname=matlab-engine-for-python
pkgver=9.4
pkgrel=1
pkgdesc='MATLAB Engine API for Python'
arch=('any')
url='http://www.mathworks.com/help/matlab/matlab-engine-for-python.html'
license=('custom')
depends=('python') # and MATLAB >= 2014b.
makedepends=()
checkdepends=()

# Run MATLAB only once, as its startup is slow.
{ read _pkgver; read _matlabroot; } < <( \
    matlab -nosplash -nodesktop \
        -r "v = ver('MATLAB'); fprintf([v.Version, '\n', matlabroot, '\n']); quit" \
        2>/dev/null |
    tail -3 | head -2)
_prefix="$(python -c 'import sys; print(sys.prefix)')"

pkgver() {
    echo "$_pkgver"
}

# We need to run `setup.py` in `build()` as it can only be run from its original folder.

build() {
    [[ -d "$srcdir" ]] || srcdir="$(mktemp -d)"
    cd "$_matlabroot/extern/engines/python"
    local py_minor mat_minor
    py_minor="$(python -c 'import sys; print(sys.version_info.minor)')"
    mat_minor="$(find . -name 'matlabengineforpython*.so' |
                 sort | grep -Po '(?<=\d_)\d' | tail -1)"
    cat <<EOF >"$srcdir/sitecustomize.py"
import sys
sys.version_info = (3, $mat_minor, 0)
EOF
    PYTHONPATH="$srcdir" python setup.py \
        build --build-base="$srcdir" install --root="$srcdir" --optimize=1
    if [[ "$py_minor" != "$mat_minor" ]]; then
        mv "$srcdir/$_prefix/lib/python3".{"$mat_minor","$py_minor"}
        local egg_info
        egg_info="$(\
            ls "$_prefix/lib/python3.$py_minor/site-packages/"*"-py3.$mat_minor.egg-info")"
        mv "$egg_info" "${egg_info%-py3."$mat_minor".egg-info}-py3.$py_minor.egg-info"
        sed -i "s/sys.version_info/(3, $mat_minor, 0)/" \
            "$_prefix/lib/python3.$py_minor/site-packages/matlab/engine/__init__.py"
    fi
}

package() {
    cp -r "$srcdir/$_prefix" "$pkgdir"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "$_matlabroot/license_agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
