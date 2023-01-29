# Maintainer: aksr <aksr at t-com dot me>
pkgname=wmii-git
pkgver=r2825.ff120c7f
pkgrel=1
epoch=
pkgdesc='A dynamic window manager for X11.'
arch=('i686' 'x86_64')
url='https://github.com/0intro/wmii'
license=(MIT)
depends=('libx11' 'libxinerama' 'libxrandr' 'libixp')
makedepends=(git)
optdepends=(
	'dash: for use of the default wmiirc configs'
	'libxft: for anti-aliased font support'
	'xorg-xmessage: for use of the default wmiirc configs'
	'plan9port: for use of the alternative plan9port wmiirc'
	'python2: for use of the alternative Python wmiirc'
	'ruby-rumai: for use of the alternative Ruby wmiirc'
)
conflicts=("${pkgname%-*}" "${pkgname%-*}-hg")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/egrep/grep -E/g' Makefile util/link
	sed -i 's/-O0/-O2/g' mk/gcc.mk
}
pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
	install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	rm $pkgdir/usr/share/doc/wmii/LICENSE
}
