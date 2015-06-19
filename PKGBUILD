# Maintainer: Nick Østergaar <oe.nick at gmail dot com>
# Contributor: Moritz Heidkamp <moritz@twoticketsplease.de>
# Contributor: Sebastian Sauer <info@dynpages.de>

pkgname=couchapp-git
pkgver=20140302
pkgrel=1
pkgdesc="A set of helpers and a jQuery plugin that conspire to get you up and running on CouchDB quickly and correctly."
arch=('i686' 'x86_64')
url="http://github.com/couchapp/couchapp/"
license=('APACHE')
depends=('python2' 'python2-restkit' 'python2-watchdog')
makedepends=('git' 'setuptools')
provides=(couchapp)

_gitroot="git://github.com/couchapp/couchapp.git"
_gitname="couchapp"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
    else
    git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    python2 setup.py build
}

package() {
    cd "$srcdir/$_gitname-build"
    python2 setup.py install --root "$pkgdir/"
} 
