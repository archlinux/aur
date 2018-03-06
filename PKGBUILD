# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
pkgname=log-malloc2-git
pkgver=r18.dd2d44b
pkgrel=1
pkgdesc="Memory allocation tracking library"
arch=('x86_64')
url="http://devel.dob.sk/log-malloc2/"
license=('GPL' 'LGPL')
depends=('libunwind')
makedepends=('git')
source=('log-malloc2::git+https://github.com/samsk/log-malloc2.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

    # we need to fix the makefile to install the bins correctly
    sed -i -e 's/"$(bindir)/"$(DESTDIR)$(bindir)/' Makefile.am
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -d "${pkgdir}/usr/bin"
	make DESTDIR="$pkgdir/" install
}
