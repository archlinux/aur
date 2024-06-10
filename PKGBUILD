# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=wg++
pkgver=5.2
pkgrel=1
pkgdesc='WebGrab+Plus is a Freeware, closed-source multi-site incremental XMLTV EPG grabber'
arch=('any')
url="http://webgrabplus.com/"
license=('custom')
depends=('dotnet-runtime-8.0' 'unzip' 'libxml2' 'curl' 'wget')
source=("http://webgrabplus.com/sites/default/files/download/SW/V5.2.0/WebGrabPlus_V5.2_install.tar.gz"
	'wgpp.sh')
sha256sums=('dd472d58a84114d42776d3e04738f962b7a89e150dbd828d0db137a445ff8f1b'
            'ea58bc3aaa40c549808e185ed85356a3823490b9a37fd617cd7801358144b6cd')

prepare() {
	# Rename folder
	mv ".$pkgname" "$pkgname"
	# Check for latest version of SiteIniPack from 'http://webgrabplus.com/epg-channels'
	curl -sL http://webgrabplus.com/epg-channels | grep 'SiteIni\.Pack_' |
		sed -e 's/.*btn"><a href="//' -e 's/".*//' -e 's/[^0-9][^0-9][^0-9]*//g' >siteini_ver
	# Download latest version of SiteIniPack
	if [ -s siteini_ver ]; then
		_siteini_ver=$(cat siteini_ver)
		msg2 "Found latest SiteIniPack_V${_siteini_ver}"
		curl -LO http://webgrabplus.com/sites/default/files/download/ini/SiteIni.Pack_${_siteini_ver}.zip
		bsdtar -xf SiteIni.Pack_${_siteini_ver}.zip
		rm -r "$pkgname/siteini.pack.update/"*
		cp -r siteini.pack/* "$pkgname/siteini.pack.update"
	fi
	# Run 'install.sh' script
	cd "$pkgname"
	./install.sh
	# Fix for 'No Internet' issue
	sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml
}

package() {
	install -d "$pkgdir/usr/share/$pkgname"
	cp -a --no-preserve='mode,ownership' "$srcdir/$pkgname" "$pkgdir/usr/share"
	find "$pkgdir" -type f -name '*.sh' -exec chmod u=rwx,go=rx {} \;
	install -Dm755 "$srcdir/wgpp.sh" "$pkgdir/usr/bin/$pkgname"
}
