# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>
# Contributor: techryda <techryda at silentdome dot com>
# Contributor: Mathias R. <pu154r@overlinux.org>
pkgname=xrdp
pkgver=0.6.1
pkgrel=2
pkgdesc="An open source remote desktop protocol (RDP) server"
url="http://xrdp.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL')
depends=('tigervnc')
source=(https://github.com/neutrinolabs/${pkgname}/archive/v${pkgver}.tar.gz
        'xrdp.service'
        'xrdp-sesman.service')
md5sums=('26099c6588943262023607c1b4e774d8'
         '0cb760b3e8a34f9bdf4daa871444d74c'
         '58eb44bdc7ca5bb436d6fd66826f9b0f')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Fix path in xrdp.sh file
    sed -i 's|/usr/local/sbin|/usr/bin|' instfiles/xrdp.sh
}

build() {
    cd "${pkgname}-${pkgver}"
    ./bootstrap
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    cd ${pkgdir}
    # Install systemd service files
    mkdir -p usr/lib/systemd/system
    cp ${srcdir}/*.service usr/lib/systemd/system
}
md5sums=('ada45a1e8ca0be779b6ef0eda782aa13'
         '0cb760b3e8a34f9bdf4daa871444d74c'
         '58eb44bdc7ca5bb436d6fd66826f9b0f')
