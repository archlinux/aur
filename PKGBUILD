# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail · com>
# Contributor: Michael Klier <chi@chimeric.de>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
_bpn=upslug2
pkgname=$_bpn-git
pkgrel=1
pkgdesc="A tool to flash your NSLU2 (Slug) from a computer on a local network. (With OpenWRT patches)"
url="http://www.nslu2-linux.org/wiki/Main/UpSlug2"
depends=('gcc-libs')
makedepends=('git')
provides=("$_bpn")
conflicts=("$_bpn")
arch=('i686' 'x86_64')
license=('MIT')
source=("upslug2::git+https://github.com/wspringer/upslug2.git"
        "100-libpcap_fix.patch"
        "110-wrt350nv2_support.patch")
md5sums=('SKIP'
         'd50d808f117361f18bbe0726a73b40e2'
         '80e4028a3c79dd4ac5dde263015d6063')

# from https://wiki.archlinux.org/index.php/VCS_package_guidelines
pkgver=r30.6fde222
pkgver() {
	cd "$srcdir/upslug2"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
  cd "$srcdir/upslug2"
  patch -p1 < "$srcdir/100-libpcap_fix.patch"
  patch -p1 < "$srcdir/110-wrt350nv2_support.patch"
  sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}

build() {
  cd "$srcdir/upslug2"
  autoreconf -i
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/upslug2"
  make install DESTDIR="$pkgdir"
  install -Dm644 upslug2.8 "$pkgdir/usr/share/man/man8/upslug2.8"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
