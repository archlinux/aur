# Contributor: Walter Dworak <preparationh67@gmail.com>
# Contributor: Pedro Martinez-Julia <pedromj@gmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou@gmail.com>

pkgname=mininet
pkgver=2.3.0
pkgrel=1
pkgdesc='Emulator for rapid prototyping of Software Defined Networks'
depends=('python' 'iproute2' 'net-tools' 'iputils' 'inetutils' 'iperf' 'ethtool'
         'libcgroup' 'openvswitch' 'psmisc')
optdepends=('xorg-xhost: for X11 forwarding'
            'socat: for X11 forwarding'
            'xterm: required for MiniEdit'
            'tk: required for MiniEdit')
makedepends=('git' 'help2man' 'python-setuptools')
arch=('x86_64')
url='https://github.com/mininet/mininet'
license=('custom')
install=mininet.install
source=("https://github.com/mininet/mininet/archive/$pkgver.tar.gz"
        'git+https://github.com/mininet/openflow')  # for UserSwitch
sha256sums=('1b16ee53ddb9a34a3751a77517643bda2286fc31be123209e84884d0697107b0'
            'SKIP')

prepare () {
    cd "$srcdir/openflow"
    sed '/^include debian\/automake.mk/d' -i Makefile.am
    # Patch controller to handle more than 16 switches
    patch -Np1 -i "$srcdir/$pkgname-$pkgver/util/openflow-patches/controller.patch"

	cd "$srcdir/$pkgname-$pkgver"
    sed 's:PREFIX ?= /usr:PREFIX ?= "$(DESTDIR)"/usr:' -i Makefile
    sed '/^[[:space:]]*$(PYTHON) /d' -i Makefile
}

build () {
    cd "$srcdir/openflow"
    autoreconf --install --force
    ./configure --prefix=/usr --sbindir=/usr/bin
    make

	cd "$srcdir/$pkgname-$pkgver"
    make mnexec man
}

package () {
    cd "$srcdir/openflow"
    make DESTDIR="${pkgdir}" install

	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/mininet/LICENSE"
}
