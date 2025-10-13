PACKAGER="Laurent Brock <incognito0135@protonmail.com>"
pkgname=piavpn-bin

pkgver=3.7
build_number=08412
# https://www.privateinternetaccess.com/pages/changelog

epoch=1 # Switch versioning schemes for guaranteed upgrades
pkgrel=1
pkgdesc="Private Internet Access client"
arch=('x86_64' 'aarch64')
url="https://privateinternetaccess.com/"
license=('custom')
depends=(libxkbcommon-x11 libnl zip)
optdepends=('WIREGUARD-MODULE: to use the wireguard kernel module instead')
makedepends=(libcap)
provides=(piavpn)
conflicts=(pia-launch pia-manager pia-tools private-internet-access-vpn)
install=piavpn-bin.install
source_x86_64=("https://installers.privateinternetaccess.com/download/pia-linux-${pkgver}-${build_number}.run")
source_aarch64=("https://installers.privateinternetaccess.com/download/pia-linux-arm64-${pkgver}-${build_number}.run")
options=(!strip)
sha256sums_x86_64=('328b4f046822d20cfc3b0175f6c9e53773c1765b0d408455da37e9f6d5cbda8b')
sha256sums_aarch64=('037937d19be0976f3bbbe9d6a85915888777c8732248f73f538302f6a5b71dd5')

# == You need to enable and start piavpn.service. Run sudo systemctl enable --now piavpn.service ==
prepare() {
	_pia_run="pia-linux-${pkgver}-${build_number}.run"
	if [ "$CARCH" == "aarch64" ] ;then
		_pia_run="pia-linux-arm64-${pkgver}-${build_number}.run"
	fi
	env -i /bin/sh $_pia_run --noexec --target "${srcdir}/$pkgname-${pkgver}-${build_number}"
}

check() {
	grep -a 'targetdir="pia-linux' "${srcdir}/pia-linux-${pkgver}-${build_number}.run" | cut -d'-' -f3
}

package() {
	cd "$pkgname-$pkgver-$build_number"
	mkdir -p $pkgdir/opt/piavpn/bin
	cp -a piafiles/* $pkgdir/opt/piavpn
	cp installfiles/*.sh $pkgdir/opt/piavpn/bin
	chmod +x $pkgdir/opt/piavpn/bin/*.sh
	setcap 'cap_net_bind_service=+ep' $pkgdir/opt/piavpn/bin/pia-unbound
	# we don't need these scripts
	rm $pkgdir/opt/piavpn/bin/install-wireguard.sh
	rm $pkgdir/opt/piavpn/bin/pia-uninstall.sh

	mkdir -p $pkgdir/usr/share/pixmaps
	cp installfiles/app-icon.png $pkgdir/usr/share/pixmaps/piavpn.png
	mkdir -p $pkgdir/usr/share/icons/hicolor/1024x1024/apps/
	ln -s /usr/share/pixmaps/pia.png $pkgdir/usr/share/icons/hicolor/1024x1024/apps/pia.png
	mkdir -p $pkgdir/usr/share/applications
	cp installfiles/piavpn.desktop $pkgdir/usr/share/applications/piavpn.desktop
	mkdir -p $pkgdir/etc/NetworkManager/conf.d
	echo -e "[keyfile]\nunmanaged-devices=interface-name:wgpia*" > $pkgdir/etc/NetworkManager/conf.d/50-wgpia.conf

	mkdir -p $pkgdir/usr/lib/systemd/system
	cp installfiles/piavpn.service $pkgdir/usr/lib/systemd/system/piavpn.service	
	sed -i '/^After/s/syslog.target //' $pkgdir/usr/lib/systemd/system/piavpn.service

	mkdir -p $pkgdir/usr/share/licenses/$pkgname/
	mv $pkgdir/opt/piavpn/share/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/

	# fix permissions: no need for executable bit
	find $pkgdir/usr -type f -exec chmod -x {} \;

	mkdir -p $pkgdir/usr/local/bin
	ln -s ../../../opt/piavpn/bin/piactl $pkgdir/usr/local/bin/piactl
	
	# limit log to the minimum to avoid excessive flooding
	mkdir -p $pkgdir/opt/piavpn/var
	cat > $pkgdir/opt/piavpn/var/debug.txt << EOF
	
[rules]
*.debug=false
*.info=false
*.warning=false
EOF

}
# == You need to enable and start piavpn.service. Run sudo systemctl enable --now piavpn.service ==
