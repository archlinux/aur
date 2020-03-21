# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: DaZ <daz.root+arch@gmail.coM>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>
# Contributor: Chris Cromer <chris@cromer.cl>

pkgname=networkmanager-consolekit
pkgver=1.22.10
pkgrel=1
_pppver=2.4.7
pkgdesc="NetworkManager with ConsoleKit support for non-systemd systems and user applications"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL2.1')
url="https://wiki.gnome.org/Projects/NetworkManager"
depends=("libnm>=$pkgver" 'iproute2' 'polkit-consolekit' 'consolekit'
         'wpa_supplicant' 'libmm-glib' 'libnewt' 'libndp' 'libteam' 'bluez-libs'
         'curl' 'libpsl' 'audit' 'mobile-broadband-provider-info')
makedepends=('intltool' 'dhclient' 'iptables' 'gobject-introspection' 'gtk-doc'
             "ppp=$_pppver" 'modemmanager' 'vala' 'perl-yaml' 'python-gobject'
             'git' 'jansson' 'glib2-docs' 'dhcpcd' 'iwd' 'dnsmasq')
optdepends=('modemmanager: for modem management service'
            'dhclient: External DHCP client'
            'dhcpcd: alternative DHCP client'
            'dnsmasq: connection sharing'
            'bluez: bluetooth support'
            'openresolv: resolvconf support'
            'ppp: dialup connection support'
            'iwd: wpa_supplicant alternative')
provides=("networkmanager=$pkgver")
replaces=('networkmanager')
conflicts=('networkmanager')
backup=('etc/NetworkManager/NetworkManager.conf')
groups=('gnome')
install=networkmanager.install
_commit=3216c292a670b6c91a932c94c26aed0c8dedaa38  # tags/1.22.10^0
source=(#https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz
        "git+https://gitlab.freedesktop.org/NetworkManager/NetworkManager.git#commit=$_commit"
        NetworkManager.conf
        networkmanager.rc
        20-connectivity.conf
        )
sha256sums=('SKIP'
            '535f9c54ee29c35ca7b44c15f8de2e781c10d6f3324338c483bef360ad777efc'
            'e39a2a0401518abd1d1d060200e2ca0f0854cdc49a5cb286919be177a7cd90fc'
            '477d609aefd991c48aca93dc7ea5a77ebebf46e0481184530cceda4c0d8d72c6')

prepare() {
  cd NetworkManager

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd NetworkManager

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    runstatedir=/run \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-ifcfg-rh \
    --disable-ifupdown \
    --disable-lto \
    --disable-more-logging \
    --disable-more-warnings \
    --disable-qt \
    --disable-static \
    --enable-bluez5-dun \
    --enable-concheck \
    --enable-gtk-doc \
    --enable-introspection \
    --enable-json-validation \
    --enable-ld-gc \
    --enable-modify-system \
    --enable-polkit \
    --enable-polkit-agent \
    --enable-teamdctl \
    --enable-tests=no \
    --enable-wifi \
    --with-config-dhcp-default=internal \
    --with-config-dns-rc-manager-default=symlink \
    --with-config-logging-backend-default=syslog \
    --with-config-plugins-default=keyfile \
    --with-crypto=nss \
    --with-dbus-sys-dir=/usr/share/dbus-1/system.d \
    --with-dhclient=/usr/bin/dhclient \
    --with-dhcpcd=/usr/bin/dhcpcd \
    --with-dist-version="$pkgver-$pkgrel" \
    --with-dnsmasq=/usr/bin/dnsmasq \
    --with-dnssec-trigger=/usr/lib/dnssec-trigger/dnssec-trigger-script \
    --with-hostname-persist=default \
    --with-iptables=/usr/bin/iptables \
    --with-iwd \
    --with-kernel-firmware-dir=/usr/lib/firmware \
    --with-libaudit=yes \
    --with-libpsl \
    --with-modem-manager-1 \
    --with-nm-cloud-setup=yes \
    --with-nmcli \
    --with-nmtui \
    --with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
    --with-pppd=/usr/bin/pppd \
    --with-resolvconf=/usr/bin/resolvconf \
    --with-session-tracking=consolekit \
    --with-suspend-resume=consolekit \
    --with-system-ca-path=/etc/ssl/certs \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-udev-dir=/usr/lib/udev \
    --with-wext \
    --without-dhcpcanon \
    --without-more-asserts \
    --without-netconfig \
    --without-ofono \
    --without-selinux \
    --without-systemd-journal # comment this line if want to be able to switch
                              # between "syslog" and "journal" logging backends

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd NetworkManager
  make DESTDIR="$pkgdir" install

  install -dm700 "$pkgdir"/etc/NetworkManager/system-connections
  install -d "$pkgdir"/etc/NetworkManager/{conf,dnsmasq}.d

  install -D -m755 "$srcdir"/networkmanager.rc "$pkgdir"/etc/rc.d/networkmanager
  install -D -m644 "$srcdir"/NetworkManager.conf "$pkgdir"/etc/NetworkManager/
  install -Dm644 ../20-connectivity.conf \
    "$pkgdir"/usr/lib/NetworkManager/conf.d/20-connectivity.conf

  # remove conflicting files from libnm, etc
  shopt -s globstar

  rm "$pkgdir"/usr/lib/libnm*
  rm -r "$pkgdir"/usr/lib/girepository-1.0
  rm -r "$pkgdir"/usr/share/gir-1.0
  rm -r "$pkgdir"/usr/share/gtk-doc/html/libnm*
  rm -r "$pkgdir"/usr/share/vala/vapi
  rm -r "$pkgdir"/usr/include
  rm -r "$pkgdir"/usr/lib/pkgconfig
  rm -r "$pkgdir"/usr/lib/**/*nm-cloud-setup*
}
