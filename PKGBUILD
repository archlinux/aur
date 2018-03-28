# Maintainer: Darshit Shah <darnir@gmail.com>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=offlineimap-git
_pkgname=offlineimap
pkgver=7.1.5.12.g2b64e10
pkgrel=1
pkgdesc="A powerful IMAP/Maildir synchronization tool"
url="http://offlineimap.org/"
arch=('any')
license=('GPL')
depends=('python2' 'python2-six')
makedepends=('git' 'asciidoc')
conflicts=('offlineimap')
provides=('offlineimap')
source=('git+git://github.com/OfflineIMAP/offlineimap.git#branch=next')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags | sed 's|^v||;s|-|.|g'
}

prepare() {
  cd "$srcdir"/"$_pkgname"
  find . -type f -exec sed '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' -i {} \;
}

build() {
  cd "$srcdir"/"$_pkgname"
  python2 setup.py build

  cd "$srcdir"/"$_pkgname"/docs
  make man
}

package() {
  cd "$srcdir"/"$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 docs/offlineimap.1 ${pkgdir}/usr/share/man/man1/offlineimap.1
  install -D -m644 docs/offlineimapui.7 "${pkgdir}"/usr/share/man/man7/offlineimapui.7
  install -D -m644 offlineimap.conf ${pkgdir}/usr/share/offlineimap/offlineimap.conf
  install -D -m644 offlineimap.conf.minimal ${pkgdir}/usr/share/offlineimap/offlineimap.conf.minimal

#systemd files
  install -Dm644 contrib/systemd/$_pkgname.service "${pkgdir}"/usr/lib/systemd/user/$_pkgname.service
  install -Dm644 contrib/systemd/$_pkgname-oneshot.service "${pkgdir}"/usr/lib/systemd/user/$_pkgname.service
  install -Dm644 contrib/systemd/$_pkgname-oneshot.timer "${pkgdir}"/usr/lib/systemd/user/_$pkgname.timer
  install -Dm644 contrib/systemd/$_pkgname-oneshot@.service "${pkgdir}"/usr/lib/systemd/user/$_pkgname.service
  install -Dm644 contrib/systemd/$_pkgname@.service "${pkgdir}"/usr/lib/systemd/user/$_pkgname@.service
  install -Dm644 contrib/systemd/$_pkgname-oneshot@.timer "${pkgdir}"/usr/lib/systemd/user/$_pkgname@.timer
}

# vim:set ts=2 sw=2 et:
