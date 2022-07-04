# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>

_pkgname=polyfile
pkgname="${_pkgname}-git"
pkgver=0.4.2.r0.g1ab8d7c
pkgrel=1
pkgdesc="A utility to identify and map the semantic structure of files, including polyglots, chimeras, and schizophrenic files."
arch=('any')
url=https://github.com/trailofbits/polyfile
license=('LGPLv3')
depends=('python' 'python-graphviz' 'python-intervaltree' 'python-jinja'
         'python-kaitaistruct>=0.7' 'python-networkx' 'python-pdfminer'
         'python-pillow>=5.0.0' 'python-yaml>=3.13' 'python-cint-git')
makedepends=('git' 'python-setuptools')
conflicts=('polyfile')
source=("git+https://github.com/trailofbits/${_pkgname}.git#tag=v0.4.2"
        "git+https://github.com/kaitai-io/kaitai_struct_formats.git"
        "git+https://github.com/file/file.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    git submodule init
    git config submodule.kaitai_struct_formats.url "$srcdir/kaitai_struct_formats"
    git config submodule.file.url "$srcdir/file"
    git submodule update
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=4:sw=4:et:
