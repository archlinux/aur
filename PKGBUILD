# Maintainer: Sean Enck <enckse@gmail.com>

pkgname=pcsclite-git
pkgver=1.8.23.r4.g984f84d
pkgrel=1
pkgdesc="PC/SC Architecture smartcard middleware library"
arch=('x86_64')
url="https://pcsclite.apdu.fr/"
license=('BSD')
depends=('python' 'systemd')
makedepends=('pkgconf' 'git')
conflicts=("pcsclite")
provides=("pcsclite")
options=('!docs')
source=("git+https://salsa.debian.org/rousseau/PCSC.git")
md5sums=('SKIP')
validpgpkeys=('F5E11B9FFE911146F41D953D78A1B4DFE8F9C57E') # Ludovic Rousseau <rousseau@debian.org>

pkgver() {
    cd "${srcdir}/PCSC"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^pcsc\.//g'
}

build() {
    cd "${srcdir}/PCSC"
    sed -i "/^AC\_INIT/ { s,]),-git]), }" configure.ac
    ./bootstrap
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --sysconfdir=/etc \
                --enable-filter \
                --enable-ipcdir=/run/pcscd \
                --enable-libudev \
                --enable-usbdropdir=/usr/lib/pcsc/drivers \
                --with-systemdsystemunitdir=/usr/lib/systemd/system
    make
}


package() {
    cd "${srcdir}/PCSC"

    make DESTDIR="${pkgdir}" install

    install -D -m644 "${srcdir}/PCSC/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/lib/pcsc/drivers"
}
