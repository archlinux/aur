# Maintainer: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=mininet-git
pkgver=20180326
pkgrel=1
pkgdesc="Emulator for rapid prototyping of Software Defined Networks"
depends=('bash' 'python2' 'python2-networkx' 'net-tools' 'iputils' 'iperf' 'openvswitch')
optdepends=('xorg-xhost')
makedepends=('help2man' 'python2-setuptools')
arch=('x86_64')
url="https://github.com/mininet/mininet/"
license=('custom')
provides=('mininet')
conflicts=('mininet')
install="mininet.install"
source=("git+https://github.com/mininet/mininet.git")
sha256sums=('SKIP')

prepare () {
	cd "$srcdir/mininet"
	grep python2 Makefile && return
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
	sed 's:BINDIR = /usr/bin:BINDIR = $(DESTDIR)/usr/bin:g' -i Makefile
	sed 's:MANDIR = /usr/share/man/man1:MANDIR = $(DESTDIR)/usr/share/man/man1:g' -i Makefile
	sed 's:install $(MNEXEC) $(BINDIR):mkdir -p $(BINDIR); install $(MNEXEC) $(BINDIR):g' -i Makefile
	sed 's:install $(MANPAGES) $(MANDIR):mkdir -p $(MANDIR);install $(MANPAGES) $(MANDIR):g' -i Makefile
	sed 's:python setup.py:python2 setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:g' -i Makefile
	sed 's:python :python2 :g' -i Makefile
}

package () {
	cd "$srcdir/mininet"
	make DESTDIR="${pkgdir}" install
}
