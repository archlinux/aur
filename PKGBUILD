# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=mininet-git-python2
pkgver=2.3.0d6.r22.gbfc42f6
pkgrel=1
pkgdesc='Emulator for rapid prototyping of Software Defined Networks (Python 2 version)'
depends=('python2' 'iproute2' 'net-tools' 'iputils' 'inetutils' 'iperf' 'ethtool'
         'libcgroup' 'openvswitch' 'psmisc')
optdepends=('xorg-xhost: for X11 forwarding'
            'socat: for X11 forwarding'
            'xterm: terminal emulator for X11')
makedepends=('git' 'gcc' 'make' 'autoconf' 'automake' 'libtool' 'help2man'
             'python2-setuptools')
arch=('x86_64')
url='https://github.com/mininet/mininet'
license=('custom')
provides=('mininet')
conflicts=('mininet')
replaces=('mininet')
install=mininet.install
source=("$pkgname"::'git+https://github.com/mininet/mininet.git'
        'git+https://github.com/mininet/openflow.git')  # for the UserSwitch
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/openflow"
    sed '/^include debian\/automake.mk/d' -i Makefile.am

    cd "$srcdir/$pkgname"
    sed 's/python/python2/' -i Makefile
    sed 's:PREFIX ?= /usr:PREFIX ?= "$(DESTDIR)"/usr:' -i Makefile
    sed 's:$(PYTHON) setup.py install:$(PYTHON) setup.py install --prefix=/usr --root="$(DESTDIR)" --optimize=1:' -i Makefile
}

build() {
    cd "$srcdir/openflow"
    autoreconf --install --force
    ./configure --prefix=/usr --sbindir=/usr/bin
    make

    cd "$srcdir/$pkgname"
    make mnexec man
}

package() {
    cd "$srcdir/openflow"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/$pkgname"
    make DESTDIR="${pkgdir}" install
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/mininet/LICENSE"
}

# vim: set sw=4 ts=4 et:
