#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgbase=jcdk-classic
pkgname=("$pkgbase"{,-doc})
pkgver=3.0.5u1
pkgrel=3
arch=('any')
url="https://www.oracle.com/java/java-card.html"
license=('custom')
makedepends=('msitools')
options=('!strip')
source=("http://download.oracle.com/otn-pub/java/java_card_kit/3.0.5/java_card_kit-classic-3_0_5-u1-win32-do-b35-15_may_2017.msi"
        "$pkgbase.sh")
md5sums=('bf7e66cdc37aa1c022d8cb2b38a1443c'
         '98c628b901809a5cc61c3987e8d35314')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=accept-securebackup-cookie -o %o %u')

prepare() {
	msiextract "${source##*/}"
}

package_jcdk-classic() {
	pkgdesc="Java Card Classic Development Kit"
	depends=('java-environment>=7')

	# shellcheck disable=SC2154
	install -Dm755 -t "$pkgdir/etc/profile.d" "$pkgbase.sh"
	cd "Program Files/Oracle/Java Card Development Kit 3.0.5dev"

	install -d "$pkgdir/usr/share/$pkgbase"
	cp -a api_export_files "$pkgdir/usr/share/$pkgbase"

	install -Dm644 -t "$pkgdir/usr/share/java/$pkgbase" lib/*.jar
	ln -s "/usr/share/java/$pkgbase" "$pkgdir/usr/share/$pkgbase/lib"

	install -Dm644 -t "$pkgdir/etc/$pkgbase" lib/logging.properties
	ln -s "/etc/$pkgbase/logging.properties" "$pkgdir/usr/share/java/$pkgbase"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgbase" legal/*
}

package_jcdk-classic-doc() {
	pkgdesc="Java Card Classic Development Kit Documentation"

	install -d "$pkgdir/usr/share/doc/$pkgbase"
	cp -a "Program Files/Oracle/Java Card Development Kit 3.0.5dev"/docs/* \
		"$pkgdir/usr/share/doc/$pkgbase"
}
