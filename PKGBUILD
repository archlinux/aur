# $Id$
# Maintainer: Fabien Devaux <fdev31 at gmail dot com>

_py=python
_gitname="aury"

pkgname=$_gitname-git
pkgver=20120125
pkgrel=2
pkgdesc="Automates maintenance of AUR python packages"
arch=('any')
url="https://github.com/fdev31/aury.git"
license=('MIT')
depends=($_py "$_py-lxml" "$_py-cssselect" "pkgbuild-introspection" "burp")
makedepends=($_py "git")
conflicts=("$_py-$_gitname")

_gitroot="git://github.com/fdev31/$_gitname.git"

package() {
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

    $_py setup.py build || exit 1
    $_py setup.py install --root="${pkgdir}" --optimize=1

    rm -rf ${_gitname}-build
}

