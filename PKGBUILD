# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

_testv=5.2.35
_testb=135314
_arcname=Oracle_VM_VirtualBox_Extension_Pack-$_testv-$_testb.vbox-extpack

pkgname=virtualbox-ext-oracle-5-test-build
pkgver=${_testv}_${_testb}
pkgrel=1
pkgdesc="Oracle VM VirtualBox Extension Pack Test Build $pkgver"
arch=(x86_64)
url=https://www.virtualbox.org/wiki/Testbuilds
license=(custom:PUEL)
options=('!strip')
provides=(virtualbox-ext-oracle-5 virtualbox-ext-oracle-5.2)
conflicts=(virtualbox-ext-oracle virtualbox-ext-oracle-5 virtualbox-ext-oracle-5.0 virtualbox-ext-oracle-5.2)
install=$pkgname.install
optdepends=('rdesktop: client to connect vm via RDP')
depends=("virtualbox>=$_testv" 'virtualbox<6')
source=(http://www.virtualbox.org/download/testcase/$_arcname)
noextract=($_arcname)
sha256sums=('738efcef9791196d7e292919bd9c2322960780b4881d4984f40103d2e37b082f')

package()
{
	# shrink uneeded cpuarch
	[[ -d shrunk ]] || mkdir shrunk
	tar xfC $_arcname shrunk
	rm -r shrunk/{darwin*,solaris*,win*,linux.x86}
	tar -c --gzip --file shrunk.vbox-extpack -C shrunk .

	install -Dm 644 shrunk.vbox-extpack \
		$pkgdir/usr/share/virtualbox/extensions/Oracle_VM_VirtualBox_Extension_Pack-$pkgver-$pkgrel.testbuild.vbox-extpack
	install -Dm 644 shrunk/ExtPack-license.txt \
		$pkgdir/usr/share/licenses/$pkgname/PUEL
}

