# Maintainer: sulhan <ms@kilabit.info>
pkgname=rescached-git
pkgver=1.5.0.r2.g7569ebc
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/shuLhan/rescached"
license=('custom:BSD')

depends=('gcc-libs')
provides=('rescached')
conflicts=('bind' 'nsd' 'pdnsd' 'powerdns' 'unbound')

makedepends=('gcc' 'make' 'fakeroot' 'git')
source=(
	"$pkgname::git+https://github.com/shuLhan/rescached.git"
	"libvos::git+https://github.com/shuLhan/libvos.git"
)
sha1sums=(
	'SKIP'
	'SKIP'
)

install=rescached-git.install
backup=('etc/rescached/rescached.cfg')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "$pkgname"
	git submodule init
	git config submodule.libvos.url $srcdir/libvos
	git submodule update
	cd "src"
}

build() {
	cd "$pkgname/src"
	echo ">>"
	echo ">> cleaning ..."
	echo ">>"
	make distclean
	echo ">>"
	echo ">> make ..."
	echo ">>"
	unset CXXFLAGS
	make || return 1
}

package() {
	cd "$pkgname/src"
	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
