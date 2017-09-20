# Maintainer: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-git
pkgver=r178.54a25fd
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/dino/dino"
license=('GPL3')
depends=('glib2>=2.38' 'glib-networking' 'gtk3>=3.22' 'gpgme' 'libgee>=0.10' 'libgcrypt' 'libsoup' 'sqlite' )
makedepends=('git' 'cmake' 'vala>=0.30' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('dino::git+https://github.com/dino/dino')
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    ./configure --prefix="/usr" --with-tests CC="$CC" CFLAGS="$CFLAGS" VALACFLAGS="$VALACFLAGS"
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    echo "Executing xmpp-vala-test:"
    build/xmpp-vala-test
    echo
    echo "Executing signal-protocol-vala-test:"
    build/signal-protocol-vala-test
}
