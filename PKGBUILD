# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgbase=recoil
pkgname=(recoil2png recoil-thumbnailer recoil-mime)
pkgdesc='Converter for native picture formats of retro computers'
pkgver=6.4.5
pkgrel=1
url=https://recoil.sourceforge.net
license=(GPL2)
arch=(x86_64)
depends=(libpng)
makedepends=(libxslt)
source=("https://downloads.sourceforge.net/project/recoil/$pkgbase/$pkgver/$pkgbase-$pkgver.tar.gz"
        makefile-install.patch)
b2sums=('17f07b29e7509a089652ea272189e98ef5b25510a63022026b1b0ded3836df060e9be16e10b45eb3bb990482d241d9106ef8b76460bbf743eb187a6aa1540e4f'
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
