# Maintainer: PhotonX <photon89 [at] gmail.com>.

pkgname=lightspeed-git
_realname=lightspeed
pkgver=r29.61dbfcb
pkgrel=2
pkgdesc="Interactively illustrates the effects of special relativity on the appearance of moving objects, git version"
arch=('i686' 'x86_64')
url="https://github.com/Photon89/lightspeed"
license=('MPL')
conflicts=('lightspeed')
depends=('gtkglarea' 'libgl')
optdepends=('libpng: Snapshot export to PNG file'
		'libtiff: Snapshot export to TIFF file')
makedepends=('git')
source=('lightspeed::git+https://github.com/Photon89/lightspeed.git'
	'lightspeed.desktop'
	'lightspeed.png')
md5sums=('SKIP'
	'31685ed3c366934e3fe56e918ca4354b'
	'85a0e71a3a860f1606e5de9215fad215')


build() {
	cd ${srcdir}/${_realname}
	sed -i 's|"objects"|"/usr/share/lightspeed/objects"|g' src/menu_cbs.c
	autoreconf -i
	./configure --prefix=/usr --with-gtkgl-prefix=/usr || return 1
	make || return 1
}

package(){
	cd ${srcdir}/${_realname}
	make DESTDIR="$pkgdir" install || return 1
	install -d -m755 "$pkgdir/usr/share/lightspeed/objects"
	cp -dr "$srcdir/$_realname/objects" "$pkgdir/usr/share/lightspeed/"
	install -D -m644 $srcdir/${_realname}.desktop ${pkgdir}/usr/share/applications/${_realname}.desktop
	install -D -m644 $srcdir/${_realname}.png ${pkgdir}/usr/share/pixmaps/${_realname}.png
}

pkgver() {
  cd "${srcdir}/${_realname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
