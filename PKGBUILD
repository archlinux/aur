# Mainrainer: Michael Kogan <michael dot kogan at gmx dot net >


pkgname=gtkglarea1
_pkgname=gtkglarea
pkgver=1.2.3
pkgrel=2
pkgdesc="OpenGL context provider for GTK+"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/GtkGLArea"
license=('GPL')
depends=('gtk' 'mesa')
options=('!libtool')
source=("http://sourceforge.net/projects/openev/files/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz/download")
md5sums=('44f6804c1a9db61393e18680c81ae602')

_optimal_make_jobs() {
	if [ -r /proc/cpuinfo ]; then
		local core_count=$(grep -Fc processor /proc/cpuinfo)
	else
		local core_count=0
	fi

	if [ $core_count -gt 1 ]; then
		echo -n $[$core_count-1]
	else
		echo -n 1
	fi
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"

	# Solve compilation error
	sed -i 's/g_print(info_str);/g_print("%s", info_str);/' ./examples/simple.c

	msg 'Running configure...'
	./configure --prefix=/usr

	msg 'Running make'
	make -j$(_optimal_make_jobs)
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
