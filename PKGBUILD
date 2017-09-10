# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=0.9.13
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64' 'armv7h')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid' 'libwebp')
makedepends=('libpulse' 'libvorbis' 'openssl-1.0' 'libssh' 'libvncserver' 'pango' 'libtelnet')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
)

source=("http://downloads.sourceforge.net/project/guacamole/current/source/$pkgname-$pkgver-incubating.tar.gz" 'guacd.service')
 
md5sums=('fed1d18e6b18b114375bfabcf02f5607'
         'dfaa29349d2e73af6dac75d6cafbd762')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
	PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
	CFLAGS+=" -I/usr/include/openssl-1.0" \
	LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
	./configure --with-openssl --prefix=/usr --sbindir=/usr/bin CPPFLAGS="-Wno-error=pedantic -Wno-error=format-overflow"  ## Wno-error=format-overflow added to workaround build in GCC 7.1.1
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver-incubating
	make DESTDIR="$pkgdir" install
        mkdir -p "$pkgdir"/usr/lib/systemd/system/
        install -Dm644 "$srcdir"/guacd.service "$pkgdir"/usr/lib/systemd/system/
}
