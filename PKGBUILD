# Maintainer: Alexander Paetzelt <techge+arch [ät] posteo [do] net>
# parts are based on [extra] packet 'kismet' -> https://www.archlinux.org/packages/extra/x86_64/kismet/

pkgname=kismet-git
pkgver=r11317.c9009e7e6
pkgrel=1
pkgdesc="802.11 layer2 wireless network detector, sniffer, and intrusion detection system"
url="https://www.kismetwireless.net/"
arch=('x86_64')
license=('GPL')
depends=('bluez-libs'
         'gcc-libs'
         'glibc'
         'libcap'
         'libelf'
         'libnl'
         'libnm'
         'libcap-ng'
         'libnm.so'
         'libpcap'
         'libpcap.so'
         'libprotobuf.so'
         'libprotobuf-c.so'
         'libsensors.so'
         'libusb'
         'libusb-1.0.so'
         'libwebsockets'
         'libwebsockets.so'
         'lm_sensors'
         'pcre'
         'protobuf-c'
         'python'
         'python-setuptools'
         'python-protobuf'
         'python-pyserial'
         'python-numpy'
         'python-websockets'
         'sqlite'
         'systemd'
         'zlib')
makedepends=('git' 'python-setuptools')
optdepends=('festival: text-to-speech support'
            'flite:  alternative/lightweight text-to-speech support'
            'gpsd: log coordinates of detected networks'
            'hackrf: use with HackRF compatible software defined radio (SDR)'
            'sox: provide the default kismet sound playback binary'
            'wireshark-cli: provide OUI files used to determine device manufacturer'
            'wireshark-cli: mergecap, to merge multiple capture files')
backup=(etc/kismet/kismet.conf
        etc/kismet/kismet_80211.conf
        etc/kismet/kismet_alerts.conf
        etc/kismet/kismet_filter.conf
        etc/kismet/kismet_httpd.conf
        etc/kismet/kismet_logging.conf
        etc/kismet/kismet_memory.conf
        etc/kismet/kismet_uav.conf)
conflicts=('kismet')
install=${pkgname}.install
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
    # patch setup.py install command
    find . -name Makefile.in -exec sed -i 's/setup.py install/setup.py install -O1/' {} \;
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
    
    # Makepkg strip bug #43600
    chmod u+w "${pkgdir}"/usr/bin/kismet*
    chmod o-x "${pkgdir}"/usr/bin/kismet_cap*
    chown 0:315 "${pkgdir}"/usr/bin/kismet_cap*

    # create group kismet via sysusers
    cd "$srcdir"
    install -vDm 644 "${pkgname}-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
