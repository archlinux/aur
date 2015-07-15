# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>
pkgname=python2-behave-git
pkgver=20111208
pkgrel=1
pkgdesc="BDD, Python style."
arch=('any')
url="http://pypi.python.org/pypi/behave"
license=('MIT')
depends=('python2' 'python2-distribute' 'python2-parse>=1.3.1')
makedepends=('git')
provides=('behave')
conflicts=('python2-behave')

_gitroot="git://github.com/jeamland/behave.git"
_gitname="behave"

build() {
    cd $srcdir

    msg "Connecting to GIT server..."
    if [[ -d ${_gitname} ]]; then
        (cd ${_gitname} && git pull origin)
    else
        git clone --depth=1 ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf ${_gitname}-build
    cp -r ${_gitname} ${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    rm -fr test
    python2 setup.py build || exit 1
    python2 setup.py install --root="${pkgdir}" --optimize=1

    rm -rf ${_gitname}-build
}

