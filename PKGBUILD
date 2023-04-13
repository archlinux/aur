# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wpa_supplicant-git
pkgver=2.10.r1083.g302d761a8
pkgrel=1
pkgdesc="A daemon program controlling the wireless connection"
arch=('i686' 'x86_64')
url="https://w1.fi/wpa_supplicant/"
license=('BSD')
depends=('glibc' 'openssl' 'libdbus' 'libnl' 'readline')
optdepends=('wpa_supplicant_gui: GUI frontend')
makedepends=('git')
provides=("wpa_supplicant=$pkgver")
conflicts=('wpa_supplicant')
source=("git+https://w1.fi/hostap.git"
        "config::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/wpa_supplicant/trunk/wpa_supplicant_config")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "$srcdir"

  cp "config" "hostap/wpa_supplicant/.config"
}

pkgver() {
  cd "hostap/wpa_supplicant"

  git describe --long --tags | sed 's/^hostap_//;s/\([^-]*-g\)/r\1/;s/[_-]/./g'
}

build() {
  cd "hostap/wpa_supplicant"

  export CFLAGS="$CPPFLAGS $CFLAGS"
  make \
    LIBDIR="/usr/lib" \
    BINDIR="/usr/bin"
  make \
    LIBDIR="/usr/lib" \
    BINDIR="/usr/bin" \
    eapol_test
}

package() {
  cd "hostap/wpa_supplicant"

  make \
    LIBDIR="/usr/lib" \
    BINDIR="/usr/bin" \
    DESTDIR="$pkgdir" \
    install

  install -Dm755 "eapol_test" -t "$pkgdir/usr/bin"
  install -Dm644 "wpa_supplicant.conf" -t "$pkgdir/usr/share/doc/wpa_supplicant"
  install -Dm644 "dbus/fi.w1.wpa_supplicant1.service" -t "$pkgdir/usr/share/dbus-1/system-services"
  install -Dm644 "dbus/dbus-wpa_supplicant.conf" "$pkgdir/etc/dbus-1/system.d/wpa_supplicant.conf"
  install -Dm644 "systemd"/*.service -t "$pkgdir/usr/lib/systemd/system"

  sed -n '/This software may/,/OF SUCH DAMAGE./p' "README" > "COPYING"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/wpa_supplicant"
}
