# Maintainer: a13xie <rostik.medved@gmail.com>
pkgname='proidcm'
pkgver=1.0.2
pkgrel=1
_filename="${pkgname}-${pkgver}-0.amd64"
pkgdesc="Graphical utility for managing ProID Smart Cards"
makedepends=(jq)
depends=(libproidplus-gui qt6-base)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')

prepare () {
	_downloadurl=$(curl -X 'GET' 'https://api.appcenter.ms/v0.1/public/sdk/apps/df6ee913-ddd5-45dc-b900-d552dd6b70cf/distribution_groups/9c35c8de-3b0d-4643-9920-f373d1c42bba/releases/latest' -H 'accept: application/json' | jq '.download_url' | tr -d '"')
	# echo $_downloadurl
	curl $_downloadurl -L --insecure --output "$_filename.deb.zip"
	mkdir "$srcdir/$pkgname"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/${_filename}.deb.zip"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/$pkgname/${_filename}.deb"
	echo "$(cat $srcdir/$pkgname/${_filename}.deb.sha256 | cut -d ' ' -f1) $srcdir/$pkgname/${_filename}.deb" | sha256sum --check --status
}

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/$pkgname/data.tar.xz"
	# mv "$pkgdir/usr/lib/x86_64-linux-gnu/pkcs11" "$pkgdir/usr/lib/pkcs11"
	# ln -s "/usr/lib/x86_64-linux-gnu/libproidproxyp11.so" "$pkgdir/usr/lib/pkcs11/"
	find $pkgdir -type d -exec chmod -c 755 {} +
	# sed -i 's/libproidcm11.so/libproidproxyp11.so/g' "$pkgdir/usr/share/p11-kit/modules/proidplus.module"
}
