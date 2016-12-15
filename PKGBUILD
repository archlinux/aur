
pkgname=weeb-git
pkgver=r49.dffa390
pkgrel=1
pkgdesc="A library manager for anime and series"
arch=("i686" "x86_64")
url="https://github.com/cosarara97/fucking-weeb"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'chicken')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('weeb::git+https://github.com/cosarara97/fucking-weeb.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/prefix/lib/chicken/8/"
	unset CHICKEN_REPOSITORY
	chicken-install -init "$srcdir/prefix/lib/chicken/8"
	export CHICKEN_REPOSITORY="$srcdir/prefix/lib/chicken/8"
	# bind needs the -p or else it will try to install a
	# binary in /usr/bin
	chicken-install -p "$srcdir/prefix" bind http-client uri-common openssl medea
	cd "$srcdir/${pkgname%-git}"
	make deployable
	# they hold references to $srcdir, and we don't need them
	rm deploy_dir/weeb/*.setup-info
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
