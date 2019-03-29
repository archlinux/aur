pkgname=gtkplatform
pkgver=0.2.4+4+ga9b8447
pkgrel=1
pkgdesc="Run Qt applications using gtk+ as a windowing system"
arch=('x86_64')
url="https://github.com/CrimsonAS/gtkplatform"
license=('LGPL3' 'GPL2')
depends=('gtk3' 'libnotify' 'qt5-base')
makedepends=('git')
_commit=a9b84470ceefa481beef598c45bd7cae3042a61c
source=(
	"git+$url.git#commit=$_commit"
	'50-gtkplatform.conf'
)
md5sums=('SKIP'
         'feb8d574489bed9bd91dae7c3b5b54a1')
sha512sums=('SKIP'
            'd96788c66228b336c1932531221cc92902d40986d378bfcea15e3b53b0ba2a1a39568c9592e1745145c60b569e8909af095292e95faee6ef284e7fcb263b907f')

prepare() {
	cd $pkgname

	# Fix build under GCC 8.2.1	https://github.com/CrimsonAS/gtkplatform/pull/46
	git merge --squash d1ac6cbb011a3f72a5767bf00c47b9fcbcf9d935
}

pkgver() {
	cd $pkgname

	git describe --tags --long | sed 's/^v//; s/-/+/g'
}

build() {
	cd $pkgname

	qmake DESTDIR=$srcdir
	make
}

package() {
	cd $pkgname

	make INSTALL_ROOT="$pkgdir" install
	install -Dt "$pkgdir/usr/lib/environment.d" -m0644 ../50-gtkplatform.conf
}
