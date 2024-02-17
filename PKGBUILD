# Maintainer: robertfoster
# Contributor: Michael Duell <michael.duell@rub.de> PGP-Key: 5566FF77 Fingerprint FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77

pkgname=rtl-sdr-git
pkgrel=1
pkgver=2.0.1.4.gaf33886
pkgdesc='Driver for Realtek RTL2832U, allowing general purpose software defined radio (SDR)'
arch=('i686' 'x86_64' 'aarch64')
url='https://osmocom.org/projects/rtl-sdr/wiki'
license=('GPL')
depends=('glibc' 'libusb')
makedepends=('git' 'cmake')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
install="${pkgname%%-git}.install"
source=(
  "${pkgname%%-git}::git+https://gitea.osmocom.org/sdr/rtl-sdr"
  'fix-udev-directory.patch'
  "${pkgname%%-git}.sysusers"
)

pkgver() {
  cd "${pkgname%%-git}"

  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)v/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "${pkgname%%-git}"

  # ensure udev rules get installed to correct directory
  patch -p1 -i "$srcdir/fix-udev-directory.patch"

  # fix udev rules and allow access to any user that is locally logged in or in the rtlsdr group
  # https://bugzilla.redhat.com/show_bug.cgi?id=815093
  sed -e 's/GROUP="plugdev"/GROUP="rtlsdr", TAG+="uaccess"/' -i rtl-sdr.rules
}

build() {
  cmake \
    -S "${pkgname%%-git}" \
    -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -D DETACH_KERNEL_DRIVER=ON \
    -D INSTALL_UDEV_RULES=ON \
    -W no-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # rtlsdr group creation
  install -vDm644 ${pkgname%%-git}.sysusers \
    "$pkgdir/usr/lib/sysusers.d/${pkgname%%-git}.conf"

  cd "${pkgname%%-git}"

  # module blacklisting rules
  install -vDm644 debian/rtl-sdr-blacklist.conf \
    "$pkgdir/usr/lib/modprobe.d/rtlsdr.conf"

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" debian/*.1
}

sha256sums=('SKIP'
  'a0acd270f017e11d32450ad33ef21794b5052f29f4086099995680373308aeb9'
  'e408f25fb51e9d53326c5548dbe8d53ae701602398fc68538243065488a89056')
