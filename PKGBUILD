# Maintainer: Lucas Kent <rubickent at gmail dot com>
# Contributor: Kristaps Esterlins <kristaps.esterlins at gmail dot com>

pkgname=miniircd-git
arch=('any')
pkgver=0.4.r33.ged76e15
pkgrel=1
md5sums=('SKIP')
depends=('python2')
license=('GPL2')
makedepends=('git')
source=('git+https://github.com/jrosdahl/miniircd.git')
url="https://github.com/jrosdahl/miniircd"
pkgdesc="A small and configuration free IRC server, suitable for private use."

pkgver() {
    cd $srcdir/miniircd
    #generate nice pkgver from git repo
    git describe | sed 's/\([^-]*-g\)/r\1/g' | sed 's/-/./g' | sed 's/^v//'
}

prepare() {
    cd $srcdir/miniircd
    #force use of python2
    sed -i 's|#! /usr/bin/env python|#! /usr/bin/env python2|' miniircd
    sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2|' test.py
}

package() {
    dest=usr/lib/python3.4/site-packages
    cd $srcdir/miniircd
    #create filesystem hierarchy within $pkgdir
    install -m 755 -d $pkgdir/usr/bin/ $pkgdir/$dest/miniircd

    #install miniircd files
    #install -m 755 miniircd $pkgdir/$dest/ #Minimal single file install
    install -m 755 miniircd test test.py $pkgdir/$dest/miniircd/

    #create symlink to executable
    cd $pkgdir
    ln -sr $dest/miniircd/miniircd usr/bin/miniircd
}
