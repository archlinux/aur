# Maintainer: Michael Streif <streifmi@gmail.com>

pkgname=(composefs libcomposefs)
pkgbase=composefs
pkgver=v1.0.3
pkgrel=1
arch=('x86_64')
url="https://github.com/containers/composefs"
makedepends=(git go-md2man fuse3)

_tag=41bf41bda3f950dd094077dc887af948df2819c2 # git rev-parse "v$pkgver"
source=(git+https://github.com/containers/composefs.git?signed#tag=$_tag)

pkgver() {
    cd "$pkgbase"
    git describe
}

sha256sums=('SKIP')
validpgpkeys=(6A2B067FB5E17A1A3FC8A0DAEB6216DDB76C70E9) # Alexander Larsson <alexl@redhat.com>

build() {
	cd "$pkgbase"
	autoreconf -fis
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--enable-man \
		--disable-static \
		--with-fuse
	make
}

package_libcomposefs() {
  	pkgdesc="Libraries for composefs"
  	license=('LGPL-2.1-or-later AND (GPL-2.0-only OR Apache-2.0)')
  	depends=(openssl)
	
	cd "$pkgbase/$pkgname"
	make DESTDIR="$pkgdir/" install
}

package_composefs() {
 	pkgdesc="Tools to handle creating and mounting composefs images"
 	license=('GPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0')
 	depends=(libcomposefs)

 	cd "$pkgbase/tools"
 	make DESTDIR="$pkgdir/" install
  
 	# Copy man files
	install -d -m 755 "$pkgdir/usr/share/man/man1"
	install -d -m 755 "$pkgdir/usr/share/man/man5"
	install -m 644 "$srcdir/$pkgbase/man/mount.composefs.1" "$pkgdir/usr/share/man/man1/"
	install -m 644 "$srcdir/$pkgbase/man/mkcomposefs.1" "$pkgdir/usr/share/man/man1/"
	install -m 644 "$srcdir/$pkgbase/man/composefs-info.1" "$pkgdir/usr/share/man/man1/"
	install -m 644 "$srcdir/$pkgbase/man/composefs-dump.5" "$pkgdir/usr/share/man/man5/"
}
