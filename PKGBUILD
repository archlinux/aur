# Maintainer: nebk <nebk2010@gmail.com>
pkgname=gaw-xschem-git
pkgver=r34.854bee4
pkgrel=1
pkgdesc="Gtk analog waveform viewer with patches to improve xschem support"
arch=('x86_64')
url="https://github.com/StefanSchippers/xschem-gaw"
license=('GPL')
depends=('gtk3' 'alsa-lib' 'gettext')

makedepends=('git' 'automake' 'autoconf' 'sed') 
provides=('gaw')
conflicts=('gaw' 'gaw3')
source=("${pkgname%-git}::git+https://github.com/StefanSchippers/xschem-gaw.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    aclocal && automake --add-missing && autoconf
    sed -i -E '/(^GETTEXT_MACRO_VERSION) =/{s/=.+/= 0.20/g}' po/Makefile.in.in
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
