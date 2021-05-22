# Maintainer: Joan Figueras <ffigue at gmail dot com>
# Contributor: Black_Codec <orso.f.regna@gmail.com>

pkgname=guacamole-server
pkgver=1.3.0
pkgrel=3
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
        "https://github.com/apache/guacamole-server/commit/b2ae2fdf003a6854ac42877ce0fce8e88ceb038a.patch")
 
md5sums=('5203866c9de4e8c064b19a56a95599c6'
         '166e637d961e691f29b298c211ee2fd5')

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    patch -Np1 -i ../b2ae2fdf003a6854ac42877ce0fce8e88ceb038a.patch
}

build() {
	cd "$srcdir"/$pkgname-$pkgver

    # guacenc doesn't work since ffmpeg 4.4 (av_init_packet() is deprecated) that's why we have to build it with --disable-guacenc
    # Reference: https://issues.apache.org/jira/browse/GUACAMOLE-1330
	./configure --prefix=/usr --sbindir=/usr/bin --with-systemd-dir=/usr/lib/systemd/system --disable-guacenc CPPFLAGS="-Wno-error=pedantic"
	make
}
 
package() {
	cd "$srcdir"/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
