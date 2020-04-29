# Maintainer: Bruce Zhang
pkgname="xmind-electron"
pkgver=10.1.2
release_date=202004142327
pkgrel=1
pkgdesc="XMind - The most popular mind mapping software"
arch=('x86_64')
url="https://www.xmind.net/xmind2020/"
license=('custom: XMind')
depends=('electron5')
provides=('xmind-zen-electron')
conflicts=('xmind-zen-electron')
source=(
	"$pkgname-$pkgver-$release_date.orig.rpm::https://dl3.xmind.net/XMind-2020-for-Linux-x86-64bit-$pkgver-$release_date.rpm"
	xmind.xml
)
sha256sums=('13b4111fef6ccaef65b773c8a98aafec6cea2ce82ebe40de778dc37d9cd1cd47'
            '40ed6060985702daffc36682ab01fb40fab49d676b7505e16b644baca2d39508')

prepare() {
	cd "$srcdir"
	echo "#!/bin/env sh
exec electron5 /usr/share/XMind2020/app.asar \$@
" > "$srcdir/XMind2020.sh"
	sed -i 's/^Exec=/Exec=XMind2020 %U/' "$srcdir/usr/share/applications/XMind.desktop"
}

package() {
	cd "$srcdir/usr/share"
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/{}" \;
	install -Dm755 "$srcdir/XMind2020.sh" "$pkgdir/usr/bin/XMind2020"
	install -Dm644 "$srcdir/xmind.xml" "$pkgdir/usr/share/mime/packages/xmind2020.xml"

	cd "$srcdir/opt/XMind/resources"
	install -Dm644 app.asar "$pkgdir/usr/share/XMind2020/app.asar"

	cd app.asar.unpacked
	find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/XMind2020/app.asar.unpacked/{}" \;
}
