# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=1.4.0
pkgrel=1
pkgdesc="Guacamole proxy daemon"
arch=('i686' 'x86_64' 'armv7h')
url="http://guacamole.sourceforge.net/"
license=('GPL3')
replaces=('guacd' 'libguac' 'libguac-client-ssh' 'libguac-client-vnc' 'libguac-client-rdp')
depends=('pango' 'openssl' 'libvorbis' 'uuid' 'libwebp')
makedepends=('libpulse' 'libvorbis' 'openssl' 'libssh' 'libvncserver' 'pango' 'libtelnet')
optdepends=('libssh: for ssh protocol support'
'libvncserver: for vnc protocol support'
'freerdp: for rdp protocol support'
'libpulse: for pulseaudio support'
'libtelnet: for telnet protocol support'
'monospace: any monospace font such as terminus-font, ttf-inconsolata or ttf-fira-mono. Without it, SSH will not work'
'libwebsockets: Support for Kubernetes'
)
install=$pkgname.install

source=("http://apache.org/dyn/closer.cgi?action=download&filename=guacamole/${pkgver}/source/${pkgname}-${pkgver}.tar.gz"
        "guacd.conf"
        "https://github.com/apache/guacamole-server/commit/bc6b5cef25cb2c66cb4e0e96df6d2639a61a197a.patch")

backup=('etc/guacamole/guacd.conf')

md5sums=('b17c6152e96af0488ca4c0608e5ec3ae'
         'ab0ac97ad76d16be73768f89abb6ee7e'
         'bd58fffb01f7f6ab9bae306bdbea61ea')

prepare() {
	cd "$srcdir"/$pkgname-$pkgver
	# guacenc doesn't work since ffmpeg 4.4 (av_init_packet() is deprecated) so, we apply this patch
	# Reference: https://github.com/apache/guacamole-server/pull/352/commits/bc6b5cef25cb2c66cb4e0e96df6d2639a61a197a
	patch -Np1 -i ../bc6b5cef25cb2c66cb4e0e96df6d2639a61a197a.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver
	./configure --prefix=/usr --sbindir=/usr/bin --with-systemd-dir=/usr/lib/systemd/system CPPFLAGS="-Wno-error=pedantic"
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir"/etc/guacamole
	cp -f ../guacd.conf "$pkgdir"/etc/guacamole/
}
