# Contributor:  Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=python-pigment-svn
pkgver=1557
pkgrel=1
pkgdesc="Development version of Pigment Python library and bindings."
url="https://code.fluendo.com/pigment/trac"
arch=(any)
license=('GPL')

depends=('pigment-svn' 'python' 'pygobject')
makedepends=('subversion')
conflicts=('python-pigment' 'pigment-python-svn')
options=('!libtool')

_svntrunk="https://code.fluendo.com/pigment/svn/trunk/pigment-python"
_svnmod="pigment-python"

build() {
    cd ${srcdir}

    if [ -d $_svnmod/.svn ]; then
        (cd $_svnmod && svn up -r $pkgver)
    else
        svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting make..."

    cp -r $_svnmod $_svnmod-build
    cd $_svnmod-build

    ./autogen.sh --prefix=/usr
    make || return 1
    make DESTDIR=${pkgdir} install

    rm -rf ${srcdir}/$_svnmod-build
}

# vim:syntax=sh
