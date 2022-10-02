# Maintainer: Michael Gruz <michael.gruz@gmail.com>

pkgname=cura-5-plugin-octoprint
pkgver=3.7.2
_pkgname=Cura-OctoPrintPlugin-${pkgver}
pkgrel=5
pkgdesc="Cura plugin which enables printing directly to OctoPrint and monitoring the progress"
arch=('any')
license=('GPL3')
url="https://github.com/fieldofview/OctoPrintPlugin"
depends=('python' 'python-zeroconf')
conflicts=('cura-5-plugin-octoprint-git')
makedepends=('git' 'cmake')
source=("https://github.com/fieldOfView/Cura-OctoPrintPlugin/archive/refs/tags/v${pkgver}.tar.gz"
        "git+https://github.com/jstasiak/python-zeroconf.git"
        "git+https://github.com/pydron/ifaddr.git"
        "CMakeLists.txt.patch")
sha256sums=('ad61c8320c78ae884ec55748758c8c04c077e381471a1471fa074c9772d80035'
            'SKIP'
            'SKIP'
            'a2f55c90ff9ec928b6f204d31d5d2c7a604bfc91ee057ca5c820970526d9fb3b')

prepare() {
  cd $srcdir/$_pkgname
  git submodule init
  git config submodule.python-zeroconf.url $srcdir/python-zeroconf
  git config submodule.ifaddr.url $srcdir/ifaddr
  git submodule update
  patch -Np0 < $srcdir/CMakeLists.txt.patch
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


