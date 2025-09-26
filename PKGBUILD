# Maintainer: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Alexander Paetzelt <techge+arch [ät] posteo [do] net>

pkgname=kismet-git
pkgver=r11957.bca676c0b
pkgrel=1
pkgdesc="a sniffer, WIDS, and wardriving tool for Wi-Fi, Bluetooth, Zigbee, RF"
url="https://www.kismetwireless.net/"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
depends=('bluez-libs'
        'gcc-libs'
        'glibc'
        'libcap'
        'libelf'
        'libnl'
        'libnm'
        'libcap-ng'
        'libpcap'
        'libusb'
        'libwebsockets'
        'lm_sensors'
        'mosquitto'
        'pcre2'
        'rtl-sdr'
        'sqlite'
        'systemd'
        'zlib')
makedepends=('git')
optdepends=('festival: text-to-speech support'
        'flite:  alternative/lightweight text-to-speech support'
        'gpsd: log coordinates of detected networks'
        'hackrf: use with HackRF compatible software defined radio (SDR)'
        'sox: provide the default kismet sound playback binary'
        'wireshark-cli: provide OUI files used to determine device manufacturer'
        'wireshark-cli: mergecap, to merge multiple capture files',
        'libbtbb: bluetooth baseband decoding library')
backup=(etc/kismet/kismet.conf
        etc/kismet/kismet_80211.conf
        etc/kismet/kismet_alerts.conf
        etc/kismet/kismet_filter.conf
        etc/kismet/kismet_httpd.conf
        etc/kismet/kismet_logging.conf
        etc/kismet/kismet_memory.conf
        etc/kismet/kismet_uav.conf)
conflicts=('kismet')
install="${pkgname}.install"
source=("git+https://github.com/kismetwireless/kismet"
        "${pkgname}-sysusers.conf")
sha256sums=('SKIP'
        '0ac08bf5016e00596e2fc0bc89e7907c2186b811ed8d8a2bffe6b95b42e147a3')

pkgver() {
    cd "$srcdir/kismet"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/kismet"
    autoreconf -fiv
}

build() {
    cd "$srcdir/kismet"
        ./configure --prefix=/usr \
        --localstatedir=/var \
        --sysconfdir=/etc/kismet \
        --with-suidgroup=315
        make all plugins
}

package() {
    cd "$srcdir/kismet"
    make DESTDIR="$pkgdir/" install
    # install systemd service
    install -vDm 644 "packaging/systemd/kismet.service" "${pkgdir}/usr/lib/system/systemd/kismet.service"

    # Makepkg strip bug #43600
    chmod u+w "${pkgdir}"/usr/bin/kismet*
    chmod o-x "${pkgdir}"/usr/bin/kismet_cap*
    chown 0:315 "${pkgdir}"/usr/bin/kismet_cap*

    # create group kismet via sysusers
    cd "$srcdir"
    install -vDm 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/kismet.conf"
}

# vim: set ts=4 sw=4 et:
