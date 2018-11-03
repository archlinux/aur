# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roland Schaeuble <rschaeuble@gmx.ch>

pkgname=cdcover
pkgver=0.7.4
pkgrel=7
pkgdesc="Create CD/DVD jewel case inlets"
arch=('x86_64')
url="http://cdcover.sourceforge.net"
license=('GPL2')
depends=('python2' 'tk' 'gv' 'cd-discid' 'cddb-py')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz" 'cdcover.desktop' 'cdcover.png')
sha1sums=('5f796c26c6d6131ee176d70f682ce11c216662b2'
          '367130014fb1978c4b48285ac7ada760d7a14563'
          '5807c278c96c0071b74e4005045a5d40cafcc375')

build() {
  cd "$srcdir"/$pkgname

  # python2 fix
  sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' src/cdcover.py

  patch -p0 Makefile <<EOF
4c4
< docdir=\$(prefix)/doc/cdcover
---
> docdir=\$(prefix)/share/doc/cdcover
12c12
< DOCFILES=BUGS COPYING INSTALL README VERSION
---
> DOCFILES=COPYING INSTALL README VERSION
13c13
< IMAGEFILES=autonum.gif cddb.gif exit.gif gv.gif logo.gif nocddb.gif ps.gif
---
> IMAGEFILES=application-exit.gif cddb.gif document-print-preview.gif document-save.gif logo.gif nocddb.gif renumber.gif
EOF

  patch -p0 dotcdcover.m4 <<EOF
6c6                                                                                                 
<   <ghostview path="/usr/bin/ggv"/>
---
>   <ghostview path="/usr/bin/gv"/>
EOF
}

package() {
  cd "$srcdir"/$pkgname
  make target=/usr prefix="$pkgdir"/usr install

  mkdir -p -m 755 $pkgdir/usr/share/{applications,icons/hicolor/48x48/apps}
  install -Dm644 doc/cdcover.pdf "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/"
}
