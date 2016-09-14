# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-faenza-icon-theme
_gitname=arc-icon-theme
pkgver=20160605.r5.g664c05e
pkgrel=2
pkgdesc='Combination of Arc icon theme and Faenza dark icon theme. Also includes some icons from other sets for icon sizes 22 and 24.'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git' 'automake')
optdepends=('moka-icon-theme-git: Arc icon theme was built to be used on top of Moka icon theme')
source=("git://github.com/horst3180/${_gitname}.git"
	"http://ppa.launchpad.net/tiheum/equinox/ubuntu/pool/main/f/faenza-icon-theme/faenza-icon-theme_1.3.1.tar.gz"
	"battery-caution-charging.png"
	"battery-caution.png"
	"battery-empty-charging.png"
	"battery-empty.png"
	"battery-full-charged.png"
	"battery-full-charging.png"
	"battery-full.png"
	"battery-good-charging.png"
	"battery-good.png"
	"battery-low-charging.png"
	"battery-low.png"
	"battery-missing.png"
	"battery-medium-charging.png"
	"battery-medium.png"
	"airplane-mode.svg")

md5sums=('SKIP' 'b5339b70cbb821b583499e725957b150' '3c4e718b0a7fb58cbd46962567e980c4'
	'b7000d3df5774786b2c7de564cb52237' 'a54c4c88cc03bb340f3651d740a1982a' 'c795d7010ea6609d434474aa66f14b46'
	'07cf9a2228dc6bf28ba861479e83efe6' '343416bd31877c3acbac2c6d18112576' '37588cc481ea6b0380494e333d52da17'
	'88b3b5ccc66d391b5852df38244daa9d' 'd4b18c94fe8eff161e3d26e5707ffc07' '92eb69e53e9cb618de5422aaf5f5c8a2'
	'217b35ad7d271fbb8bd429ef8c1685a7' '6509ca08aa1fee355146c83a68121283' '5b0a6bb242d09d6e8cbae7c064d6bd4b'
	'b89d594d68c0972ac866c5af1e9cefb7' '2d14c4ab5aafbab861ef417445e7c279')

size="22"

pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr
	make
}

add_file() {
	source_dir="$1"
	i="$2"
	filename=${i%.png}
	png="${filename}.png"
	svg="${filename}.svg"
	rm -f "$svg" "$png"
	cp ${source_dir}/${png} .
	if [ "$size" == "22" ]; then
		rm -f "../../panel/${size}/$svg" "../../panel/${size}/$png"
		ln -s "../../status/${size}/$png" "../../panel/${size}/$png"
	fi
}

add_bundled() {
	size="$1"
	cd "${pkgdir}/usr/share/icons/Arc/panel/${size}"
	rm -f battery-plugged.svg 2>&1 >/dev/null
	ln -s "../../status/${size}/battery-full-charged.png" "battery-plugged.png"
	cd "${pkgdir}/usr/share/icons/Arc/status/${size}"
	rm -f battery-plugges.svg 2>&1 >/dev/null
	add_file "${srcdir}" "battery-caution-charging.png"
	add_file "${srcdir}" "battery-caution.png"
	add_file "${srcdir}" "battery-empty-charging.png"
	add_file "${srcdir}" "battery-empty.png"
	add_file "${srcdir}" "battery-full-charged.png"
	add_file "${srcdir}" "battery-full-charging.png"
	add_file "${srcdir}" "battery-full.png"
	add_file "${srcdir}" "battery-good-charging.png"
	add_file "${srcdir}" "battery-good.png"
	add_file "${srcdir}" "battery-low-charging.png"
	add_file "${srcdir}" "battery-low.png" 
	add_file "${srcdir}" "battery-missing.png"
	add_file "${srcdir}" "battery-medium-charging.png"
	add_file "${srcdir}" "battery-medium.png"
	ln -s "battery-full-charged.png" "battery-plugged.png"
}

