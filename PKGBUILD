# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgbase=recoil
pkgname=(recoil2png recoil-thumbnailer recoil-mime)
pkgdesc='Converter for native picture formats of retro computers'
pkgver=6.3.4
pkgrel=1
url=https://recoil.sourceforge.net
license=(GPL2)
arch=(x86_64)
depends=(libpng)
makedepends=(libxslt)
source=("https://downloads.sourceforge.net/project/recoil/$pkgbase/$pkgver/$pkgbase-$pkgver.tar.gz"
        makefile-install.patch)
b2sums=('b27fbcc40bb996773fc5b8f62feb9d54cb29a28283ecb655127628610d7eb8474f3c3df05f656a527fdb620806d5617f831d16d1421fa2c861809623b4b60417'
        '22cd6ef6399c040e2baf768ba3c69d8bce559f1b27d3d8d8a76519844f7a5bf9b000ddb1b6dc225bbe3aae2bbef2698ea8cb8d6b7277035b04c352e5629c7fb2')

_make () {
	make -C "$pkgbase-$pkgver" \
		BUILDING_PACKAGE=1 \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
		"$@"
}

prepare () {
	patch -d "$pkgbase-$pkgver" -p0 < "$srcdir/makefile-install.patch"
}

build () {
	_make PREFIX=/usr recoil2png recoil-mime.xml
}

package_recoil2png () {
	pkgdesc+=' (command line tool)'
	_make PREFIX="$pkgdir/usr" install-recoil2png
}

package_recoil-thumbnailer () {
	pkgdesc+=' (GNOME thumbnailer)'
	depends+=(recoil2png recoil-mime)
	_make PREFIX="$pkgdir/usr" install-thumbnailer
}

package_recoil-mime () {
	pkgdesc+=' (MIME file type descriptions)'
	depends+=(shared-mime-info)
	_make PREFIX="$pkgdir/usr" install-mime
}
