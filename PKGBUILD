# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=tilix-git
_pkgname=tilix
pkgver=1.7.3.r4.ca28c00
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64' 'i686')
url="http://github.com/gnunn1/tilix"
license=('MPL')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
optdepends=('python2-nautilus: for "Open Tilix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
			'vte3-tilix: for notifications, triggers and badges support'
			'libsecret: for the password manager')
makedepends=('git' 'ldc' 'po4a')
provides=('terminix' 'tilix')
conflicts=('terminix' 'tilix')
source=('git+https://github.com/gnunn1/tilix')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  # sed transformation explained:
  # s/^v// - removes the leading "v" from the tag name, if any (tilix doesn't use it, but harmless)
  # s/\([^-]*-\)g/r\1/ - replaces the "g" that precedes the commit hash with "r"
  # s/-/./g - replaces all the remaining "-" with "."
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  chmod u+x autogen.sh
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  # in many cases po4a-translate is not in the PATH
  ./configure --prefix=/usr PO4A_TRANS=/usr/bin/vendor_perl/po4a-translate
  make DC='ldmd' DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${_pkgname}
  make DESTDIR=${pkgdir} install
}

