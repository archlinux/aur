# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgname=cura-5-plugin-octoprint-git
_pkgname=cura-5-plugin-octoprint-git
pkgver=r580.eb68bc6
pkgrel=2
pkgdesc="Cura plugin which enables printing directly to OctoPrint and monitoring the progress"
arch=('any')
license=('GPL3')
url="https://github.com/fieldofview/OctoPrintPlugin"
depends=('python' 'python-zeroconf')
conflicts=('cura-5-plugin-octoprint')
makedepends=('git' 'cmake')
source=("$_pkgname::git+https://github.com/fieldofview/OctoPrintPlugin.git#branch=master"
        "git+https://github.com/jstasiak/python-zeroconf.git"
        "git+https://github.com/pydron/ifaddr.git"
        "CMakeLists.txt.patch")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '9e2e7daae3b9d62cb51a617926e8ba1f')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.python-zeroconf.url $srcdir/python-zeroconf
  git config submodule.ifaddr.url $srcdir/ifaddr
  git submodule update
  cd $srcdir/$_pkgname
  patch -Np0 < ${srcdir}/CMakeLists.txt.patch
}

build() {
  mkdir -p "$_pkgname"/build
  cd "$_pkgname"/build
  cmake -DCMAKE_INSTALL_PREFIX=/opt/cura5/share ..
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:


