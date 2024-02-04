# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Zhukov Pavel <gelios@gmail.com>
# Contributor: Christof Musik <christof@senfdax.de>
# Contributor: Falconindy
pkgname=slurm
pkgver=0.4.4
pkgrel=2
pkgdesc="yet another network load monitor"
url="https://github.com/mattthias/slurm"
license=("GPL-2.0-or-later")
arch=('x86_64')
depends=('ncurses')
makedepends=('meson')
conflicts=('slurm-llnl') #both packages have manpage "slurm.1"
source=("$pkgname-$pkgver.tar.gz::$url/archive/upstream/$pkgver.tar.gz")
sha256sums=('2f846c9aa16f86cc0d3832c5cd1122b9d322a189f9e6acf8e9646dee12f9ac02')

build() {
	# Sets CFLAGS to the makepkg.conf default (as of 2023-9-9) without "-fexceptions"
	# as it causes a segfault when slurm is run.
	CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt \
           -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security \
           -fstack-clash-protection -fcf-protection"
	arch-meson $pkgname-upstream-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
