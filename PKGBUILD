# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=guacamole-server-git
_gitname=guacamole-server
pkgver=0.9.13.incubating.r42.g6236eb8f
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
conflicts=('guacamole-sever')
provides=('guacamole-sever')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid' 'libwebp')
makedepends=('git' 'libpulse' 'libvorbis' 'openssl-1.0' 'libssh' 'libvncserver' 'pango' 'libtelnet')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
)

source=(
		"$_gitname::git+https://github.com/apache/incubator-guacamole-server.git" 
		'guacd.service'
	   )
 
md5sums=('SKIP'
         'dfaa29349d2e73af6dac75d6cafbd762')
 
pkgver() {
  cd "$srcdir"/$_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/$_gitname
	autoreconf -fi
	PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
	CFLAGS+=" -I/usr/include/openssl-1.0" \
	LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
	./configure \
		--with-openssl \
		--prefix=/usr \
		--sbindir=/usr/bin \
		CPPFLAGS="-Wno-error=pedantic -Wno-error=format-overflow"
	make
}
 
package() {
	cd "$srcdir"/$_gitname
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/usr/lib/systemd/system/
	install -Dm644 "$srcdir"/guacd.service "$pkgdir"/usr/lib/systemd/system/
}
