#Maintainer: Antony Rinaldi <antony@atyrnal.dev>

pkgname=swiftpoint-x1-control-panel
pkgver=3.1.4.0
pkgrel=3
pkgdesc="Control panel for Swiftpoint devices"
arch=('x86_64')
url="https://support.swiftpoint.com/portal/en/kb/articles/swiftpoint-x1-control-panel-download"
license=('custom')
options=(!debug)
provides=(swiftpoint-x1-control-panel)
conflicts=(swiftpoint-x1-control-panel)
optdepends=('gnome-shell-extension-appindicator: tray icon on GNOME')
backup=('etc/xdg/Swiftpoint X1 Control Panel/policy.ini') #Leave any user changes to policy.ini
source=(
   	"Swiftpoint_X1_Control_Panel_${pkgver}.tar.xz::https://swiftpointdrivers.blob.core.windows.net/pro/public/linux/Swiftpoint%20X1%20Control%20Panel%20${pkgver}-33507352.tar.xz"
	"com.swiftpoint.png::https://support.swiftpoint.com/portal/api/publicImages/236657000020283222?portalId=edbsn0d3aa90196a4e3b6b39dfa53f41ea57346e362747d42eef1744d58b0281647e9"
	"com.swiftpoint.X1_Control_Panel.desktop"
)
install=Swiftpoint_X1_Control_Panel.install
sha256sums=('59324a145e7fcc2f5a54b38789bea9d99aea941e7b29fc63d148da7e28411913'
            'a7117e87abf569325fe6257d5ec5e7043b156d06feebd9ac22bd54f181b936f9'
            '1f392375193f0ce122b0d0c8f10e3f50b6ca60f0fbfdd6e3f26f3b765ee14c0d')

package() {
	cd "${srcdir}/Swiftpoint X1 Control Panel ${pkgver}"

	# Install binary
	install -Dm755 "Swiftpoint X1 Control Panel" \
		"$pkgdir/usr/lib/swiftpoint/Swiftpoint X1 Control Panel"

	# Copy config and starter mappings
	install -Dm644 "qt.conf" \
		"$pkgdir/usr/lib/swiftpoint/qt.conf"
	install -Dm644 "Starter Mappings.spcf" \
		"$pkgdir/usr/lib/swiftpoint/Starter Mappings.spcf"
	
	# Copy subdirectories 
	cp -r lib "$pkgdir/usr/lib/swiftpoint/lib"
	cp -r plugins "$pkgdir/usr/lib/swiftpoint/plugins"
	cp -r translations "$pkgdir/usr/lib/swiftpoint/translations"
	cp -r profiles "$pkgdir/usr/lib/swiftpoint/profiles"
	cp -r fw "$pkgdir/usr/lib/swiftpoint/fw"

	# Create a wrapper script to ensure libaries load correctly
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/swiftpoint-x1-control-panel" <<EOF
#!/bin/sh
export LD_LIBRARY_PATH="/usr/lib/swiftpoint/lib:\$LD_LIBRARY_PATH"
exec "/usr/lib/swiftpoint/Swiftpoint X1 Control Panel" "\$@"
EOF

	# Install udev rules
    install -Dm644 "60-Swiftpoint.rules" \
        "$pkgdir/usr/lib/udev/rules.d/60-Swiftpoint.rules"

	# Install icons, license, and desktop file
	install -Dm644 "${srcdir}/com.swiftpoint.png" \
		"$pkgdir/usr/share/pixmaps/com.swiftpoint.png"
	install -Dm644 "${srcdir}/com.swiftpoint.X1_Control_Panel.desktop" \
		"$pkgdir/usr/share/applications/com.swiftpoint.X1_Control_Panel.desktop"
	install -Dm644 "Swiftpoint X1 Control Panel Licence.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "THIRD-PARTY-NOTICES.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"

	#The custom service was removed as of package ver 3.1.4.0-2. If you want autostart, copy the .desktop file
	#To your ~/.config/autostart directory.

	# Disable swiftpoint's auto update feature (since we're managing versions with pacman)
	# This can be re-enabled by editing /etc/xdg/Swiftpoint X1 Control Panel/policy.ini
	install -Dm644 /dev/stdin "$pkgdir/etc/xdg/Swiftpoint X1 Control Panel/policy.ini" <<EOF
[General]
DisableUpdates=true
EOF
}
