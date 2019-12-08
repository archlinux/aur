# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

_pkgver=5.2.$(curl -s http://download.virtualbox.org/virtualbox|grep -v _|sed -n -E '/href="5\.2/ { s:[^"]+"5\.2\.::; s:/".+::; p }'|sort -n|tail -1)
_arcname=Oracle_VM_VirtualBox_Extension_Pack-$_pkgver.vbox-extpack
_source=http://download.virtualbox.org/virtualbox/$_pkgver/$_arcname

pkgname=virtualbox-ext-oracle-5
pkgver=$_pkgver
pkgrel=1
pkgdesc="Oracle VM VirtualBox Extension Pack $pkgver"
arch=(x86_64)
url=https://www.virtualbox.org/
license=(custom:PUEL)
options=('!strip')
provides=(virtualbox-ext-oracle-5 virtualbox-ext-oracle-5.2)
conflicts=(virtualbox-ext-oracle virtualbox-ext-oracle-5-test-build virtualbox-ext-oracle-5.0 virtualbox-ext-oracle-5.2)
install=virtualbox-ext-oracle-5.install
optdepends=('rdesktop: client to connect vm via RDP')
depends=("virtualbox>=$pkgver" 'virtualbox<6')

prepare()
{
	[[ -f $_arcname ]] || curl -qLo $_arcname $_source
}

package()
{
	# shrink uneeded cpuarch
	[[ -d shrunk ]] || mkdir shrunk
	tar xfC $_arcname shrunk
	rm -r shrunk/{darwin*,solaris*,win*,linux.x86}
	tar -c --gzip --file shrunk.vbox-extpack -C shrunk .

	install -Dm 644 shrunk.vbox-extpack \
		$pkgdir/usr/share/virtualbox/extensions/$_arcname
	install -Dm 644 shrunk/ExtPack-license.txt \
		$pkgdir/usr/share/licenses/$pkgname/PUEL
}

