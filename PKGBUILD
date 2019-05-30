# Maintainer  :  Kr1ss              $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)
# Contributor :  Alexander Paetzelt <techge+arch [ät] posteo [do] net>


pkgname=kismet-ng
pkgver=2019.04.R1
pkgrel=9
_pkgname=${pkgname%-ng}
_srcname="$(sed 's/\./-/g' <<<"$_pkgname-$pkgver")"

pkgdesc='WiFi detector, sniffer, and intrusion detection framework - major rewrite'
arch=('x86_64')
url='https://www.kismetwireless.net'
license=('GPL' 'custom')

depends=('libelf' 'libmicrohttpd' 'libnm' 'libpcap' 'pkg-config' 'protobuf-c' 'lm_sensors')
makedepends=('rsync')
optdepends=('hackrf: use with HackRF compatible software defined radio [SDR]')

provides=('kismet')
conflicts=('kismet' 'kismet-git')

backup=('etc/kismet/kismet.conf' 'etc/kismet/kismet_alerts.conf'
        'etc/kismet/kismet_httpd.conf' 'etc/kismet/kismet_logging.conf'
        'etc/kismet/kismet_memory.conf' 'etc/kismet/kismet_storage.conf')

install="$_pkgname.install"
source=("$url/code/$_srcname.tar.xz"
        "$_pkgname-docs.zip::https://github.com/kismetwireless/$_pkgname-docs/archive/master.zip"
        "$_pkgname-sysusers.conf")

sha256sums=('60575e3473abc2a60c583a10b3e386c547f54e720140ab9de6130de5590a7790'
            '17b753a2fe813f5e2059a7fdaf9cba9da9c8b4094fad3cc520c7a800e5024047'
            '8b5b25bb6d9c611589ce0200da3cfeed2194bfa45aeed88e10c980c668383806')
validpgpkeys=('7A194E3F7A8F867BEA8A5339023F078862ACFE50')

build() {
    cd "$_srcname"
    ./configure --prefix=/usr --sysconfdir=/etc/kismet --disable-python-tools
    make
}

package() {
    cd "$_srcname"
    make DESTDIR="$pkgdir/" install

    # install capture_tools suid so that network devices can be
    # handled by capture tools when kismet is started as user
    install -oroot -g315 -m4550 -t"$pkgdir/usr/bin/" capture_linux_wifi/kismet_cap_linux_wifi capture_linux_bluetooth/kismet_cap_linux_bluetooth

    # install docs / license
    install -Dm644 -t"$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
    install -dm755 "$pkgdir/usr/share/doc/$_pkgname/"
    rsync -rp "../$_pkgname-docs-master/"* "$pkgdir/usr/share/doc/$_pkgname/"

    # create group kismet via sysusers
    install -Dm644 "../$_pkgname-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
}

