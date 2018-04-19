# Maintainer: Kuan-Yen Chou <forendef2846@gmail.com>

pkgname=mininet-git
pkgver=20180418
pkgrel=2
pkgdesc="Emulator for rapid prototyping of Software Defined Networks"
depends=('bash' 'iproute2' 'python2' 'libcgroup' 'net-tools' 'iputils' 'iperf'
         'inetutils' 'openvswitch')
optdepends=('xorg-xhost' 'xterm' 'openssh' 'oflops')
makedepends=('gcc' 'make' 'automake' 'autoconf' 'libtool' 'git' 'socat' 'psmisc'
             'help2man' 'python2-setuptools' 'python2-pyflakes' 'python2-pylint'
             'python2-autopep8' 'python2-pexpect')
arch=('x86_64')
url="https://github.com/mininet/mininet/"
license=('custom')
provides=('mininet')
conflicts=('mininet')
install="mininet.install"
source=("git+https://github.com/mininet/mininet.git"
        "git+https://github.com/mininet/openflow.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
        cd "$srcdir/openflow"
        sed '/^include debian\/automake.mk/d' -i Makefile.am

        cd "$srcdir/mininet"
        grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/env python:#!/usr/bin/env python2:g'
        grep -rIil '#!.*python' . | xargs -n1 sed -i 's:#!/usr/bin/python:#!/usr/bin/python2:g'
        sed 's:BINDIR = /usr/bin:BINDIR = $(DESTDIR)/usr/bin:g' -i Makefile
        sed 's:MANDIR = /usr/share/man/man1:MANDIR = $(DESTDIR)/usr/share/man/man1:g' -i Makefile
        sed 's:install $(MNEXEC) $(BINDIR):mkdir -p $(BINDIR); install $(MNEXEC) $(BINDIR):g' -i Makefile
        sed 's:install $(MANPAGES) $(MANDIR):mkdir -p $(MANDIR);install $(MANPAGES) $(MANDIR):g' -i Makefile
        sed 's:python setup.py:python2 setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:g' -i Makefile
        sed 's:python :python2 :g' -i Makefile
}

build() {
        cd "$srcdir/openflow"
        autoreconf --install --force
        ./configure --prefix=/usr --sbindir=/usr/bin
        make
}

package() {
        cd "$srcdir/openflow"
        make DESTDIR="${pkgdir}" install

        cd "$srcdir/mininet"
        make DESTDIR="${pkgdir}" install
}

# vim: set sw=8 ts=8 et:
