# Maintainer: k8ie <k8ie@mcld.eu>
pkgname='proidcm'
pkgver=1.0.2
pkgrel=3
_filename="${pkgname}-${pkgver}-0.amd64"
pkgdesc="Graphical utility for managing ProID Smart Cards"
depends=(libproidplus-gui qt6-base)
makedepends=(sed curl)
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')

prepare () {
	_sourceurl=$(curl https://appcenter.proid.cz/download?solutionId=1aba3679-25ec-4ca2-b854-c787550a6753 | grep sasurl | sed -n 's/.*sasurl:"\([^"]*\)".*/\1/p' || exit 1)
	curl -OJ $_sourceurl
	bsdtar -xf "$srcdir/${_filename}.deb.zip"
	echo "$(cat $srcdir/$_filename.deb.sha256 | cut -d ' ' -f1) $srcdir/$_filename.deb" | sha256sum --check --status
	bsdtar -xf "$srcdir/$_filename.deb"
}

package () {
	bsdtar -C "$pkgdir" -xf "$srcdir/data.tar.xz"
	find $pkgdir -type d -exec chmod -c 755 {} +
}
