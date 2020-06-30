# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.4.2
pkgrel=1
pkgdesc="Trac Integrated SCM & Project Management using Apache & Subversion."
arch=('any')
url="http://trac.edgewall.org/"
license=('BSD')
depends=(python2 python2-jinja python2-babel python2-setuptools)
optdepends=('python2-psycopg2: PostgreSQL database support'
            'python2-pygments: Syntax highlighting'
            'python2-docutils: reStructuredText support')
install=trac.install
source=(https://download.edgewall.org/trac/Trac-$pkgver.tar.gz
        license.txt
        tracd.service)
sha256sums=('42372fcd9f2ac46264656287fe6edb8230f59b44e991ee098b399f1bb475ae8f'
            'a0936aa2fab3714eb6a3e8ff64b730576d8a5f81340a0601f006c847761607c4'
            '3f050f1c9367b1b28e18a6ff0088f991676a9fbba3f5177859ce4db64f95ca42')

prepare() {
  cd "$srcdir"/Trac-$pkgver
  sed -i 's:^#!/usr/bin/env python$:#!/usr/bin/env python2:' \
    trac/admin/console.py \
    trac/test.py \
    trac/web/cgi_frontend.py \
    trac/web/fcgi_frontend.py \
    trac/web/standalone.py
}

package() {
  cd "$srcdir"/Trac-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/trac/license.txt
  install -Dm0644 "$srcdir"/tracd.service "$pkgdir"/usr/lib/systemd/system/tracd.service
}
