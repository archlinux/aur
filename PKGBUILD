# Maintainer: a13xie <rostik.medved@gmail.com>
pkgname=('libproidplus-gui')
pkgver=2.4.2
pkgrel=7
_filename="libproidplus-gui_${pkgver}-0_amd64"
pkgdesc="Library for ProID+ SmartCards"
makedepends=(jq)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')

prepare () {
	_downloadurl=$(curl -X 'GET' 'https://api.appcenter.ms/v0.1/public/sdk/apps/99e7966f-a82f-4930-9ba2-dad36fc61924/distribution_groups/cfb2aaa1-0ae6-4937-8b7e-b99b6e3f03cf/releases/latest' -H 'accept: application/json' | jq '.download_url' | tr -d '"')
	# echo $_downloadurl
	curl $_downloadurl -L --insecure --output "$_filename.deb.zip"
	mkdir "$srcdir/$pkgname"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/${_filename}.deb.zip"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/$pkgname/${_filename}.deb"
	echo "$(cat $srcdir/$pkgname/${_filename}.sha256 | cut -d ' ' -f1) $srcdir/$pkgname/${_filename}.deb" | sha256sum --check --status
}

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/$pkgname/data.tar.xz"
	mv "$pkgdir/usr/lib/x86_64-linux-gnu/pkcs11" "$pkgdir/usr/lib/pkcs11"
	ln -s "/usr/lib/x86_64-linux-gnu/libproidproxyp11.so" "$pkgdir/usr/lib/pkcs11/"
	find $pkgdir -type d -exec chmod -c 755 {} +
	sed -i 's/libproidcm11.so/libproidproxyp11.so/g' "$pkgdir/usr/share/p11-kit/modules/proidplus.module"
}
