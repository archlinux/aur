# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=textract
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Standalone desktop application for easy texture extraction & deskewing from images"
arch=('x86_64')
url="https://github.com/simonsanchezart/textract"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo' 'glib2' 'dbus' 'libsoup3' 'libgcc' 'hicolor-icon-theme')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
options=('!debug')
source=(
	"$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/Textract_${pkgver}_amd64.deb"
	"LICENSE-$pkgver::https://raw.githubusercontent.com/simonsanchezart/textract/4b4aa736b8b8ae92a18700f07ca913fcfc3ef77d/LICENSE"
)
sha256sums=('4185b8bb905bd5c2ba9c8a805b8ea26da05d43fd3cf799322ae7d1de326a7063'
            'a6d017f384c7e3587cb84784e8e3cb7d9557320a0cd6fbffb72488a4bd29c9c8')
noextract=("$_pkgname-$pkgver.deb")

package() {
	cd "$srcdir"
	bsdtar -xf "$_pkgname-$pkgver.deb"
	bsdtar -xf data.tar.* -C "$pkgdir"

	install -dm755 "$pkgdir/usr/lib/$_pkgname"
	mv "$pkgdir/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$_pkgname"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<'EOF'
#!/bin/sh
exec env WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/lib/textract/textract "$@"
EOF

	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
