# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=tinyproxy-git
_gitname="tinyproxy"
pkgver=1.8.0.118.g24087f7
pkgrel=1
epoch=2
pkgdesc='A light-weight HTTP proxy daemon for POSIX operating systems.'
arch=('i686' 'x86_64')
url='https://banu.com/tinyproxy/'
license=('GPL')
makedepends=('asciidoc' 'git')
provides=('tinyproxy')
conflicts=('tinyproxy')
backup=('etc/tinyproxy/tinyproxy.conf')
source=('tinyproxy.tmpfiles.conf' 'tinyproxy.service'
	"git://git.banu.com/tinyproxy.git")
md5sums=('3c2764578f26581346fe312da0519a3e'
         '8e97b05cc8c87f7efefbf957e77c7f18'
         'SKIP')

pkgver() {
	cd "$_gitname"
#	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
	git describe | sed 's|-|.|g'
}

build() {
        cd "$srcdir/$_gitname"
	./autogen.sh
        ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-transparent --sbindir=/usr/bin
        make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install

	install -dm0755 -o nobody -g nobody "$pkgdir/var/log/$_gitname"
	install -dm0755 -o nobody -g nobody "$pkgdir/var/run/$_gitname"

	install -Dm644 -o nobody -g nobody "$srcdir/tinyproxy.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/tinyproxy.conf"

	# Provide sane defaults
	sed -i '/^#Listen/a\Listen 127.0.0.1' "$pkgdir/etc/tinyproxy/tinyproxy.conf"
	install -Dm0644 "$srcdir/tinyproxy.service" "$pkgdir/usr/lib/systemd/system/tinyproxy.service"
}
