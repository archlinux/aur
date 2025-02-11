# Maintainer: dringsim <dringsim@qq.com> 

pkgname=pam-fprint-grosshack-unlimited-timeout
_pkgname=pam-fprint-grosshack
pkgver=0.3.0
pkgrel=1
pkgdesc="PAM module enabling simultaneous fingerprint (fprintd) and password authentication, with unlimited timeout support"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL-2.0-or-later)
provides=(pam-fprint-grosshack)
conflicts=(pam-fprint-grosshack)
depends=(fprintd glib2 libfprint polkit dbus dbus-glib systemd)
makedepends=(cmake git meson pam_wrapper python-cairo python-dbus python-dbusmock)
source=("git+https://gitlab.com/mishakmak/pam-fprint-grosshack.git#tag=v$pkgver"
	"fprint_unlimited_timeout.patch") # https://gitlab.freedesktop.org/libfprint/fprintd/-/merge_requests/195
sha256sums=('SKIP'
	'b362242e311d80b982683dc6366adcccd122eb58f6eb6b2f4a18b50b343e6248')

prepare() {
  cd $_pkgname
  patch -p1 < ../fprint_unlimited_timeout.patch
}

build() {
  cd $_pkgname 
  arch-meson . build \
    -D pam_modules_dir=/usr/lib/security
  meson compile -C build
}

check() {
  cd $_pkgname 
  meson test -C build --print-errorlogs
}

package() {
  cd $_pkgname 
  meson install -C build --destdir "$pkgdir"
}

