# Maintainer: lisniper <liqiang0330@gmail.com>
pkgname=abclock
pkgver=5.0.0
pkgrel=2
pkgdesc='gtklock with Beijing timezone wrapper, English+Chinese weekday (%ea) and 3-line lock layout'
arch=('x86_64' 'aarch64')
url='https://github.com/abcabc0330/abclock'
license=('GPL-3.0-only')
depends=('gtk3' 'gtk-session-lock' 'pam')
makedepends=('meson' 'ninja' 'pkgconf')
provides=('gtklock')
conflicts=('gtklock')
backup=('etc/pam.d/gtklock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "gtklock-$pkgver.tar.gz::https://github.com/jovanlanik/gtklock/archive/v$pkgver.tar.gz")
sha256sums=('ce48f90e66fb88e79a3162f272c37d0fae5fee2db45bf01ecceac4548916f4ec'
            '018c50cf1d7b626f823e797750e5b304511b3b359e7277e8abb3383c11e7aed9')

prepare() {
	cd "gtklock-$pkgver"
	patch -Np1 -i "$srcdir/$pkgname-$pkgver/patch/gtklock-v$pkgver-clock.patch"
}

build() {
	meson setup build "gtklock-$pkgver" --prefix=/usr --buildtype=plain
	ninja -C build
}

package() {
	meson install -C build --destdir "$pkgdir" --no-rebuild

	# 上游把可执行文件装到 /usr/bin/gtklock；后端挪到 libexec，/usr/bin 让给包装器
	install -d "$pkgdir/usr/libexec/abclock"
	mv "$pkgdir/usr/bin/gtklock" "$pkgdir/usr/libexec/abclock/gtklock-bin"
	install -Dm755 "$srcdir/$pkgname-$pkgver/bin/gtklock" "$pkgdir/usr/bin/gtklock"

	install -Dm644 "$srcdir/$pkgname-$pkgver/share/layout.xml" "$pkgdir/usr/share/abclock/layout.xml"
	install -Dm644 "$srcdir/$pkgname-$pkgver/share/config.ini.example" "$pkgdir/usr/share/abclock/config.ini.example"
	install -Dm644 "$srcdir/$pkgname-$pkgver/share/style.css.example" "$pkgdir/usr/share/abclock/style.css.example"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
