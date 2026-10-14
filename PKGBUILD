# Maintainer: Aurel Farkasovsky <aurel1510+aur at gmail dot com>
#
# libfprint with the "validity" driver for the Synaptics 06cb:00a2 fingerprint
# sensor (ThinkPad E480, E580, R480, E490, E590, R490, R590).
#
# The driver needs vendor data that cannot be redistributed. It is extracted
# at build time from Lenovo's driver package, which is downloaded from Lenovo.
# The vendor data is under the Synaptics license in SynaEula.rtf.

pkgname=libfprint-00a2
_pkgver=1.94.100
_commit=5d48ca4059ba9a2925600123e81940e0f63e542e
pkgver=1.94.100.r12.g5d48ca4
pkgrel=1
pkgdesc="libfprint for fprintd with a driver for the Synaptics/Validity 06cb:00a2 fingerprint sensor (ThinkPad E480, E580, R480, E490, E590, R490, R590)"
url="https://codeberg.org/aurel1510/libfprint-00a2"
_repo="https://codeberg.org/aurel1510/libfprint-00a2.git"
arch=(x86_64)
license=(LGPL-2.1-or-later MIT LicenseRef-Synaptics-EULA)
depends=(glib2 glibc libgcc libgudev libgusb openssl pixman)
makedepends=(git gobject-introspection innoextract meson python)
checkdepends=(python-cairo python-gobject umockdev)
provides=("libfprint=$_pkgver" libfprint-2.so)
conflicts=(libfprint)
source=("libfprint::git+$_repo#commit=$_commit"
        "https://download.lenovo.com/pccbbs/mobiles/r0yfp10w.exe")
sha256sums=('SKIP'
            '760c405f4f173abdf196cf1a3011f7147dea88c2177855f768efdeea254866bf')
noextract=(r0yfp10w.exe)

prepare() {
  python libfprint/scripts/validity-extract-vendor-data.py \
    --installer r0yfp10w.exe --destdir vendor-data
  innoextract --silent --include SynaEula.rtf --output-dir eula r0yfp10w.exe
}

build() {
  arch-meson libfprint build -D doc=false -D gtk-examples=false -D installed-tests=false
  meson compile -C build
}

check() {
  # Serially, because the upstream egis_etu905 replay test is timing
  # sensitive and fails intermittently under parallel load.
  FP_VALIDITY_DATA_DIR="$srcdir/vendor-data" \
    meson test -C build --print-errorlogs --num-processes 1
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -d "$pkgdir/usr/share/libfprint-2/validity"
  cp -r --no-preserve=ownership vendor-data/06cb-00a2 "$pkgdir/usr/share/libfprint-2/validity/"

  install -Dm644 libfprint/libfprint/drivers/validity/LICENSE.python-validity \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.python-validity"
  install -Dm644 "$(find eula -name SynaEula.rtf)" \
    "$pkgdir/usr/share/licenses/$pkgname/SynaEula.rtf"
  install -Dm644 libfprint/libfprint/drivers/validity/README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.validity.md"
}
