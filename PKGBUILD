# Maintainer: Laurent Brock <incognito0135@protonmail.com>
pkgname=piavpn-bin
pkgver=3.5_07703
_pkgver=${pkgver/\.0_/_}
_pkgver=${_pkgver/_/-}
pkgrel=1
pkgdesc="Private Internet Access client"
# https://www.privateinternetaccess.com/pages/changelog
arch=('x86_64' 'aarch64')
url="https://privateinternetaccess.com/"
license=('custom')
depends=(libxkbcommon-x11 libnl zip)
optdepends=('WIREGUARD-MODULE: to use the wireguard kernel module instead')
makedepends=(libcap)
provides=(piavpn)
conflicts=(pia-launch pia-manager pia-tools private-internet-access-vpn)
install=piavpn-bin.install
source_x86_64=("https://installers.privateinternetaccess.com/download/pia-linux-${_pkgver}.run")
source_aarch64=("https://installers.privateinternetaccess.com/download/pia-linux-arm64-${_pkgver}.run")
options=(!strip)
sha256sums_x86_64=('0e29185e6adbc0d8dfaa435f693d84bd982dbc2e75453e18472afa52285d1252')
sha256sums_aarch64=('23ba6bdb1c8ee85cc9cd5d14a5ab5359717a19eb246247221a192ad1d74b100c')

# == You need to enable and start piavpn.service. Run sudo systemctl enable --now piavpn.service ==
prepare() {
	_pia_run="pia-linux-${_pkgver}.run"
	if [ "$CARCH" == "aarch64" ] ;then
		_pia_run="pia-linux-arm64-${_pkgver}.run"
	fi
	env -i /bin/sh $_pia_run --noexec --target "${srcdir}/$pkgname-${_pkgver}"
}

package() {
	cd "$pkgname-$_pkgver"
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
