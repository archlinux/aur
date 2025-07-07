# Maintainer:

_pkgname="app2unit"
pkgname="$_pkgname-git"
pkgver=1.0.1.r0.g767a3f3
pkgrel=1
pkgdesc="Utility to launch commands as systemd user units"
url="https://github.com/Vladimir-csp/app2unit"
license=('GPL-3.0-only')
arch=('any')

depends=(
  libnotify
  sh
  systemd
)
makedepends=(
  git
  scdoc # generate man page
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  # fix makefile
  sed -E -e '1i DESTDIR ?=' \
    -e 's&(\s)(\$\((bindir|man1dir)\))&\1$(DESTDIR)\2&g' \
    -i "$_pkgsrc/Makefile"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgsrc"
  DESTDIR="$pkgdir" prefix='/usr' make install
}
