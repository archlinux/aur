# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=mininet-git
pkgver=20180911
pkgrel=1
pkgdesc='Emulator for rapid prototyping of Software Defined Networks'
depends=('python' 'iproute2' 'net-tools' 'iputils' 'inetutils' 'iperf' 'ethtool'
         'libcgroup' 'openvswitch')
optdepends=('xorg-xhost' 'xterm' 'openssh' 'oflops')
makedepends=('gcc' 'make' 'socat' 'psmisc' 'automake' 'autoconf' 'libtool' 'git'
             'help2man' 'python-setuptools' 'python-pyflakes' 'python-pylint'
             'autopep8' 'python-pexpect')
arch=('x86_64')
url='https://github.com/mininet/mininet'
license=('custom')
provides=('mininet')
conflicts=('mininet')
install='mininet.install'
source=('git+https://github.com/mininet/mininet.git'
        'git+https://github.com/mininet/openflow.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
        cd "$srcdir/openflow"
        sed '/^include debian\/automake.mk/d' -i Makefile.am

        cd "$srcdir/mininet"
        sed 's:PREFIX ?= /usr:PREFIX ?= "$(DESTDIR)"/usr:' -i Makefile
        sed 's:$(PYTHON) setup.py install:$(PYTHON) setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:' -i Makefile
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
