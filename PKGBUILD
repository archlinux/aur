# Maintainer: gigamicro <gammamicro@gmail.com>
pkgname='evilwm-gm-git'
_pkgname=evilwm
pkgdesc='Personal fork of a "Minimalist but usable window manager for the X Window System"'
pkgver=1.4.3.602.g2b40507
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/gigamicro/evilwm"
license=(custom)
depends=(libxrandr)
makedepends=(git)
provides=(evilwm)
source=("$_pkgname::git+https://github.com/gigamicro/evilwm.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	grep -m1 '^version.*=.*\([0-9.]\)$' Makefile | tr -dc 0-9.
	printf .
	git rev-list --count HEAD|tr -d \\n
	printf .g
	git rev-parse --short HEAD|tr -d \\n
}

# from original evilwm pkgbuild
build(){
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" desktopfilesdir=/usr/share/xsessions install
	sed '/^LICENCE$/,/^SEE ALSO$/b;d' README | head -n-2 > LICENSE
	install -Dv -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
