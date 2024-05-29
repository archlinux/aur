# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Seppia <seppia@seppio.fish>
# Contributor: svalo <me@valo.space>

pkgname=dino-plus-plus-git
_pkgname=${pkgname%-git}
pkgver=r1379.9074e21
pkgrel=1
pkgdesc="Simple and modern Jabber/XMPP client written in vala"
arch=('i686' 'x86_64' 'aarch64')
url="https://dino.im/"
license=('GPL3')
depends=('glib2>=2.38' 'glib-networking' 'gtk4' 'gpgme'
	 'libgee>=0.10' 'libgcrypt' 'libsoup3' 'sqlite' 'qrencode'
	 'libsignal-protocol-c' 'gspell' 'gst-plugins-base'
	 'gst-plugins-good' 'gst-plugin-gtk' 'webrtc-audio-processing'
	 'libnice' 'libsrtp' 'libadwaita')
makedepends=('git' 'cmake' 'vala>=0.34' 'ninja')
optdepends=('libcanberra: audio notification support')
provides=("${_pkgname%-plus-plus}")
conflicts=("${_pkgname%-plus-plus}")
source=('git+https://codeberg.org/Taba/dino-plus-plus')
sha512sums=('SKIP')

### Any or all of the following plugin can be disabled: omemo, openpgp, http-files. Populate following string as per your needs and uncomment it.

# _DISABLE_PLUGINS="--disable-plugin='omemo;openpgp;http-files;ice'"

### Any or all of the following plugin can be enabled: notification-sound. Populate the following string as per you needs and uncomment it.
### Install any needed optional dependency before

_ENABLE_PLUGINS="--enable-plugin='notification-sound'"

### Since 55b148a0f78c1abef57c21b2a84d97cad32b2290 dino uses by default the shared libsignal library.
# To restore the old behaviour add '--with-libsignal-in-tree' flag to configure

pkgver() {
    cd "${_pkgname}"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${_pkgname}"
    ./configure $_DISABLE_PLUGINS $_ENABLE_PLUGINS --with-tests --prefix="/usr" CC="$CC" CFLAGS="$CFLAGS" VALACFLAGS="$VALACFLAGS"
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="${pkgdir}/" install
}

check() {
    cd "${_pkgname}"
    echo "Executing xmpp-vala-test:"
    build/xmpp-vala-test
}
