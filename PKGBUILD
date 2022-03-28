# Contributor: Patrick Mischke

_name=h5pyViewer
pkgname=h5pyviewer-python3
pkgver=r59.3c7728a
pkgrel=1
pkgdesc='Classes and tools to view *.hdf5-Files, using an experimantal python3 port'
url="https://github.com/kubaello/$_name"
depends=('python' 'python-h5py' 'python-numpy' 'python-matplotlib' 'python-wxpython')
optdepends=('python-glumpy: Image support')
license=('BSD')
conflicts=(h5pyViewer)
provides=(h5pyViewer)
arch=('any')
source=("git+https://github.com/kubaello/h5pyViewer" "$_name.desktop")
md5sums=('SKIP' '3be07481951e4a264ae9af04b001616c')

pkgver() {
  cd "${_pkg}$_name"
  printf "r%s.%s" "$(git rev-list HEAD --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "${_pkg}$_name"
    python setup.py build
    sed -i 's:h5o\.open(hid:h5o\.open(bytes(hid):g' $_name/*.py
    sed -i 's:+aid\.name+:+str(aid\.name)+:g' $_name/*.py
    sed -i 's:HdfImageGLFrame:HdfImageFrame:g' $_name/*.py
    sed -i 's:self.colIndex = :self.colIndex = 0#":g' $_name/*.py
    sed -i 's:colBar\.set_cmap:#colBar\.set_cmap":g' $_name/*.py
    sed -i 's:ds\.value:ds\[()\]:g' $_name/*.py
    sed -i 's:h5py\._hl\.dataset\.readtime_dtype:aid\.dtype#:g' $_name/*.py
}


package() {
    cd "${_pkg}$_name"

    install -d "$pkgdir/usr/bin"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"

    for link in "$pkgdir/usr/bin/"*; do
        local abs_target="$(readlink "$link")"
        local rel_target="$(realpath --relative-to="$pkgdir" "$abs_target")"
        ln -sfT "/$rel_target" "$link"
    done
}
