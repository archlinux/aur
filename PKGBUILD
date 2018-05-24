# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=0.9.14
pkgrel=2
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
'monospace: any monospace font such as terminus-font, ttf-inconsolata or ttf-fira-mono. Without it, SSH will not work'
)
install=$pkgname.install

source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        'guacd.service' libavcodec.patch)
 
md5sums=('cadc90e526ccf63e01c65017c8881717'
         'dfaa29349d2e73af6dac75d6cafbd762'
         '6cf58f3148d0ea3f24b4fa362ca79807')
 
build() {
	cd "$srcdir"/$pkgname-$pkgver
        patch -Np1 -i ../libavcodec.patch
	#PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig \
	#CFLAGS+=" -I/usr/include/openssl-1.0" \
	#LDFLAGS+=" -L/usr/lib/openssl-1.0 -lssl" \
	./configure --prefix=/usr --sbindir=/usr/bin CPPFLAGS="-Wno-error=pedantic -Wno-error=format-overflow"  ## Wno-error=format-overflow added to workaround build in GCC 7.1.1
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
        mkdir -p "$pkgdir"/usr/lib/systemd/system/
        install -Dm644 "$srcdir"/guacd.service "$pkgdir"/usr/lib/systemd/system/
}
