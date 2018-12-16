# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Jameson Pugh <imntreal at gmail dot com>

pkgname=python-pocketsphinx-git
pkgbase=python-pocketsphinx-git
pkgname=('python-pocketsphinx-git' 'python2-pocketsphinx-git' 'sphinxbase-git' 'pocketsphinx-git')
pkgver=r185.769492d
pkgrel=2
pkgdesc='Python interface to CMU SphinxBase and PocketSphinx libraries'
arch=('i686' 'x86_64')
url='https://github.com/bambocher/pocketsphinx-python'
license=('BSD')
depends=('python' 'swig')
makedepends=('git' 'python' 'python2')
# The Python bindings to pocketsphinx are made by bambocher. Dependencies are
# stored as git submodules and are maintained by the CMU Sphinx project.
source=(
    'python-pocketsphinx::git+https://github.com/bambocher/pocketsphinx-python.git'
    'pocketsphinx::git+https://github.com/cmusphinx/pocketsphinx.git'
    'sphinxbase::git+https://github.com/cmusphinx/sphinxbase.git'
)
sha512sums=('SKIP' 'SKIP' 'SKIP')
_gitname='python-pocketsphinx'

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"

    git submodule init
    git config submodule.deps/pocketsphinx.url ${srcdir}/pocketsphinx
    git config submodule.deps/sphinxbase.url ${srcdir}/sphinxbase
    git submodule update

    # We want a python2 package as well. Let's copy the sources.
    cd "${srcdir}"
    cp -rf "${_gitname}" python2-pocketsphinx-git
}

build() {
    cd "${srcdir}/${_gitname}/deps/sphinxbase"
    ./autogen.sh --prefix=/usr
    make

    cd "${srcdir}/${_gitname}/deps/pocketsphinx"
    ./autogen.sh --prefix=/usr
    make

    cd "${srcdir}/${_gitname}"
    python setup.py build

    export PYTHON=/usr/bin/python2

    cd "${srcdir}/python2-pocketsphinx-git/deps/sphinxbase"
    ./autogen.sh --prefix=/usr --libdir=/garbage --bindir=/garbage --includedir=/garbage --datarootdir=/garbage
    make

    cd "${srcdir}/python2-pocketsphinx-git/deps/pocketsphinx"
    ./autogen.sh --prefix=/usr --libdir=/garbage --bindir=/garbage --includedir=/garbage --datarootdir=/garbage
    make

    cd "${srcdir}/python2-pocketsphinx-git"
    python2 setup.py build
}

package_sphinxbase-git() {
    provides=('sphinxbase')
    conflicts=('sphinxbase')

    cd "${srcdir}/${_gitname}/deps/sphinxbase"
    export PYTHON=/usr/bin/python
    make DESTDIR="${pkgdir}/" install

    pythonVersion="$(python -c 'import sys; print(str(sys.version_info.major) + "." + str(sys.version_info.minor))')"
    rm -f "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/sphinxbase/__init__.py"
    rm -f "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/sphinxbase/sphinxbase.py"
    rm -rf "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/sphinxbase/__pycache__"
}

package_pocketsphinx-git() {
    provides=('pocketsphinx')
    conflicts=('procketsphinx')
    depends=('sphinxbase')

    # Pocketsphinx needs libpocketsphinx which is located in the other package
    # (sphinxbase). Copy the libs temporarily just to allow linking. Then
    # remove them.
    mkdir -p "${pkgdir}/usr/lib"
    cd "${pkgdir}/../sphinxbase-git"
    files=""
    for i in usr/lib/*.so*; do
        files+="$i "
        cp "$i" "${pkgdir}/usr/lib"
    done

    cd "${srcdir}/${_gitname}/deps/pocketsphinx"
    export PYTHON=/usr/bin/python
    make DESTDIR="${pkgdir}/" install

    for i in $files; do
        rm "${pkgdir}/$i"
    done
    pythonVersion="$(python -c 'import sys; print(str(sys.version_info.major) + "." + str(sys.version_info.minor))')"
    rm -rf "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/sphinxbase"
    rm -f "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/pocketsphinx/__init__.py"
    rm -f "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/pocketsphinx/pocketsphinx.py"
    rm -rf "${pkgdir}/usr/lib/python${pythonVersion}/site-packages/pocketsphinx/__pycache__"
}

package_python-pocketsphinx-git() {
    cd "${srcdir}/${_gitname}"

    export PYTHON=/usr/bin/python
    python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-pocketsphinx-git() {
    export PYTHON=/usr/bin/python2

    cd "${srcdir}/python2-pocketsphinx-git/deps/sphinxbase"
    make DESTDIR="${pkgdir}/" install

    cd "${srcdir}/python2-pocketsphinx-git/deps/pocketsphinx"
    make DESTDIR="${pkgdir}/" install

    cd "${srcdir}/python2-pocketsphinx-git"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    rm -rf "${pkgdir}/garbage"
}
