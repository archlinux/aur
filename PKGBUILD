# Maintainer: k8ie <k8ie@mcld.eu>
pkgname=('libproidplus-gui')
pkgver=2.5.0
pkgrel=2
_filename="libproidplus-gui-${pkgver}-0.amd64"
pkgdesc="Library for ProID+ SmartCards"
makedepends=(sed curl)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')

prepare () {
	_sourceurl=$(curl https://appcenter.proid.cz/download\?solutionId\=0e627b2e-fe68-49e9-aef9-a2ead6a21d9b | grep sasurl | sed -n 's/.*sasurl:"\([^"]*\)".*/\1/p' || exit 1)
	curl -OJ $_sourceurl
	bsdtar -xf "$srcdir/${_filename}.deb.zip"
	echo "$(cat $srcdir/$_filename.deb.sha256 | cut -d ' ' -f1) $srcdir/$_filename.deb" | sha256sum --check --status
	bsdtar -xf "$srcdir/$_filename.deb"
}

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/data.tar.xz"
	mv "$pkgdir/usr/lib/x86_64-linux-gnu/pkcs11" "$pkgdir/usr/lib/pkcs11"
	ln -s "/usr/lib/x86_64-linux-gnu/libproidproxyp11.so" "$pkgdir/usr/lib/pkcs11/"
	find $pkgdir -type d -exec chmod -c 755 {} +
	sed -i 's/libproidcm11.so/libproidproxyp11.so/g' "$pkgdir/usr/share/p11-kit/modules/proidplus.module"
}
