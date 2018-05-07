# Maintainer: Pedro Martinez-Julia <pedromj@gmail.com>
# Contributor: Walter Dworak <preparationh67@gmail.com>

pkgname=mininet
pkgver=2.2.2
pkgrel=1
pkgdesc="Process-based network emulator (stable branch)"
url="https://github.com/mininet/mininet/"
license=('custom')
depends=('bash' 'python2' 'python2-networkx' 'net-tools' 'iputils' 'iperf' 'openvswitch')
optdepends=('xorg-xhost')
makedepends=('help2man' 'python2-setuptools')
install="${pkgname}.install"
arch=('i686' 'x86_64')
source=("https://github.com/mininet/mininet/archive/$pkgver.tar.gz")
sha256sums=('d0aed2ea7a9096ae975694a4b3d0995259ef79268dd8888ba8be28601c100db5')

prepare () {
	cd "$srcdir/$pkgname-$pkgver"
	grep python2 Makefile && return
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
	sed 's:BINDIR = /usr/bin:BINDIR = $(DESTDIR)/usr/bin:g' -i Makefile
	sed 's:MANDIR = /usr/share/man/man1:MANDIR = $(DESTDIR)/usr/share/man/man1:g' -i Makefile
	sed 's:install $(MNEXEC) $(BINDIR):mkdir -p $(BINDIR); install $(MNEXEC) $(BINDIR):g' -i Makefile
	sed 's:install $(MANPAGES) $(MANDIR):mkdir -p $(MANDIR);install $(MANPAGES) $(MANDIR):g' -i Makefile
	sed 's:python setup.py:python2 setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:g' -i Makefile
}

build () {
	cd "$srcdir/$pkgname-$pkgver"
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
