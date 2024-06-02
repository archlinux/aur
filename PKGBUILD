# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=wg++
pkgver=5.1.5
pkgrel=9
pkgdesc='WebGrab+Plus is a Freeware, closed-source multi-site incremental XMLTV EPG grabber'
arch=('any')
url="http://webgrabplus.com/"
license=('custom')
depends=('dotnet-runtime-8.0' 'unzip' 'libxml2' 'curl' 'wget')
source=("$pkgname-5.1.0.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"$pkgname-$pkgver.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_V${pkgver}_beta_install.tar.gz"
	'wgpp.sh')
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
            '8d9b7cdff826ae4bd8aa8f033bafcf5bea6525b3b6fbdebf724918b1ba788ad0'
            'bb940c9e7bfd186b781ca9a5f69e3e47dfc26f654101903a3533797a98206092')

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
	find "$pkgdir" -name '*.sh' -type f -exec chmod u=rwx,go=rx {} \;
	install -Dm755 "$srcdir/wgpp.sh" "$pkgdir/usr/bin/$pkgname"
}
