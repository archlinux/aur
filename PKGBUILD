# Maintainer: Maxim Logaev <maxlogaev@proton.me>
# Contributor: Maxim Logaev <maxlogaev@proton.me>

pkgname=dino-plus-git
pkgver=v0.4.3.fork.3.r14.gbec8a5b6
pkgrel=1
pkgdesc="Dino+ is a fork of Dino, a modern XMPP/Jabber client"
arch=('x86_64' 'aarch64')
url="https://github.com/mxlgv/dino"
license=('GPL3')
depends=('glib2>=2.38' 'glib-networking' 'gtk4' 'gpgme'
	 'libgee>=0.10' 'libgcrypt' 'libsoup3' 'sqlite' 'qrencode'
	 'libsignal-protocol-c' 'gspell' 'gst-plugins-base'
	 'gst-plugins-good' 'gst-plugins-bad'
	 'gst-plugin-gtk' 'webrtc-audio-processing'
	 'libnice' 'libsrtp' 'libadwaita' 'libcanberra')
makedepends=('git' 'cmake' 'vala>=0.34' 'ninja')
provides=('dino-plus')
conflicts=('dino-plus' 'dino-git' 'dino')
source=('git+https://github.com/mxlgv/dino')
sha512sums=('SKIP')

pkgver() {
    cd dino
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd dino
    ./configure --release --no-debug --with-tests --enable-plugin=notification-sound --prefix=/usr
    cmake --build build
}

package() {
    cd dino
    DESTDIR="$pkgdir" cmake --build build --target=install
}

check() {
    cd dino
    echo "Executing xmpp-vala-test:"
    cmake --build build --target=test
}
