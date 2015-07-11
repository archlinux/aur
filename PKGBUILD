# Contributor: 3ED <krzysztof1987 (at) gmail /dot/ com>
# Contributor:Xemertix <arch88(at)katamail(dot)com>
# Contributor: dimaqq@gmail.com

pkgname=ddccontrol-db-git
_pkgname=ddccontrol-db
pkgver=20120905.r130da80
pkgrel=1
pkgdesc="Monitor database for DDCControl"
arch=('any')
url="https://github.com/ddccontrol/ddccontrol-db"
license=('GPL')
depends=()
makedepends=('git' 'intltool')
provides=('ddccontrol-db')
conflicts=('ddccontrol-db')
source=($_pkgname::git+https://github.com/ddccontrol/ddccontrol-db.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  _gitver="$(git show -s --format="%ci %h" 2> /dev/null)"
  _gitver="${_gitver//[^[:alnum:][:space:]]/}"

  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  echo "${_gitver%% *}.r${_gitver##* }"
}
prepare() {
  cd "$srcdir/$_pkgname"

  # PKGBUILD should be non-interactive...
  sed -e 's:read dummy < /dev/tty::' "$(which gettextize)" > gettextize
  chmod +x gettextize

  sed -e 's:^gettextize :./gettextize :' -i autogen.sh
  ./autogen.sh
}
build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
