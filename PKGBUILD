# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=ajaxterm
pkgver=0.11
pkgrel=9
pkgdesc="A web based terminal"
arch=('any')
license=('GPL')
url="https://github.com/antonylesuisse/qweb/tree/master/ajaxterm"
depends=('python2')
replaces=('ajaxterm-utf8-svn')
backup=('etc/ajaxterm.conf')
#_commit="HEAD"
_commit="2eaa3e989782d8259a12c8cb7d6204433ae19264"
#source=("ajaxterm-$pkgver-${_commit}.tar.gz::http://git.kirya.net/?p=ajaxterm.git;a=snapshot;h=${_commit};sf=tgz"
source=("https://sources.archlinux.org/other/community/ajaxterm/ajaxterm-$pkgver-${_commit}.tar.gz"
	ajaxterm.service)
md5sums=('0d5c9896f4af8f82610c00cc303e0d62'
         '5e5aa6598aad99193738441556e06864')

build() {
   cd "$srcdir"/ajaxterm || cd "$srcdir"/ajaxterm-${_commit:0:7}

   cat debian/patches/series | while read A; do [ -z $A ] || patch -p1 <debian/patches/$A; done

   # python2 fix
   for file in configure ajaxterm.py qweb.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
   done

   ./configure --prefix=/usr
}

package() {
   cd "$srcdir"/ajaxterm || cd "$srcdir"/ajaxterm-${_commit:0:7}

   install -d "$pkgdir"/etc
   install -d "$pkgdir"/usr/bin
   install -d "$pkgdir"/usr/share/man/man1
   install -d "$pkgdir"/usr/share/ajaxterm

   install -m 0755 ajaxterm.bin "$pkgdir"/usr/bin/ajaxterm
   install -m 0644 ajaxterm.conf "$pkgdir"/etc/ajaxterm.conf
   ln -s -f /etc/ajaxterm.conf "$pkgdir"/usr/share/ajaxterm/ajaxterm_config.js
   install -m 0644 ajaxterm.css ajaxterm.html qweb.py *.js "$pkgdir"/usr/share/ajaxterm
   install -m 0755 ajaxterm.py "$pkgdir"/usr/share/ajaxterm
   install -m 0644 ajaxterm.1 "$pkgdir"/usr/share/man/man1
   install -Dm0644 "$srcdir"/ajaxterm.service "$pkgdir"/usr/lib/systemd/system/ajaxterm.service
}
