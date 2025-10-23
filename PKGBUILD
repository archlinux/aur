# Maintainer: pappy <pa314159@users.noreply.github.com>

# https://help.sonatype.com/en/download-archives---repository-manager-3.html
_version=3.85.0
_patch=03

pkgname=nexus-oss
pkgver=${_version}.${_patch}
pkgrel=1
pkgdesc='Nexus 3 Repository OSS'
arch=('any')
url='http://nexus.sonatype.org'
license=("LicenseRef-$pkgname")
depends=('java-runtime-headless=17')
provides=($pkgname)
backup=("var/lib/$pkgname/etc/nexus.properties"
		"etc/conf.d/$pkgname"
		)
source=(
		"https://download.sonatype.com/nexus/3/nexus-$_version-$_patch-linux-x86_64.tar.gz"
		"$pkgname.sh"
		"$pkgname.service"
		"$pkgname.conf"
		"$pkgname.tmpfiles"
		"$pkgname.sysusers"
		"$pkgname.install"
		"$pkgname.properties"
		)
sha256sums=('526a632670c79b90f96f45549678751e99d4c1666543ef7bb922db1a037f8849'
            '07bd3fa49504b4ae85c7affd502c3ec3564aad7a34852e825eaef2fe994cf142'
            '424d0d8f2bf6376f09c22b4fe9425899b8521999e86a1201650f4a4f342154b7'
            'b38c7ca66cfe1f9e9866056df43d26a0d94ff09e78600d29636bef64cf755b87'
            'efd66ac28e622cdf58f5733bdced6654b170558834c3e4304b3a2dfb7d964994'
            '77d699b5ccf6387fa2f69df2cd71cdb75b4ffbf46a10110dd6c0e2802783dbef'
            'bff7354310f920d3062055cf04a695ec0eeb76e0ab275bd9ae27041c3a3c45ab'
            'd4076f486fc6b2cc6bb457f874a2082c7ab018f407744b83f5edbd36573e00ac')

install=$pkgname.install

package() {
	install -dm755 $pkgdir/usr/lib
	install -dm775 $pkgdir/usr/share/licenses/$pkgname
	install -dm750 $pkgdir/var/lib/$pkgname
	install -dm750 $pkgdir/var/log/$pkgname

	rm -r nexus-$_version-$_patch/jdk
	cp -a nexus-$_version-$_patch $pkgdir/usr/lib/$pkgname

	install -dm755 $pkgdir/usr/lib/sonatype-work
	ln -s ../../../var/lib/$pkgname $pkgdir/usr/lib/sonatype-work/nexus3

	install -Dm755 $pkgname.sh "$pkgdir/usr/lib/$pkgname/bin/nexus-oss"
	install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 $pkgname.conf "$pkgdir/etc/conf.d/$pkgname"
	install -Dm644 $pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 $pkgname.properties $pkgdir/var/lib/$pkgname/etc/nexus.properties

	pushd $pkgdir/usr/lib/$pkgname
	rm bin/nexus
	sed -i \
		-e "s:@version@:$_version:g" \
		-e "s:@patch@:$_patch:g" \
	   	bin/nexus-oss
	sed -i -E \
		-e "s:\.\./sonatype-work/nexus3:/var/lib/$pkgname:g" \
		-e "s/#.*//" \
		-e "/^\s*$/d" \
		-e "/^-Xm/d" \
		bin/nexus.vmoptions
	install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname
	popd

	chmod -R o-rwx $pkgdir/var/lib/$pkgname
}

