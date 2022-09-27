# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

## GPG Key: https://github.com/canihavesomecoffee.gpg

pkgname=udis86-git
_pkg="${pkgname%-git}"
pkgver=1.7.2.r185.g2738fe5
pkgrel=1
pkgdesc="Minimalistic disassembler library"
arch=('x86_64')
url='https://github.com/canihavesomecoffee/udis86'
license=('BSD')
depends=('glibc')
makedepends=('git' 'python' 'python-sphinx')
provides=('libudis86.so')
source=("$_pkg::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('A5DD905196EF3973280DA13CB965BC5D279F42ED') ## canihavesomecoffee

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$_pkg"
	./autogen.sh
}

build() {
	cd "$_pkg"
	./configure \
		--prefix=/usr \
		--with-python=/usr/bin/python \
		--enable-shared
	make
	sphinx-build -b man docs/manual docs/_build/man
}

package() {
	cd "$_pkg"
	make DESTDIR="$pkgdir" install
	install -Dm644 docs/_build/man/udis86.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
