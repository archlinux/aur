#AUR Maintainter: JKA Network <contacto@jkanetwork.com>
#AUR Maintainter: Javier Steinaker <jsteinaker@gmail.com>
pkgname=pinta-git
pkgver=r2403.24d7473f
pkgrel=1
pkgdesc="Drawing/editing program modeled after Paint.NET. It's goal is to provide a simplified alternative to GIMP for casual users"
arch=('x86_64' 'i686')
url="https://pinta-project.com"
license=('MIT')
depends=('mono' 'gtk-sharp-3' 'mono-addins' 'yelp-tools' 'intltool' 'dotnet-runtime')
makedepends=('git' 'dotnet-sdk' 'autoconf-archive')
provides=('pinta')
conflicts=('pinta')
options=('!makeflags')
source=(git+https://github.com/PintaProject/Pinta.git)
md5sums=('SKIP')
pkgver() {
	cd "Pinta"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "Pinta"
	#maxcpucount: 1 needed to build.
	sed -i '/^PINTA_BUILD_OPTS/ s/$/ -maxcpucount:1/' Makefile.am
	./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}
package() {
	cd "Pinta"
	make DESTDIR="$pkgdir/" install
	install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
	install -m644 license-*.txt readme.md "$pkgdir"/usr/share/licenses/$pkgname/
}
