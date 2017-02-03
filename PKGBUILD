_name=h5pyViewer
pkgname=h5pyviewer
pkgver=0.0.1.6
pkgrel=1
pkgdesc='Classes and tools to view *.hdf5-Files'
url="https://github.com/ganymede42/$_name"
depends=('python2' 'python2-h5py' 'python2-numpy' 'python2-matplotlib' 'wxpython')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz" "$_name.desktop")
md5sums=('da47fcfe8e05764abae49a174b6c8621'
         '3be07481951e4a264ae9af04b001616c')

build() {
    cd "$srcdir/$_name-$pkgver"

    python2 setup.py build

    sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:' $_name/*.py
}


package() {
    cd "$srcdir/$_name-$pkgver"

    install -d "$pkgdir/usr/bin"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"

    for link in "$pkgdir/usr/bin/"*; do
        local abs_target="$(readlink "$link")"
        local rel_target="$(realpath --relative-to="$pkgdir" "$abs_target")"
        ln -sfT "/$rel_target" "$link"
    done
}
