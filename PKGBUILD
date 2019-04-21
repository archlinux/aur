# Maintainer: Alexander Paetzelt <techge+arch [ät] posteo [do] net>
pkgname=kismet-git
pkgver=20190421
pkgrel=1
pkgdesc="Current development version based on git repo"
arch=('x86_64')
url="https://www.kismetwireless.net/"
license=('GPL')
depends=('libelf' 'libmicrohttpd' 'libnm' 'libpcap' 'pkg-config' 'protobuf-c' 'lm_sensors')
optdepends=('hackrf: use with HackRF compatible software defined radio (SDR)')
conflicts=('kismet')
backup=('etc/kismet/kismet.conf' 'etc/kismet/kismet_alerts.conf' 'etc/kismet/kismet_httpd.conf' 'etc/kismet/kismet_logging.conf' 'etc/kismet/kismet_memory.conf' 'etc/kismet/kismet_storage.conf')
install=${pkgname}.install
source=("git+https://github.com/kismetwireless/kismet"
        "${pkgname}-sysusers.conf")
sha256sums=('SKIP'
            '8b5b25bb6d9c611589ce0200da3cfeed2194bfa45aeed88e10c980c668383806')

prepare() {
    cd "$srcdir/kismet"
    # include submodule for docs
    git submodule update --init docs
}

build() {
    cd "$srcdir/kismet"
    ./configure --prefix=/usr \
                --sysconfdir=/etc/kismet \
                --disable-python-tools
    make
}

package() {
    cd "$srcdir/kismet"
    make DESTDIR="$pkgdir/" install
    
    # install capture_tools setuid so that kismet can started as user and
    # network device can get handled by capture tools
    install -o root -g 315 -m 4550 capture_linux_wifi/kismet_cap_linux_wifi "${pkgdir}/usr/bin/"
    install -o root -g 315 -m 4550 capture_linux_bluetooth/kismet_cap_linux_bluetooth "${pkgdir}/usr/bin/"

    # include docs in /usr/share/doc/
    mkdir -p ${pkgdir}/usr/share/doc/$pkgname
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/"

    # create group kismet via sysusers
    cd "$srcdir"
    install -vDm 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
