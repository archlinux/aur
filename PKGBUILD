# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=0.60.r15.e6f6154
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3' 'hicolor-icon-theme' 'gtkd-dmd')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
makedepends=('git' 'dmd' 'pkg-config')
provides=('terminix')
conflicts=('terminix')
source=('git+https://github.com/gnunn1/terminix' \
  '0001-Update-LINGUAS-with-latest-po-files.patch' \
  '0002-Add-experimental-support-for-building-terminix-with-.patch')
sha512sums=('SKIP' '03f1920ccd1b3deafdc52c066660fe00367a0ffa3c95305051281a9e3630de2be69cd0312d4d4402b704196e18ce9f25769c18f992ae9f0f5a710f50803912ed' '8ca045e34478cd36f784ae977b77d374c67583ee3c2e35a1f4e4fbb72936b5d86e14e5e85a6ebf3976ba9d8dde8632c85c02bb874cad5f99288675e4c7c3e5df')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  if test -f Makefile.am; then
    echo '  -> Makefile.am found in src/ dir. Please remove src/ before rebuilding.'
    exit 1
  fi

  patch -p1 <../0001-Update-LINGUAS-with-latest-po-files.patch
  patch -p1 <../0002-Add-experimental-support-for-building-terminix-with-.patch
  chmod u+x autogen.sh
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr
  make DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${_pkgname}
  make DESTDIR=${pkgdir} install
}

