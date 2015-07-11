# Maintainer: kfgz <kfgz at interia pl>
# Contributor: Hubert CzobodziЕ„ski <hcz at onet dot eu>
# Contributor: Nathan Owe <ndowens dot aur at gmail dot com>

pkgname=ddccontrol-git
_pkgname=ddccontrol
pkgver=20140105.r9d89d8c
pkgrel=1
pkgdesc="Control your monitor by software using the DDC/CI protocol."
arch=('i686' 'x86_64')
url="https://github.com/ddccontrol/ddccontrol"
license=('GPL')
depends=('pciutils' 'libxml2' 'ddccontrol-db-git')
makedepends=('git' 'intltool')
provides=('ddccontrol')
conflicts=('ddccontrol')
source=(git+https://github.com/ddccontrol/ddccontrol.git)
options=('!libtool')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  _gitver="$(git show -s --format="%ci %h" 2> /dev/null)"
  _gitver="${_gitver//[^[:alnum:][:space:]]/}"

  echo "${_gitver%% *}.r${_gitver##* }"
}

prepare() {
  cd "$srcdir/$_pkgname"
  # PKGBUILD should be non-interactive...
  sed -e 's:read dummy < /dev/tty::' "$(which gettextize)" > gettextize
  chmod +x gettextize

  sed -e 's:^gettextize :./gettextize :' -i autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install 
  #chmod 755 "${pkgdir}"/usr/bin/ddcpci
}
