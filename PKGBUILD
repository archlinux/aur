# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Comaintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses-git
pkgver=3.0.0
pkgrel=1
pkgdesc="Blingful TUI/character graphics library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64' 'aarch64')
# qrcodegen is currently shipped as a static archive on Arch, rather than a
# dynamic library. Should the .so be shipped in the future, promote qrcodegen
# from a makedepends to a true depends, and use that dynamic library.
depends=('ncurses' 'ffmpeg' 'libunistring')
provides=(notcurses)
conflicts=(notcurses)
source=("https://github.com/dankamongmen/notcurses/archive/v${pkgver}.tar.gz")
#source=(git+https://github.com/dankamongmen/notcurses)

#pkgver() {
#  cd notcurses/build
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}
pkgnameint=$(echo ${pkgname} | cut -d- -f1)

makedepends=('cmake' 'libdeflate' 'pandoc' 'python-pip' 'python-pypandoc' 'python-cffi' 'python-setuptools' 'doctest' 'qrcodegen' 'ninja' 'gpm')
source=("https://github.com/dankamongmen/notcurses/archive/v${pkgver}.tar.gz")

prepare() {
  mkdir -p "${pkgnameint}-${pkgver}/build"
  cd "${pkgnameint}-${pkgver}/build"
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_QRCODEGEN=on -DUSE_GPM=on
}

build() {
  cd "${pkgnameint}-${pkgver}/build"
  ninja
}

check() {
  cd "${pkgnameint}-${pkgver}/build"
  ninja test
}

package() {
  cd "${pkgnameint}-${pkgver}/build"
  DESTDIR="$pkgdir" ninja install
  cd ../cffi
  env CFLAGS="-I$pkgdir/usr/include -L../build" python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('b4839108ca8f9aef31d2f537485cbd878356bbcd4ad4f7a4dd19e72201d01cee')
