# Maintainer: Torge Matthies <openglfreak@googlemail.com>

pkgname=winestreamproxy
pkgver=2.0.2
pkgrel=1
pkgdesc="Forwards data between a Wine named pipe and a Unix domain socket."
arch=('x86_64')
url="https://github.com/openglfreak/winestreamproxy"
license=('MPL2')
depends=('sh' 'wine')
makedepends=('mingw-w64-gcc')
backup=('etc/xdg/winestreamproxy/settings.conf')
source=("https://github.com/openglfreak/winestreamproxy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('afeca5f41b35dc59da8c6107bb0ceeb56baea94201ac58e75c08c1bc9674adc5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make out/winestreamproxy_unixlib.dll.so out/winestreamproxy_unixlib.dll.dbg.o
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,relro/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    make release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/usr" PREFIX='/usr' install
    install -dm755 "${pkgdir}/etc/xdg/winestreamproxy"
    mv "${pkgdir}/usr/lib/winestreamproxy/settings.conf" "${pkgdir}/etc/xdg/winestreamproxy/settings.conf"
}
