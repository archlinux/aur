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
pkgver=1.4.2
pkgrel=1
pkgdesc="Network Management daemon with scan disabled after connection established"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1')
url="http://www.gnome.org/projects/NetworkManager/"
provides=('networkmanager')
conflicts=('networkmanager' 'networkmanager-consolekit')
makedepends=('intltool' 'dhclient' 'iptables' 'gobject-introspection' 'gtk-doc'
			"ppp=$_pppver" 'modemmanager' 'dbus-glib' 'iproute2' 'nss'
			 'polkit-consolekit' 'wpa_supplicant' 'libsoup' 'eudev-systemd' 'libgudev' 'libmm-glib'
			 'rp-pppoe' 'libnewt' 'libndp' 'libteam' 'vala' 'perl-yaml' 'python-gobject')
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

# _commit=c87b89bf8f7d0e45df08e84503eb16f5ef2ce3c6
# "git://anongit.freedesktop.org/NetworkManager/NetworkManager#commit=$_commit"

source=("https://download.gnome.org/sources/NetworkManager/${pkgver:0:3}/NetworkManager-$pkgver.tar.xz"
        'disable_wifi_scan_when_connected.patch'
        'NetworkManager.conf'
        '01-org.freedesktop.NetworkManager.settings.modify.system.rules'
        '50-org.freedesktop.NetworkManager.rules')
sha256sums=('a864e347ddf6da8dabd40e0185b8c10a655d4a94b45cbaa2b3bb4b5e8360d204'
            '3dfabdccd97074c948c924ece87935576e64675bdfef478e800a6da882861c2d'
            '452e4f77c1de92b1e08f6f58674a6c52a2b2d65b7deb0ba436e9afa91ee15103'
            '4b815f43de58379e68653d890f529485aec4d2f83f11d050b08b31489d2267c2'
            '02d9f7d836d297d6ddf39482d86a8573b3e41735b408aa2cd6df22048ec5f6c4')

# pkgver() {
#   cd NetworkManager
#   git describe | sed 's/-dev/dev/;s/-/+/g'
# }

prepare() {
  cd NetworkManager-$pkgver

  2to3 -w libnm src tools

  # disable wifi scans when connected
  patch -Np1 -i ../disable_wifi_scan_when_connected.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd NetworkManager-$pkgver
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/networkmanager \
		--with-crypto=nss \
		--with-dhclient=/usr/bin/dhclient \
		--without-dhcpcd \
		--with-dnsmasq=/usr/bin/dnsmasq \
		--with-iptables=/usr/bin/iptables \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--with-udev-dir=/usr/lib/udev \
		--with-resolvconf=/usr/bin/resolvconf \
		--with-pppd=/usr/bin/pppd \
		--with-pppd-plugin-dir=/usr/lib/pppd/$_pppver \
		--with-pppoe=/usr/bin/pppoe \
		--with-kernel-firmware-dir=/usr/lib/firmware \
		--with-session-tracking=ck \
		--with-modem-manager-1 \
		--disable-static \
		--enable-more-warnings=no \
		--disable-wimax \
		--enable-modify-system \
		--enable-doc \
		--enable-gtk-doc

	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

	make
}

check() {
	cd NetworkManager-$pkgver
	make -k check
}

package() {
	cd NetworkManager-$pkgver
	make DESTDIR="$pkgdir" install
	make DESTDIR="$pkgdir" -C libnm uninstall
	make DESTDIR="$pkgdir" -C libnm-glib uninstall
	make DESTDIR="$pkgdir" -C libnm-util uninstall
	make DESTDIR="$pkgdir" -C vapi uninstall

	# Some stuff to move is left over
	rm -r "$pkgdir/usr/include"
	rm -r "$pkgdir/usr/lib/pkgconfig"

	install -m644 ../NetworkManager.conf "$pkgdir/etc/NetworkManager/"
	install -m755 -d "$pkgdir/etc/NetworkManager/dnsmasq.d"

	rm -r "$pkgdir/var/run"
	rmdir -p --ignore-fail-on-non-empty \
	"$pkgdir"/usr/{share/{vala/vapi,gir-1.0},lib/girepository-1.0}

    	install -dm 750 -o polkitd "${pkgdir}"/usr/share/polkit-1/rules.d

	install -m 644 ${srcdir}/01-org.freedesktop.NetworkManager.settings.modify.system.rules $pkgdir/usr/share/polkit-1/rules.d/

	install -m 644 ${srcdir}/50-org.freedesktop.NetworkManager.rules $pkgdir/usr/share/polkit-1/rules.d/

}
