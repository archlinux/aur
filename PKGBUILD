# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

_pkgver=5.2.34

pkgname=virtualbox-ext-oracle-5
pkgver=$_pkgver
pkgrel=1
pkgdesc="Oracle VM VirtualBox Extension Pack $pkgver"
arch=(x86_64)
url=https://www.virtualbox.org/
license=(custom:PUEL)
options=('!strip')
conflicts=(virtualbox-ext-oracle virtualbox-ext-oracle-5.0)
install=virtualbox-ext-oracle.install
optdepends=('rdesktop: client to connect vm via RDP')

package()
{
	depends=(virtualbox=$pkgver)
	arcname=Oracle_VM_VirtualBox_Extension_Pack-$pkgver.vbox-extpack

	[[ -f $arcname ]] || curl -q -L -o $arcname http://download.virtualbox.org/virtualbox/$pkgver/$arcname

	# shrink uneeded cpuarch
	[[ -d shrunk ]] || mkdir shrunk
	tar xfC $arcname shrunk
	rm -r shrunk/{darwin*,solaris*,win*,linux.x86}
	tar -c --gzip --file shrunk.vbox-extpack -C shrunk .

	install -Dm 644 shrunk.vbox-extpack \
		$pkgdir/usr/share/virtualbox/extensions/$arcname
	install -Dm 644 shrunk/ExtPack-license.txt \
		$pkgdir/usr/share/licenses/$pkgname/PUEL
}

