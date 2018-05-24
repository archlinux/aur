# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

_version=3.12.0
_patch=01

pkgname=nexus-oss
pkgver=${_version}.${_patch}
pkgrel=1
pkgdesc='Nexus 3 Repository OSS'
arch=('any')
url='http://nexus.sonatype.org'
license=('custom:sonatype')
depends=('jre8-openjdk-headless')
replaces=('nexus3')
provides=($pkgname)
backup=("var/lib/$pkgname/etc/nexus.properties"
		"usr/lib/$pkgname/bin/nexus.vmoptions"
		)
source=("http://download.sonatype.com/nexus/3/nexus-$_version-$_patch-unix.tar.gz"
		"$pkgname"
		"$pkgname.install"
		"$pkgname.properties"
		"$pkgname.service"
		"$pkgname.sysusers"
		"$pkgname.tmpfiles"
		"$pkgname.vmoptions"
		"pref_jre.cfg"
		)
sha256sums=('8c6c8fac1828c3471cd7107bd46493db66b085071ae03205befcad411eade0e2'
            '3d2ebc2a796dbdc7e7e3b97e4c3272292169c898776e111f503f0517e434caff'
            '0c8003d478cf12115e236e7e25ce86cd9f1a6f9c8d1c8e41ed17156c8f6d2d08'
            'dcdef5614db12f38b3da0b9de1b52fb7fa402af6621a825981c6168a34a6ad9b'
            '3670748854d3f05623c9a8826605c3e2a97c7b3955104e74b5eed00ed17299c1'
            '77d699b5ccf6387fa2f69df2cd71cdb75b4ffbf46a10110dd6c0e2802783dbef'
            '32bfa3f82038f89d2f7140eada1faadf416ae835d5e5cb0573c528398249a63e'
            '70ea18f8567b7368c5799141e5f1cd0ca7658d6e4a4d29c52a9288446c7cf341'
            'c55ed8e395f54d2374fd8e5fd3be90a044bd33701ad128e7516e905331b1adcc')

install=$pkgname.install

package() {
	install -dm755 $pkgdir/usr/lib
	install -dm750 $pkgdir/var/lib/$pkgname

	cp -a $srcdir/nexus-$_version-$_patch $pkgdir/usr/lib/$pkgname
	cp -a $srcdir/sonatype-work/nexus3/orient $pkgdir/var/lib/$pkgname

	pushd $pkgdir/usr/lib/$pkgname
	rm -rf bin/nexus.rc \
		bin/contrib \
		LICENSE.txt
	popd

	install -Dm640 $srcdir/$pkgname.properties $pkgdir/var/lib/$pkgname/etc/nexus.properties

	install -Dm644 $srcdir/nexus-$_version-$_patch/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.vmoptions $pkgdir/usr/lib/$pkgname/bin/nexus.vmoptions
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -m644 pref_jre.cfg $pkgdir/usr/lib/$pkgname/.install4j

	chmod -R o-rwx $pkgdir/var/lib/$pkgname
}

