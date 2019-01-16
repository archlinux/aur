# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=1.0.0
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
'monospace: any monospace font such as terminus-font, ttf-inconsolata or ttf-fira-mono. Without it, SSH will not work'
)
install=$pkgname.install

source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        'guacd.service' libavcodec.patch)
 
md5sums=('dc4a7775d8b676fa23c06e811d7a536d'
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
