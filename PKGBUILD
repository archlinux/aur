# Maintainer: Torge Matthies <openglfreak@googlemail.com>

_pkgname=winestreamproxy
pkgname=winestreamproxy-git
pkgver=2.0.1.r0.gd0a8fa3
pkgrel=1
pkgdesc="Forwards data between a Wine named pipe and a Unix domain socket (Git version)."
arch=('x86_64')
url="https://github.com/openglfreak/winestreamproxy"
license=('MPL2')
depends=('sh' 'wine')
makedepends=('mingw-w64-gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/xdg/winestreamproxy/settings.conf')
source=("git+https://github.com/openglfreak/winestreamproxy.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make out/winestreamproxy_unixlib.dll.so out/winestreamproxy_unixlib.dll.dbg.o
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,relro/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    make release
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}/usr" PREFIX='/usr' install
    install -dm755 "${pkgdir}/etc/xdg/winestreamproxy"
    mv "${pkgdir}/usr/lib/winestreamproxy/settings.conf" "${pkgdir}/etc/xdg/winestreamproxy/settings.conf"
}
