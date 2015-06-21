# Maintainer: Mike Sampson <mike at sambodata dot com>
pkgname=jsonpipe-git
pkgver=20110412
pkgrel=1
pkgdesc="Convert JSON to a UNIX-friendly line-based format."
arch=('any')
url="https://github.com/zacharyvoase/jsonpipe"
license=('CUSTOM')
depends=('python2' 'python2-simplejson' 'python2-argparse' 'python2-calabash')
makedepends=('git')

_gitroot="https://github.com/zacharyvoase/jsonpipe.git"
_gitname="jsonpipe"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # Remove versioned dependencies. These are cutting edge even for Arch!
    # Arch's versions seem to work fine.
    #sed -i -e 's/>=2.1.3//' -e 's/>=1.2.1//' setup.py
}

package() {
    cd "$srcdir/$_gitname-build"
    python2 setup.py install --root=$pkgdir/ --optimize=1
    install -d $pkgdir/usr/share/licenses/jsonpipe
    install -m 644 -t $pkgdir/usr/share/licenses/jsonpipe/ UNLICENSE
}
