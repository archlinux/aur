# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=1.4.9.1.0.0.r1.fc0b535
pkgrel=1
epoch=2 # We need this because of changes in the upstream version numbering
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64' 'i686')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('libx11' 'gtkd' 'vte3' 'dconf' 'gsettings-desktop-schemas')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
			'vte3-terminix-git: for notifications, triggers and badges support'
			'libsecret: for the password manager')
makedepends=('git' 'ldc')
provides=('terminix')
conflicts=('terminix')
source=('git+https://github.com/gnunn1/terminix')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  # sed transformation explained:
  # s/^v// - removes the leading "v" from the tag name, if any (terminix doesn't use it, but harmless)
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
  ./configure --prefix=/usr
  make DC='ldmd' DCFLAGS='-disable-linker-strip-dead -O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${_pkgname}
  make DESTDIR=${pkgdir} install
}

