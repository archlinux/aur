# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: Walter Dworak <preparationh67@gmail.com>
# Contributor: Pedro Martinez-Julia <pedromj@gmail.com>

pkgname=mininet
pkgver=2.3.1b4
pkgrel=2
pkgdesc='Emulator for rapid prototyping of Software Defined Networks'
depends=('python' 'iproute2' 'net-tools' 'iputils' 'inetutils' 'iperf' 'ethtool'
         'libcgroup' 'openvswitch' 'psmisc')
optdepends=('xorg-xhost: for X11 forwarding'
            'socat: for X11 forwarding'
            'xterm: required for MiniEdit'
            'tk: required for MiniEdit')
makedepends=('git' 'help2man' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel')
arch=('x86_64')
url='https://github.com/mininet/mininet'
license=('custom')
install=mininet.install
source=("https://github.com/mininet/mininet/archive/refs/tags/$pkgver.tar.gz"
        'git+https://github.com/mininet/openflow'   # for UserSwitch
        'fix-openflow-strlcpy.patch'
        'fix-openflow-w-gcc-14-clang-17.patch')
sha256sums=('fd415abc49af04a6518589da26cea0b2ecf004dcbc801f91e07eb7244090741d'
            'SKIP'
            '0a85f8a5ce2dd900d4f874849b28301aa47d7b9d7b03ed405c973d917d98383a'
            '7258329a8df02c2b4bc87697daff12bc45ce8b2fc3145d2b6c520a8dd7ad8986')

prepare() {
    cd "$srcdir/openflow"
    sed '/^include debian\/automake.mk/d' -i Makefile.am
    # Patch controller to handle more than 16 switches
    patch -Np1 -i "$srcdir/$pkgname-$pkgver/util/openflow-patches/controller.patch"
    patch -Np1 -i "$srcdir/fix-openflow-strlcpy.patch"
    patch -Np1 -i "$srcdir/fix-openflow-w-gcc-14-clang-17.patch"

    cd "$srcdir/$pkgname-$pkgver"
    # shellcheck disable=SC2016
    sed -i Makefile \
        -e 's:PREFIX ?= /usr:PREFIX ?= "$(DESTDIR)"/usr:' \
        -e '/^[[:space:]]*$(PYTHON) /d'
}

build() {
    cd "$srcdir/openflow"
    autoreconf --install --force
    ./configure --prefix=/usr --sbindir=/usr/bin
    make

    cd "$srcdir/$pkgname-$pkgver"
    make mnexec man
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/openflow"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
    python -m installer \
        --prefix=/usr \
        --destdir="$pkgdir" \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/mininet/LICENSE"
}

# vim: set sw=4 ts=4 et:
