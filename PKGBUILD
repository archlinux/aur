# Maintainer: Chris Cromer <chris@cromer.cl>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: DaZ <daz.root+arch@gmail.coM>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

_pppver=2.4.7

pkgname=networkmanager-consolekit-noscan
pkgver=1.6.2
pkgrel=3
pkgdesc="Network Management daemon with scan disabled after connection established"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
provides=('networkmanager')
conflicts=('networkmanager' 'networkmanager-consolekit')
makedepends=('intltool' 'dhclient' 'iptables' 'gobject-introspection' 'gtk-doc'
            "ppp=$_pppver" 'modemmanager' 'dbus-glib' 'iproute2' 'nss'
            'polkit-consolekit' 'wpa_supplicant' 'libsoup' 'eudev-systemd' 'libgudev' 'libmm-glib'
            'rp-pppoe' 'libnewt' 'libndp' 'libteam' 'vala' 'perl-yaml' 'python-gobject' 'git' 'vala'
            'jansson' 'bluez-libs' 'glib2-docs')
checkdepends=('libx11' 'python-dbus' 'eudev-systemd')
depends=('libnm-glib' 'iproute2' 'polkit-consolekit' 'wpa_supplicant' 'libsoup' 'libmm-glib' 'libnewt' 'libndp' 'libteam' 'consolekit' 'eudev')
optdepends=('dnsmasq: connection sharing'
            'bluez: Bluetooth support'
            'openresolv: resolvconf support'
            'ppp: dialup connection support'
            'rp-pppoe: ADSL support'
            'dhclient: External DHCP client'
            'modemmanager: cellular network support')
backup=('etc/NetworkManager/NetworkManager.conf')

_commit=037a12f96eff09aa48481fda7ea602a3388afc74  # tags/1.6.2^0
source=("git+https://anongit.freedesktop.org/git/NetworkManager/NetworkManager#commit=$_commit"
        #"https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz"
        'NetworkManager.conf'
        'disable_wifi_scan_when_connected.patch'
        '01-org.freedesktop.NetworkManager.settings.modify.system.rules'
        '50-org.freedesktop.NetworkManager.rules')
sha256sums=('SKIP'
            '452e4f77c1de92b1e08f6f58674a6c52a2b2d65b7deb0ba436e9afa91ee15103'
            '3dfabdccd97074c948c924ece87935576e64675bdfef478e800a6da882861c2d'
            '4b815f43de58379e68653d890f529485aec4d2f83f11d050b08b31489d2267c2'
            '02d9f7d836d297d6ddf39482d86a8573b3e41735b408aa2cd6df22048ec5f6c4')

# pkgver() {
#   cd NetworkManager
#   git describe | sed 's/-dev/dev/;s/-/+/g'
# }

prepare() {
  mkdir -p libnm{,-glib}/usr/{include,lib/{girepository-1.0,pkgconfig},share/{gir-1.0,gtk-doc/html,vala/vapi}}

  cd NetworkManager
  # disable wifi scans when connected
  patch -Np1 -i ../disable_wifi_scan_when_connected.patch
  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd NetworkManager
  git describe | sed 's/-dev/dev/;s/-/+/g'
}


# prepare() {
#   cd NetworkManager-$pkgver
#
#   2to3 -w libnm src tools
#
#   NOCONFIGURE=1 ./autogen.sh
# }

build() {
    cd NetworkManager #-$pkgver
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        runstatedir=/run \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/NetworkManager \
        --disable-ifcfg-rh \
        --disable-ifcfg-suse \
        --disable-ifnet \
        --disable-ifupdown \
        --disable-lto \
        --disable-more-warnings \
        --disable-static \
        --enable-bluez5-dun \
        --enable-concheck \
        --enable-config-plugin-ibft \
        --enable-gtk-doc \
        --enable-introspection \
        --enable-json-validation \
        --enable-ld-gc \
        --enable-modify-system \
        --enable-polkit=yes \
        --enable-polkit-agent \
        --enable-teamdctl \
        --enable-wifi \
        --with-config-dhcp-default=dhclient \
        --with-config-dns-rc-manager-default=resolvconf \
        --with-config-logging-backend-default=journal \
        --with-config-plugins-default=keyfile,ibft \
        --with-crypto=nss \
        --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
        --with-dhclient=/usr/bin/dhclient \
        --with-dist-version="$pkgver-$pkgrel, Arch Linux" \
        --with-dnsmasq=/usr/bin/dnsmasq \
        --with-dnssec-trigger=/usr/lib/dnssec-trigger \
        --with-hostname-persist=default \
        --with-iptables=/usr/bin/iptables \
        --with-kernel-firmware-dir=/usr/lib/firmware \
        --with-libnm-glib \
        --with-libsoup \
        --with-modem-manager-1 \
        --with-nmcli \
        --with-nmtui \
        --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
        --with-pppd=/usr/bin/pppd \
        --with-resolvconf=/usr/bin/resolvconf \
        --with-session-tracking=consolekit \
        --with-suspend-resume=consolekit \
        --with-system-ca-path=/etc/ssl/certs \
        --with-systemd-journal=no \
        --with-systemd-logind=no \
        --with-udev-dir=/usr/lib/udev \
        --with-wext \
        --with-consolekit=yes \
        --without-dhcpcd \
        --without-libaudit \
        --without-netconfig \
        --without-ofono \
        --without-selinux

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

check() {
    cd NetworkManager #-$pkgver
    make -k check
}

package() {
    cd NetworkManager #-$pkgver
    make DESTDIR="$pkgdir" install

    ### rm libnm

    cd ../libnm
    rm -rv "$pkgdir"/usr/include/libnm
    rm -rv  "$pkgdir"/usr/lib/girepository-1.0/NM-*
    rm -rv  "$pkgdir"/usr/lib/libnm.* usr/lib
    rm -rv  "$pkgdir"/usr/lib/pkgconfig/libnm.pc
    rm -rv  "$pkgdir"/usr/share/gir-1.0/NM-*
    rm -rv  "$pkgdir"/usr/share/gtk-doc/html/libnm
    rm -rv  "$pkgdir"/usr/share/vala/vapi/libnm.*

    ### rm libnm-glib

    cd ../libnm-glib
    rm -rv  "$pkgdir"/usr/include/*
    rm -rv  "$pkgdir"/usr/lib/girepository-1.0/*
    rm -rv  "$pkgdir"/usr/lib/libnm-*
    rm -rv  "$pkgdir"/usr/lib/pkgconfig/*
    rm -rv  "$pkgdir"/usr/share/gir-1.0/*
    rm -rv  "$pkgdir"/usr/share/gtk-doc/html/libnm-*
    rm -rv  "$pkgdir"/usr/share/vala/vapi/*

    rmdir -p --ignore-fail-on-non-empty \
    "$pkgdir"/usr/include \
    "$pkgdir"/usr/lib/{girepository-1.0,pkgconfig} \
    "$pkgdir"/usr/share/{gir-1.0,vala/vapi}

    install -m644 ${srcdir}/NetworkManager.conf "$pkgdir/etc/NetworkManager/"
    install -dm700 "$pkgdir/etc/NetworkManager/system-connections"
    install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d

    install -dm 750 -o polkitd "${pkgdir}"/usr/share/polkit-1/rules.d

    install -m 644 ${srcdir}/01-org.freedesktop.NetworkManager.settings.modify.system.rules $pkgdir/usr/share/polkit-1/rules.d/

    install -m 644 ${srcdir}/50-org.freedesktop.NetworkManager.rules $pkgdir/usr/share/polkit-1/rules.d/

    install -Dm644 ${srcdir}/20-connectivity.conf "$pkgdir/usr/lib/NetworkManager/conf.d/20-connectivity.conf"
}
