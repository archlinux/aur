# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: Johannes Kampmeyer <aur@kajoh.de>
# Contributor: Pedro Martinez-Julia <pedromj@gmail.com>
# Contributor: Walter Dworak <preparationh67@gmail.com>

pkgname=containernet-git
pkgver=3.1.r446.gc068942
pkgrel=3
pkgdesc="Mininet fork adding support for container-based emulated hosts"
_mn_deps=('python' 'iproute2' 'net-tools' 'iputils' 'inetutils' 'iperf'
          'ethtool' 'libcgroup' 'openvswitch' 'psmisc')
depends=("${_mn_deps[@]}"
         'docker' 'python-docker' 'python-pytest' 'python-iptables-git'
         'python-pexpect' 'python-urllib3' 'python-networkx')
optdepends=('xorg-xhost: for X11 forwarding'
            'socat: for X11 forwarding'
            'xterm: required for MiniEdit'
            'tk: required for MiniEdit')
makedepends=('git' 'help2man' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel')
arch=('x86_64')
url="https://github.com/containernet/containernet"
license=('LicenseRef-Mininet')
provides=('mininet' 'containernet')
conflicts=('mininet' 'containernet')
install="${pkgname%-git}.install"
source=("$pkgname"::'git+https://github.com/containernet/containernet'
        'git+https://github.com/mininet/openflow'
        'fix-openflow-strlcpy.patch'
        'fix-openflow-w-gcc-14-clang-17.patch'
        'fix-mininet-version.patch')
sha256sums=('SKIP'
            'SKIP'
            '0a85f8a5ce2dd900d4f874849b28301aa47d7b9d7b03ed405c973d917d98383a'
            '7258329a8df02c2b4bc87697daff12bc45ce8b2fc3145d2b6c520a8dd7ad8986'
            'dedc06db994a38b19a5641665dffeb6f5729efd25728e04edb9a71f65744df2c')

pkgver() {
    cd "$srcdir/$pkgname"
    if git describe --long --tags >/dev/null 2>&1; then
        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
    fi
}

prepare() {
    cd "$srcdir/openflow"
    sed '/^include debian\/automake.mk/d' -i Makefile.am
    # Patch controller to handle more than 16 switches
    patch -Np1 -i "$srcdir/$pkgname/util/openflow-patches/controller.patch"
    patch -Np1 -i "$srcdir/fix-openflow-strlcpy.patch"
    patch -Np1 -i "$srcdir/fix-openflow-w-gcc-14-clang-17.patch"

    cd "$srcdir/$pkgname"
    # shellcheck disable=SC2016
    sed -i Makefile \
        -e 's:PREFIX ?= /usr:PREFIX ?= "$(DESTDIR)"/usr:' \
        -e '/^[[:space:]]*$(PYTHON) /d'
    patch -Np1 -i "$srcdir/fix-mininet-version.patch"
}

build() {
    cd "$srcdir/openflow"
    autoreconf --install --force
    ./configure --prefix=/usr --sbindir=/usr/bin
    make

    cd "$srcdir/$pkgname"
    make mnexec man
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/openflow"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/$pkgname"
    make DESTDIR="${pkgdir}" install
    python -m installer \
        --prefix=/usr \
        --destdir="$pkgdir" \
        --compile-bytecode=1 \
        dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=4 ts=4 et:
