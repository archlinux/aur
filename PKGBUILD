# Maintainer: Johannes Kampmeyer <aur@kajoh.de>
# Contributor: Pedro Martinez-Julia <pedromj@gmail.com>
# Contributor: Walter Dworak <preparationh67@gmail.com>

pkgname=containernet-git
pkgver=20171220
pkgrel=1
pkgdesc="Mininet with added Docker support"
url="https://github.com/containernet/containernet/"
license=('custom')
depends=('bash' 'python2' 'python2-networkx' 'net-tools' 'iputils' 'iperf' 'openvswitch' 'docker' 'python2-pytest' 'python2-urllib3' 'python-iptables')
optdepends=('xorg-xhost')
makedepends=('help2man' 'python2-setuptools' 'git')
install="${pkgname}.install"
arch=('i686' 'x86_64')
conflicts=('mininet')
source=("$pkgname::git+http://github.com/containernet/containernet")
md5sums=('SKIP')

prepare () {
	cd "$srcdir/$pkgname"
	grep python2 Makefile && return
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
	grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
	sed 's:BINDIR = /usr/bin:BINDIR = $(DESTDIR)/usr/bin:g' -i Makefile
	sed 's:MANDIR = /usr/share/man/man1:MANDIR = $(DESTDIR)/usr/share/man/man1:g' -i Makefile
	sed 's:PYMN = python -B bin/mn:PYMN = python2 -B bin/mn:g' -i Makefile
	sed 's:install $(MNEXEC) $(BINDIR):mkdir -p $(BINDIR); install $(MNEXEC) $(BINDIR):g' -i Makefile
	sed 's:install $(MANPAGES) $(MANDIR):mkdir -p $(MANDIR);install $(MANPAGES) $(MANDIR):g' -i Makefile
	sed 's:python setup.py:python2 setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:g' -i Makefile
}

pkgver() {
	cd "$srcdir/$pkgname"
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build () {
	cd "$srcdir/$pkgname"
	python2 setup.py build
}

package () {
	cd "$srcdir/$pkgname"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="${pkgdir}" install
}

