# Maintainer: Alexander Paetzelt <techge+arch [ät] posteo [do] net>
pkgname=kismet-git
pkgver=019a7ef
pkgrel=1
pkgdesc="Current development version based on git repo, many crucial changes since official stable Release 2016_07_R1-1"
arch=('x86_64')
url="https://www.kismetwireless.net/"
license=('GPL')
depends=('libmicrohttpd' 'libelf' 'libpcap' 'libnm' 'protobuf' 'protobuf-c')
optdepends=('hackrf: use with HackRF compatible software defined radio (SDR)')
conflicts=('kismet')
backup=('etc/kismet/kismet.conf' 'etc/kismet/kismet_alerts.conf' 'etc/kismet/kismet_httpd.conf' 'etc/kismet/kismet_logging.conf' 'etc/kismet/kismet_memory.conf' 'etc/kismet/kismet_storage.conf')
install=kismet.install
source=("${pkgname}-${pkgver}.zip::https://github.com/kismetwireless/kismet/archive/${pkgver}.zip"
        "${pkgname}-sysusers.conf")
sha256sums=('c41b88ffc374e71353197ee7c07a673f2a86f8a89edb1fc59b9f43c68013cbaf'
            '8b5b25bb6d9c611589ce0200da3cfeed2194bfa45aeed88e10c980c668383806')

build() {
    cd kismet-${pkgver}*
    ./configure --prefix=/usr \
                --sysconfdir=/etc/kismet
    make
}

package() {
    cd kismet-${pkgver}*
    make DESTDIR="$pkgdir/" install
    
    # install capture_tools setuid so that kismet can started as user and
    # network device can get handled by capture tools
    install -o root -g 315 -m 4550 capture_linux_wifi/kismet_cap_linux_wifi "${pkgdir}/usr/bin/"
    install -o root -g 315 -m 4550 capture_linux_bluetooth/kismet_cap_linux_bluetooth "${pkgdir}/usr/bin/"

    # include new docs in /usr/share/doc/
    mkdir -p ${pkgdir}/usr/share/doc/$pkgname/
    install -Dm 644 docs/dev/* "$pkgdir/usr/share/doc/$pkgname/"

    # create group kismet via sysusers
    cd ../..
    install -vDm 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
