# Maintainer: Alexander Paetzelt <techge+arch [ät] posteo [do] net>
pkgname=kismet-git
pkgver=20171210
pkgrel=1
pkgdesc="Current development version based on git repo, many crucial changes since official stable Release 2017_07_R1-1"
arch=('x86_64')
url="https://www.kismetwireless.net/"
license=('GPL')
depends=('libmicrohttpd' 'libelf' 'libpcap' 'libnm')
optdepends=('hackrf: use with HackRF compatible software defined radio (SDR)')
conflicts=('kismet')
backup=('etc/kismet/kismet.conf' 'etc/kismet/kismet_alerts.conf' 'etc/kismet/kismet_httpd.conf' 'etc/kismet/kismet_logging.conf' 'etc/kismet/kismet_memory.conf' 'etc/kismet/kismet_storage.conf')
install=kismet.install
source=("https://github.com/kismetwireless/kismet/archive/master.zip")
md5sums=('SKIP')

build() {
    cd "kismet-master"
    ./configure --prefix=/usr \
                --sysconfdir=/etc/kismet
    make
}

package() {
    cd "kismet-master"
    make DESTDIR="$pkgdir/" install

    # install capture_tools setuid so that kismet can started as user and still
    # network device can get handled by capture tools
    mkdir -p ${pkgdir}/usr/bin/kismet_capture_tools/
    install -o root -g 315 -m 4550 capture_linux_wifi/kismet_cap_linux_wifi "${pkgdir}/usr/bin/kismet_capture_tools/"
    install -o root -g 315 -m 4550 capture_linux_bluetooth/kismet_cap_linux_bluetooth "${pkgdir}/usr/bin/kismet_capture_tools/"

    # include new docs in /usr/share/doc/
    mkdir -p ${pkgdir}/usr/share/doc/$pkgname/
    install -Dm 644 docs/dev/* "$pkgdir/usr/share/doc/$pkgname/"
}
