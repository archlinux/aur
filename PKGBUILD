# Maintainer: Stefan Biereigel <$(base64 --decode <<<'c3RlZmFuQGJpZXJlaWdlbC5kZQo=')>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>
# Contributor: Sebastian Bøe <$(base64 --decode <<<'c2ViYXN0aWFuYm9vZUBnbWFpbC5jb20K')>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=yosys-git
pkgrel=1
pkgver=0.19+20.r11686.12b0ce972
pkgdesc='A framework for RTL synthesis'
arch=('x86_64' 'i686')
url='https://yosyshq.net/yosys/'
license=('custom:ISC')
provides=("yosys=$pkgver")
conflicts=("yosys")
depends=('tcl' 'libffi' 'python' 'boost-libs')
optdepends=('graphviz: Schematics display support' 'xdot: Design netlist display support')
makedepends=('git' 'mercurial' 'boost')
checkdepends=('iverilog' 'clang')
source=('git+https://github.com/YosysHQ/yosys.git'
        'git+https://github.com/YosysHQ/abc.git')

sha512sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/yosys"
    printf "%s.r%s.%s" "$(make echo-yosys-ver)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/abc"
    git checkout "$(make --silent -C "${srcdir}/yosys" echo-abc-rev)"
}

build() {
    cd "${srcdir}/yosys"

    ln -s "${srcdir}/abc/" .

    make config-gcc
    echo "ENABLE_LIBYOSYS=1" >> Makefile.conf
    echo "ENABLE_PYOSYS=1" >> Makefile.conf
    echo "ABCPULL=0" >> Makefile.conf

    make PREFIX="/usr"
}

check() {
    cd "${srcdir}/yosys"

    make test
}

package() {
    cd "${srcdir}/yosys"

    # disable stripping in the makefile - duplicated effort and makes debug packages impossible
    make STRIP=':' PREFIX="/usr" PYTHON_PREFIX="${pkgdir}/usr" DESTDIR="${pkgdir}" install

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
