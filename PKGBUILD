# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=pyrss
pkgver=0.9.9.1
pkgrel=13
pkgdesc="jabber rss transport"
arch=(any)
url="https://code.google.com/archive/p/pyrss/"
license=("GPL")
depends=(python2 python2-pyxmpp python2-feedparser mysql-python)
backup=(etc/ejabberd/pyrss.xml)
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/pyrss/pyrss-$pkgver.tar.bz2
        pyrss.service
        dont-import-psyco.patch)
md5sums=('3f48f3b7f36c2c588b8d55a5841482ab'
         '1fbbcc50f4b8ca5d8db1d3adffb5e42e'
         'a9b8e3e3f1524d852b270acef5cd27f6')

package() {
    cd "$srcdir"

    # python2 fix
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done
    sed -i 's|python pyrss.py|python2 pyrss.py|g' $pkgname-$pkgver/start.py
    patch $pkgname-$pkgver/pyrss.py < dont-import-psyco.patch

    install -d -m0755 "$pkgdir"/usr/lib
    cp -r $pkgname-$pkgver "$pkgdir"/usr/lib
    mv "$pkgdir"/usr/lib/$pkgname-$pkgver "$pkgdir"/usr/lib/$pkgname

    install -d -m0755 "$pkgdir"/etc/ejabberd
    mv "$pkgdir"/usr/lib/$pkgname/pyrss.xml "$pkgdir"/etc/ejabberd/pyrss.xml
    sed -i 's#/etc/jabber/pyrss.xml#/etc/ejabberd/pyrss.xml#' "$pkgdir"/usr/lib/$pkgname/contrib/auth.py
    sed -i 's#/etc/jabber/pyrss.xml#/etc/ejabberd/pyrss.xml#' "$pkgdir"/usr/lib/$pkgname/pyrss.py

    install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
