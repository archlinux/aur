# Maintainer: Philipp Trommler <ph.trommler@gmail.com>
pkgname=valum-git
pkgver=r386.35b2755
pkgrel=1
pkgdesc="Web micro-framework written in Vala"
arch=("i686" "x86_64")
url="https://github.com/valum-framework/valum"
license=("LGPL3")
depends=("vala"
	 "glib2"
	 "libsoup"
	 "libgee06"
	 "ctpl"
	 "fcgi"
	 "libmemcached"
	 "memcached"
	 "luajit")
makedepends=("git"
	     "python")
provides=("valum")
source=("git://github.com/antono/valum.git")
md5sums=("SKIP")

pkgver() {
	cd "valum"
  	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "valum"
	./waf configure --prefix=/usr
	./waf build
}

check() {
	cd "valum"
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./build
	./build/tests/tests
}

package() {
	cd "valum"
	DESTDIR="$pkgdir" ./waf install
	install -Dm644 vapi/ctpl.vapi vapi/fcgi.vapi "$pkgdir/usr/share/vala/vapi/"
	install -Dm644 LGPL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
