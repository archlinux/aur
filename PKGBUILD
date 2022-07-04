# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Jameson Pugh <imntreal at gmail dot com>

pkgname=pocketsphinx-cmusphinx-git
pkgbase=pocketsphinx-cmusphinx-git
pkgname=('python-pocketsphinx-cmusphinx-git' 'pocketsphinx-cmusphinx-git')
pkgver=r1675.be606cd
pkgrel=2
pkgdesc='CMU open source large vocabulary, speaker-independent continuous speech recognition engine. Python included'
arch=('i386' 'i686' 'pentium4' 'core2' 'x86_64')
url='https://github.com/cmusphinx/pocketsphinx'
license=('CMU')
depends=('python' 'swig' 'python-setuptools' 'python2-setuptools')
makedepends=('git' 'python' 'python2' 'bison' 'python-cmake-build-extension')

source=(
    'git+https://github.com/cmusphinx/pocketsphinx'
)
sha512sums=('SKIP')
_gitname='pocketsphinx'

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}"

    # We want a python2 package as well. Let's copy the sources.
    cd "${srcdir}"
    cp -rf "${_gitname}" python2-pocketsphinx-git
}

build() {
    cd "pocketsphinx"
    cmake \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
   cmake --build build --verbose

    python setup.py build
}

package_pocketsphinx-cmusphinx-git() {
    provides=('pocketsphinx' 'pocketsphinx-git')
    conflicts=('pocketsphinx' 'pocketsphinx-git')

    cd "${srcdir}/${_gitname}"
    DESTDIR="${pkgdir}" cmake --install build
    cp "$pkgdir"/usr/include/pocketsphinx.h $pkgdir/usr/include/pocketsphinx
    cp build/include/sphinxbase/sphinx_config.h  "$pkgdir"/usr/include/sphinxbase
#    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

package_python-pocketsphinx-cmusphinx-git() {
    provides=('python-pocketsphinx' 'python-pocketsphinx-git' 'python3-pocketsphinx' 'python3-pocketsphinx-git')
    conflicts=('python-pocketsphinx' 'python-pocketsphinx-git' 'python3-pocketsphinx' 'python3-pocketsphinx-git')
    depends=('pocketsphinx')

    cd "${srcdir}/${_gitname}"

    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    #install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

