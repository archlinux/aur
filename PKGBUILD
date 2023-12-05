# Maintainer: pappy <pa314159@users.noreply.github.com>

_pkgname=virtualbox-ext-oracle
_pkgver=6.1.$(curl -s http://download.virtualbox.org/virtualbox|grep -v _|sed -n -E '/href="6\.1/ { s:[^"]+"6\.1\.::; s:/".+::; p }'|sort -n|tail -1)
_arcname=Oracle_VM_VirtualBox_Extension_Pack-$_pkgver.vbox-extpack
_source=http://download.virtualbox.org/virtualbox/$_pkgver/$_arcname

pkgname=virtualbox6-ext-oracle
pkgver=$_pkgver
pkgrel=3
pkgdesc="Oracle VM VirtualBox Extension Pack $pkgver (stable)"
arch=(x86_64)
url=https://www.virtualbox.org/
license=(custom:PUEL)
options=('!strip')
provides=(virtualbox-ext-oracle)
conflicts=(virtualbox-ext-oracle)
install=virtualbox-ext-oracle.install
optdepends=('rdesktop: client to connect vm via RDP')
depends=("virtualbox>=6.1" 'virtualbox<7')

prepare()
{
	[[ -f $_arcname ]] || curl -q -fsSLo $_arcname $_source
}

package()
{
	# shrink uneeded cpuarch
	[[ -d shrunk ]] || mkdir shrunk
	tar xfC $_arcname shrunk
	rm -r shrunk/{darwin*,solaris*,win*}
	tar -c --gzip --file shrunk.vbox-extpack -C shrunk .

	install -Dm 644 shrunk.vbox-extpack \
		$pkgdir/usr/share/virtualbox/extensions/$_arcname
	install -Dm 644 shrunk/ExtPack-license.txt \
		$pkgdir/usr/share/licenses/$_pkgname/PUEL
}

