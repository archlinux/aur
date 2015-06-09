# Maintainer: Yunhui Fu <yhfudev@gmail.com>
# Contributor: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

_pkgbase="protobuf3-git"
pkgname=('protobuf3-git' 'python2-protobuf3-git' 'python-protobuf3-git')
pkgver=802e184
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
makedepends=('unzip' 'python-setuptools' 'python2-setuptools')
#conflicts=('protobuf' 'python2-protobuf' 'python-protobuf' 'protobuf3' 'python2-protobuf3' 'python-protobuf3')

source=("${_pkgbase}::git+https://github.com/google/protobuf.git")
md5sums=('SKIP')

pkgver_git() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(git show | grep commit | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver_svn() {
    cd "${srcdir}/${_pkgbase}"
    local ver="$(svn info | grep Revision | awk '{print $2}' )"
    #printf "r%s" "${ver//[[:alpha:]]}"
    echo ${ver:0:7}
}

pkgver() {
    pkgver_git
}

build() {
    cd "${srcdir}/${_pkgbase}"
    ./autogen.sh
    ./configure --prefix=/usr
    make $MAKEFLAGS

    rm -rf python3
    cp -r python python3
    find python3 -name '*.py' -exec 2to3 --write --nobackups '{}' '+'
}

check() {
    make -C "${srcdir}/${_pkgbase}" check
}

package_protobuf3-git() {
    conflicts=('protobuf' 'protobuf-cpp' 'protobuf3')
    provides=('protobuf' 'protobuf-cpp')
    replaces=('protobuf-cpp')

    cd "${srcdir}/${_pkgbase}"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 editors/protobuf-mode.el \
        "$pkgdir"/usr/share/emacs/site-lisp/protobuf-mode.el
}

package_python2-protobuf3-git() {
    pkgdesc='Python 2 bindings for Google Protocol Buffers'
    depends=('python2' "protobuf3=${pkgver}")
    conflicts=('python2-protobuf')
    provides=('python2-protobuf-git')

    cd "${srcdir}/${_pkgbase}/python"
    python2 setup.py install --prefix=/usr --root="$pkgdir"

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-protobuf3-git() {
    pkgdesc='Python 3 bindings for Google Protocol Buffers'
    depends=('python' "protobuf3=${pkgver}")
    conflicts=('python-protobuf')
    provides=('python-protobuf-git')

        cd "${srcdir}/${_pkgbase}/python3"
    python3 setup.py install --prefix=/usr --root="$pkgdir"

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /usr/share/licenses/$_pkgbase/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
