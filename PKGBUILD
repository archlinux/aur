# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=wg++
pkgver=5.1.5
pkgrel=4
pkgdesc="WebGrab+Plus is a Freeware, closed-source multi-site incremental XMLTV EPG grabber"
arch=(any)
url="http://webgrabplus.com/"
license=(custom)
depends=(
	dotnet-runtime-8.0
	libxml2
	unzip
)
source=("${pkgname}-5.1.0.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"${pkgname}-${pkgver}.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V${pkgver}/WebGrabPlus_V${pkgver}_beta_install.tar.gz"
	"http://webgrabplus.com/sites/default/files/download/ini/SiteIniPack_current.zip"
	'wgpp.sh')
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
            '8d9b7cdff826ae4bd8aa8f033bafcf5bea6525b3b6fbdebf724918b1ba788ad0'
            'f1878d4accc47677a52ada26672462af3a55b631636609e4c1009d6b9f216191'
            '940392becb59c70f97c5ed1a1d49aab7d69386b5a4bb724bd48b8da39e40e1cc')

prepare() {
	# Rename folder
	mv .$pkgname $pkgname
	# Install latest SiteIniPack from 'http://webgrabplus.com/node/231'
	cp -r siteini.pack/* $pkgname/siteini.pack.update
	# Run install.sh script
	cd $pkgname
	./install.sh
	# Fix for 'No Internet' issue
	sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml
}

package() {
	install -d "$pkgdir"/usr/share/$pkgname/{bin.net,doc,mdb,rex,siteini.pack,siteini.user}
	cp -r --no-preserve=mode,ownership "$srcdir"/$pkgname/{bin.net,doc,mdb,rex,siteini.pack} "$pkgdir"/usr/share/$pkgname
	install -Dm644 "$srcdir"/$pkgname/WebGrab++.config.example.xml "$pkgdir"/usr/share/$pkgname/WebGrab++.config.example.xml
	install -Dm644 "$srcdir"/$pkgname/WebGrab++.config.xml "$pkgdir"/usr/share/$pkgname/WebGrab++.config.xml
	install -Dm755 "$srcdir"/$pkgname/install.sh "$pkgdir"/usr/share/$pkgname/install.sh
	install -Dm755 "$srcdir"/$pkgname/run.net.sh "$pkgdir"/usr/share/$pkgname/run.net.sh
	install -Dm755 "$srcdir"/wgpp.sh "$pkgdir"/usr/bin/$pkgname
}
