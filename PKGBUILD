# Maintainer: Yingtong Li <archlinux@yingtongli.me>
pkgname=anyconnect-client
pkgver=4.5.04029
pkgrel=1
pkgdesc="Cisco AnyConnect Secure Mobility Client"
arch=('x86_64')
url="https://www.cisco.com/c/en_au/products/security/anyconnect-secure-mobility-client/index.html"
license=('custom')
source=("anyconnect-linux64-$pkgver-core-vpn-webdeploy-k9.sh" 'vpnagentd.service')
sha256sums=('SKIP' '39ea96d1c23ff45619f65e7e0d5bf0e375556ae22fc463f607d58bbb44a22636')
install='anyconnect-client.install'
options=('!strip') # Stripping binaries causes things to stop working

prepare() {
	# Separate script for processing
	TARLINE=$(grep -an 'BEGIN ARCHIVE' ${source[0]} | cut -d ":" -f 1)
	head -n $TARLINE ${source[0]} > anyconnect.sh
	tail -n +$(($TARLINE+1)) ${source[0]} > payload.tar.gz
	
	# Output to $pkgdir
	sed -i "s#/opt#$pkgdir/opt#g" anyconnect.sh
	sed -i "s#/etc#$pkgdir/etc#g" anyconnect.sh
	sed -i "s#/usr#$pkgdir/usr#g" anyconnect.sh
	
	# Skip .install stuff
	sed -i 's/# generate default/if false; then # generate default/g' anyconnect.sh
	sed -i 's/if \[ "${RMTEMP}" = "yes" \]; then/fi; if \[ "${RMTEMP}" = "yes" \]; then/g' anyconnect.sh
	
	# Assemble script
	cat payload.tar.gz >> anyconnect.sh
}

package() {
	mkdir -p "$pkgdir/etc/init.d"
	mkdir -p "$pkgdir/usr/share/desktop-directories"
	mkdir -p "$pkgdir/usr/share/applications"
	
	#export LD_LIBRARY_PATH="$pkgdir/opt/cisco/anyconnect/lib:$LD_LIBRARY_PATH"
	bash anyconnect.sh
	
	rm "$pkgdir/opt/cisco/anyconnect/"*.log
	
	sed -i "s#$pkgdir##g" "$pkgdir/opt/cisco/vpn/bin/vpndownloader.sh"
	
	rm -r "$pkgdir/etc/init.d"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install -m 0644 vpnagentd.service "$pkgdir/usr/lib/systemd/system/"
}