link_icon() {
	icon_source="$1"
	icon_target="$2"
	filename=${icon_target%.png}
	svg="${filename}.svg"
	rm -f "$icon_target" "$svg"
	ln -s "$icon_source" "$icon_target"
	if [ "$size" == "22" ]; then
		cd "../../panel/${size}/"
		rm -f "$icon_target" "$svg"
		ln -s "../../status/${size}/$icon_source" "$icon_target"
		cd "../../status/${size}/"
	fi
}

add_faenza_icons() {
	size="$1"
	faenza_dir="${srcdir}/faenza-icon-theme-1.3/Faenza-Dark/status/${size}"

	# Audio/Speaker icons
	cd "${pkgdir}/usr/share/icons/Arc/status/${size}"
	
	add_file "${faenza_dir}" "audio-volume-high-panel.png"
	add_file "${faenza_dir}" "audio-volume-high.png"
	add_file "${faenza_dir}" "audio-volume-low-panel.png"
	add_file "${faenza_dir}" "audio-volume-low.png"
	add_file "${faenza_dir}" "audio-volume-medium-panel.png"
	add_file "${faenza_dir}" "audio-volume-medium.png"
	add_file "${faenza_dir}" "audio-volume-muted-blocked-panel.png"
	add_file "${faenza_dir}" "audio-volume-muted-panel.png"
	add_file "${faenza_dir}" "audio-volume-muted.png"
	add_file "${faenza_dir}" "audio-volume-off.png"
	add_file "${faenza_dir}" "audio-volume-zero-panel.png"

	link_icon "audio-volume-zero-panel.png" "audio-volume-low-zero-panel.png"
	link_icon "audio-volume-muted-blocked-panel.png" "audio-volume-muted-blocking-panel.png"

	link_icon "audio-volume-low.png" "stock_volume-0.png"
	link_icon "audio-volume-high.png" "stock_volume-max.png"
	link_icon "audio-volume-medium.png" "stock_volume-med.png"
	link_icon "audio-volume-low.png" "stock_volume-min.png"
	link_icon "audio-volume-muted.png" "stock_volume-mute.png"
	link_icon "audio-volume-high.png" "stock_volume.png"

	# Battery icons
	cd "${pkgdir}/usr/share/icons/Arc/status/${size}"
	
	add_file "${faenza_dir}" "gpm-primary-000-charging.png"
	add_file "${faenza_dir}" "gpm-primary-000.png"
	add_file "${faenza_dir}" "gpm-primary-020-charging.png"
	add_file "${faenza_dir}" "gpm-primary-020.png"
	add_file "${faenza_dir}" "gpm-primary-040-charging.png"
	add_file "${faenza_dir}" "gpm-primary-040.png"
	add_file "${faenza_dir}" "gpm-primary-060-charging.png"
	add_file "${faenza_dir}" "gpm-primary-060.png"
	add_file "${faenza_dir}" "gpm-primary-080-charging.png"
	add_file "${faenza_dir}" "gpm-primary-080.png"
	add_file "${faenza_dir}" "gpm-primary-100-charging.png"
	add_file "${faenza_dir}" "gpm-primary-100.png"
	add_file "${faenza_dir}" "gpm-primary-charged.png"
	add_file "${faenza_dir}" "gpm-primary-missing.png"

	link_icon "gpm-primary-000-charging.png" "gpm-battery-000-charging.png"
	link_icon "gpm-primary-000-charging.png" "gpm-ups-000-charging.png"
	link_icon "gpm-primary-000-charging.png" "notification-battery-000-plugged.png"
	link_icon "gpm-primary-000-charging.png" "notification-gpm-battery-000-charging.png"
	link_icon "gpm-primary-000-charging.png" "notification-gpm-ups-000-charging.png"
	link_icon "gpm-primary-000-charging.png" "xfpm-battery-000-charging.png"
	link_icon "gpm-primary-000-charging.png" "xfpm-primary-000-charging.png"

	link_icon "gpm-primary-000.png" "battery-000.png"
	link_icon "gpm-primary-000.png" "battery-empty-symbolic.png"
	link_icon "gpm-primary-000.png" "battery_empty.png"
	link_icon "gpm-primary-000.png" "gmp-ups-missing.png"
	link_icon "gpm-primary-000.png" "gmp-battery-000.png"
	link_icon "gpm-primary-000.png" "gpm-ups-000.png"
	link_icon "gpm-primary-000.png" "notification-battery-000.png"
	link_icon "gpm-primary-000.png" "notification-battery-empty.png"
	link_icon "gpm-primary-000.png" "notification-gpm-battery-000.png"
	link_icon "gpm-primary-000.png" "notification-gpm-battery-empty.png"
	link_icon "gpm-primary-000.png" "notification-gpm-ups-000.png"
	link_icon "gpm-primary-000.png" "xfm-battery-000.png"
	link_icon "gpm-primary-000.png" "xfpm-primary-000.png"

	link_icon "gpm-primary-020-charging.png" "battery-caution-charging-symbolic.png"
	link_icon "gpm-primary-020-charging.png" "gpm-battery-020-charging.png"
	link_icon "gpm-primary-020-charging.png" "gpm-ups-020-charging.png"
	link_icon "gpm-primary-020-charging.png" "notification-battery-020-plugged.png"
	link_icon "gpm-primary-020-charging.png" "notification-gpm-battery-020-charging.png"
	link_icon "gpm-primary-020-charging.png" "notification-gpm-ups-020-charging.png"
	link_icon "gpm-primary-020-charging.png" "xfpm-battery-020-charging.png"
	link_icon "gpm-primary-020-charging.png" "xfpm-primary-020-charging.png"

	link_icon "gpm-primary-020.png" "battery-caution-symbolic.png"
	link_icon "gpm-primary-020.png" "battery_caution.png"
	link_icon "gpm-primary-020.png" "gpm-battery-020.png"
	link_icon "gpm-primary-020.png" "gpm-ups-020.png"
	link_icon "gpm-primary-020.png" "notification-battery-020.png"
	link_icon "gpm-primary-020.png" "notification-battery-low.png"
	link_icon "gpm-primary-020.png" "notification-gpm-battery-020.png"
	link_icon "gpm-primary-020.png" "notification-gpm-ups-020.png"
	link_icon "gpm-primary-020.png" "xfpm-battery-020.png"
	link_icon "gpm-primary-020.png" "xfpm-primary-020.png"

	link_icon "gpm-primary-040-charging.png" "battery-low-charging-symbolic.png"
	link_icon "gpm-primary-040-charging.png" "gpm-battery-040-charging.png"
	link_icon "gpm-primary-040-charging.png" "gpm-ups-040-charging.png"
	link_icon "gpm-primary-040-charging.png" "notification-battery-040-plugged.png"
	link_icon "gpm-primary-040-charging.png" "notification-gpm-battery-040-charging.png"
	link_icon "gpm-primary-040-charging.png" "notification-gpm-ups-040-charging.png"
	link_icon "gpm-primary-040-charging.png" "xfpm-battery-040-charging.png"
	link_icon "gpm-primary-040-charging.png" "xfpm-primary-040-charging.png"

	link_icon "gpm-primary-040.png" "battery-low-symbolic.png"
	link_icon "gpm-primary-040.png" "battery_low.png"
	link_icon "gpm-primary-040.png" "gpm-battery-040.png"
	link_icon "gpm-primary-040.png" "gpm-ups-040.png"
	link_icon "gpm-primary-040.png" "notification-battery-040.png"
	link_icon "gpm-primary-040.png" "notification-gpm-battery-040.png"
	link_icon "gpm-primary-040.png" "notification-gpm-ups-040.png"
	link_icon "gpm-primary-040.png" "xfpm-battery-040.png"
	link_icon "gpm-primary-040.png" "xfpm-primary-040.png"

	link_icon "gpm-primary-060-charging.png" "battery-good-charging-symbolic.png"
	link_icon "gpm-primary-060-charging.png" "gpm-battery-060-charging.png"
	link_icon "gpm-primary-060-charging.png" "gpm-ups-060-charging.png"
	link_icon "gpm-primary-060-charging.png" "notification-battery-060-plugged.png"
	link_icon "gpm-primary-060-charging.png" "notification-gpm-battery-060-charging.png"
	link_icon "gpm-primary-060-charging.png" "notification-gpm-ups-060-charging.png"
	link_icon "gpm-primary-060-charging.png" "xfpm-battery-060-charging.png"
	link_icon "gpm-primary-060-charging.png" "xfpm-primary-060-charging.png"

	link_icon "gpm-primary-060.png" "battery-good-symbolic.png"
	link_icon "gpm-primary-060.png" "battery_two_thirds.png"
	link_icon "gpm-primary-060.png" "gpm-battery-060.png"
	link_icon "gpm-primary-060.png" "gpm-ups-060.png"
	link_icon "gpm-primary-060.png" "notification-battery-060.png"
	link_icon "gpm-primary-060.png" "notification-gpm-battery-060.png"
	link_icon "gpm-primary-060.png" "notification-gpm-ups-060.png"
	link_icon "gpm-primary-060.png" "xfpm-battery-060.png"
	link_icon "gpm-primary-060.png" "xfpm-primary-060.png"

	link_icon "gpm-primary-080-charging.png" "gpm-battery-080-charging.png"
	link_icon "gpm-primary-080-charging.png" "gpm-ups-080-charging.png"
	link_icon "gpm-primary-080-charging.png" "notification-battery-080-plugged.png"
	link_icon "gpm-primary-080-charging.png" "notification-gpm-battery-080-charging.png"
	link_icon "gpm-primary-080-charging.png" "notification-gpm-ups-080-charging.png"
	link_icon "gpm-primary-080-charging.png" "xfpm-battery-080-charging.png"
	link_icon "gpm-primary-080-charging.png" "xfpm-primary-080-charging.png"

	link_icon "gpm-primary-080.png" "battery_third_fouth.png"
	link_icon "gpm-primary-080.png" "gpm-battery-080.png"
	link_icon "gpm-primary-080.png" "gpm-ups-080.png"
	link_icon "gpm-primary-080.png" "notification-battery-080.png"
	link_icon "gpm-primary-080.png" "notification-gpm-battery-080.png"
	link_icon "gpm-primary-080.png" "notification-gpm-ups-080.png"
	link_icon "gpm-primary-080.png" "xfpm-battery-080.png"
	link_icon "gpm-primary-080.png" "xfpm-primary-080.png"

	link_icon "gpm-primary-100-charging.png" "battery-full-charging-symbolic.png"
	link_icon "gpm-primary-100-charging.png" "gpm-battery-100-charging.png"
	link_icon "gpm-primary-100-charging.png" "gpm-ups-100-charging.png"
	link_icon "gpm-primary-100-charging.png" "notification-battery-100-plugged.png"
	link_icon "gpm-primary-100-charging.png" "notification-gpm-battery-100-charging.png"
	link_icon "gpm-primary-100-charging.png" "notification-gpm-ups-100-charging.png"
	link_icon "gpm-primary-100-charging.png" "xfpm-battery-100-charging.png"
	link_icon "gpm-primary-100-charging.png" "xfpm-primary-100-charging.png"

	link_icon "gpm-primary-100.png" "battery-full-symbolic.png"
	link_icon "gpm-primary-100.png" "battery_full.png"
	link_icon "gpm-primary-100.png" "gpm-battery-100.png"
	link_icon "gpm-primary-100.png" "gpm-ups-100.png"
	link_icon "gpm-primary-100.png" "notification-battery-100.png"
	link_icon "gpm-primary-100.png" "notification-gpm-battery-100.png"
	link_icon "gpm-primary-100.png" "notification-gpm-ups-100.png"
	link_icon "gpm-primary-100.png" "xfpm-battery-100.png"
	link_icon "gpm-primary-100.png" "xfpm-primary-100.png"

	link_icon "gpm-primary-missing.png" "battery-missing-symbolic.png"

	link_icon "gpm-primary-charged.png" "battery-full-charged-symbolic.png"
	link_icon "gpm-primary-charged.png" "battery_charged.png"
	link_icon "gpm-primary-charged.png" "battery_plugged.png"
	link_icon "gpm-primary-charged.png" "gpm-ac-adapter.png"
	link_icon "gpm-primary-charged.png" "gpm-battery-charged.png"
	link_icon "gpm-primary-charged.png" "gpm-primary-charged.png"
	link_icon "gpm-primary-charged.png" "notification-gpm-battery-charged.png"
	link_icon "gpm-primary-charged.png" "xfpm-ac-adapter.png"
	link_icon "gpm-primary-charged.png" "xfpm-battery-charged.png"
	link_icon "gpm-primary-charged.png" "xfpm-primary-charged.png"

	# Various icons
	cd "${pkgdir}/usr/share/icons/Arc/status/${size}"

	add_file "${faenza_dir}" "dialog-password.png"
	add_file "${faenza_dir}" "gtk-dialog-authentication-panel.png"
	add_file "${faenza_dir}" "dialog-warning.png"
	add_file "${faenza_dir}" "gtk-dialog-warning-panel.png"
	add_file "${faenza_dir}" "guake-tray.png"
	add_file "${faenza_dir}" "krb-expiring-ticket.png"
	add_file "${faenza_dir}" "krb-no-valid-ticket.png"
	add_file "${faenza_dir}" "krb-valid-ticket.png"
	add_file "${faenza_dir}" "locked.png"
	add_file "${faenza_dir}" "printer-error.png"
	add_file "${faenza_dir}" "printer-printing.png"
	add_file "${faenza_dir}" "reboot-notifier.png"
	

	link_icon "dialog-password.png" "gtk-dialog-authentication.png"
	link_icon "dialog-warning.png" "gtk-dialog-warning.png"

	link_icon "locked.png" "gnome-dev-wavelan-encrypted.png"
	link_icon "locked.png" "keys.png"
	link_icon "locked.png" "network-wireless-encrypted.png"
	link_icon "locked.png" "nm-vpn-standalone-lock.png"
	link_icon "locked.png" "status_lock.png"
	link_icon "locked.png" "stock_lock.png"
	link_icon "locked.png" "xfce-system-lock.png"
	link_icon "reboot-notifier.png" "system-restart-panel.png"
	link_icon "reboot-notifier.png" "system-shutdown-restart-panel.png"

	# GSM icons

	add_file "${faenza_dir}" "gsm-3g-full-secure.png"
	add_file "${faenza_dir}" "gsm-3g-full.png"
	add_file "${faenza_dir}" "gsm-3g-high-secure.png"
	add_file "${faenza_dir}" "gsm-3g-high.png"
	add_file "${faenza_dir}" "gsm-3g-low-secure.png"
	add_file "${faenza_dir}" "gsm-3g-low.png"
	add_file "${faenza_dir}" "gsm-3g-medium-secure.png"
	add_file "${faenza_dir}" "gsm-3g-medium.png"
	add_file "${faenza_dir}" "gsm-3g-none-secure.png"
	add_file "${faenza_dir}" "gsm-3g-none.png"

	# Network icons

	add_file "${faenza_dir}" "network-error.png"
	add_file "${faenza_dir}" "network-idle.png"
	#add_file "${faenza_dir}" "network-offline.png"
	add_file "${faenza_dir}" "network-receive.png"
	add_file "${faenza_dir}" "network-transmit.png"
	add_file "${faenza_dir}" "network-transmit-receive.png"
	add_file "${faenza_dir}" "network-wired-disconnected.png"
	add_file "${faenza_dir}" "radiotray_connecting.png"
	add_file "${faenza_dir}" "radiotray_off.png"
	add_file "${faenza_dir}" "radiotray_on.png"

	link_icon "locked.png" "network-wireless-encrypted.png"

	# NetworkManager icons

	add_file "${faenza_dir}" "nm-adhoc.png"
	add_file "${faenza_dir}" "nm-device-wired-secure.png"
	#add_file "${faenza_dir}" "nm-no-connection.png"
	add_file "${faenza_dir}" "nm-vpn-lock.png"

	add_file "${faenza_dir}" "nm-signal-00-secure.png"
	add_file "${faenza_dir}" "nm-signal-00.png"
	add_file "${faenza_dir}" "nm-signal-25-secure.png"
	add_file "${faenza_dir}" "nm-signal-25.png"
	add_file "${faenza_dir}" "nm-signal-50-secure.png"
	add_file "${faenza_dir}" "nm-signal-50.png"
	add_file "${faenza_dir}" "nm-signal-75-secure.png"
	add_file "${faenza_dir}" "nm-signal-75.png"
	add_file "${faenza_dir}" "nm-signal-100-secure.png"
	add_file "${faenza_dir}" "nm-signal-100.png"

	rm -f "network-offline.svg" "nm-no-connection.svg"
	ln -s "../scalable/airplane-mode.svg" "network-offline.svg"
	ln -s "../scalable/airplane-mode.svg" "nm-no-connection.svg"
	
	if [ "$size" == "22" ]; then
		cd ../../panel/${size}
		rm -f "network-offline.svg" "nm-no-connection.svg"
		ln -s "../scalable/airplane-mode.svg" "network-offline.svg"
		ln -s "../scalable/airplane-mode.svg" "nm-no-connection.svg"
		cd ../../status/${size}
	fi

	link_icon "nm-adhoc.png" "nm-device-wired.png"
	link_icon "nm-adhoc.png" "nm-device-wired-autoip.png"
	link_icon "nm-signal-00-secure.png" "nm-signal-0-secure.png"
	link_icon "nm-signal-00.png" "nm-signal-0.png"
	link_icon "nm-signal-100.png" "nm-device-wwan.png"
	link_icon "nm-signal-100.png" "nm-device-wireless.png"

	link_icon "network-transmit-receive.png" "connect_creating.png"
	link_icon "network-transmit-receive.png" "connect_established.png"
	link_icon "network-offline.svg" "connect_no.svg"

	link_icon "nm-signal-25.png" "gnome-netstatus-0-24.png"
	link_icon "nm-signal-50.png" "gnome-netstatus-25-49.png"
	link_icon "nm-signal-75.png" "gnome-netstatus-50-74.png"
	link_icon "nm-signal-100.png" "gnome-netstatus-75-100.png"
	link_icon "network-error.png" "gnome-netstatus-disconn.png"
	link_icon "network-error.png" "gnome-netstatus-error.png"
	link_icon "network-idle.png" "gnome-netstatus-idle.png"
	link_icon "network-receive.png" "gnome-netstatus-rx.png"
	link_icon "network-transmit.png" "gnome-netstatus-tx.png"
	link_icon "network-transmit-receive.png" "gnome-netstatus-txrx.png"

	link_icon "nm-vpn-lock.png" "nm-secure-lock.png"
	link_icon "nm-vpn-lock.png" "nm-vpn-active-lock.png"
	link_icon "nm-vpn-lock.png" "nm-vpn-connecting12.png"
	link_icon "nm-vpn-lock.png" "nm-vpn-connecting13.png"
	link_icon "nm-vpn-lock.png" "nm-vpn-connecting14.png"
	link_icon "locked.png" "nm-vpn-standalone-lock.png"

}

package() {
  	cd "${srcdir}/${_gitname}"
	make DESTDIR="$pkgdir" install

	mkdir "${pkgdir}/usr/share/icons/Arc/status/scalable"
	cp "${srcdir}/airplane-mode.svg" "${pkgdir}/usr/share/icons/Arc/status/scalable/"
	mkdir "${pkgdir}/usr/share/icons/Arc/panel/scalable"
	cd "${pkgdir}/usr/share/icons/Arc/panel/scalable"
	ln -s ../../status/scalable/airplane-mode.svg

	add_bundled 22
	add_faenza_icons 22
	add_faenza_icons 24

	sed "s|Name=Arc|Name=Arc-Faenza|g" -i "${pkgdir}/usr/share/icons/Arc/index.theme"
	sed "s|Comment=Arc Icon theme|Comment=Arc-Faenza Icon theme|g" -i "${pkgdir}/usr/share/icons/Arc/index.theme"

	mv "${pkgdir}/usr/share/icons/Arc" "${pkgdir}/usr/share/icons/Arc-Faenza"
	gtk-update-icon-cache "${pkgdir}/usr/share/icons/Arc-Faenza"
}
