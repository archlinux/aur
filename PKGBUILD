# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Comaintainer: Nick Black <dankamongmen@gmail.com>

pkgname=notcurses-git
pkgver=3.0.1
pkgrel=1
pkgdesc="Blingful TUI/character graphics library"
url="https://nick-black.com/dankwiki/index.php/Notcurses"
license=('Apache')
arch=('x86_64' 'aarch64')
# qrcodegen is currently shipped as a static archive on Arch, rather than a
# dynamic library. Should the .so be shipped in the future, promote qrcodegen
# from a makedepends to a true depends, and use that dynamic library.
depends=('ncurses' 'ffmpeg' 'libunistring')
provides=('notcurses')
conflicts=('notcurses')
_pkgnameint=$(echo ${pkgname} | cut -d- -f1)
source=("https://github.com/dankamongmen/notcurses/archive/v${pkgver}.tar.gz"
        "https://github.com/dankamongmen/notcurses/releases/download/v3.0.1/${_pkgnameint}-doc-${pkgver}.tar.gz")
#source=(git+https://github.com/dankamongmen/notcurses)

#pkgver() {
#  cd notcurses/build
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

makedepends=('cmake' 'libdeflate' 'doctest' 'qrcodegen' 'ninja' 'gpm')

prepare() {
  mkdir -p "${_pkgnameint}-${pkgver}/build"
  cd "${_pkgnameint}-${pkgver}/build"
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_QRCODEGEN=on -DUSE_GPM=on -DUSE_PANDOC=off
}

build() {
  cd "${_pkgnameint}-${pkgver}/build"
  ninja
}

check() {
  cd "${_pkgnameint}-${pkgver}/build"
  ninja test
}

package() {
  cd "${_pkgnameint}-${pkgver}/build"
  DESTDIR="$pkgdir" ninja install
  cd -
	for i in 1 3 ; do
		find "$srcdir" -maxdepth 1 -type f -iname \*.$i -exec echo "$pkgdir"/usr/share/man/man$i {} \;
		find "$srcdir" -maxdepth 1 -type f -iname \*.$i -exec install -Dm644 -t "$pkgdir"/usr/share/man/man$i {} \;
	done
}

sha256sums=('32041c300e92fc0fe56c19e65d1d1e374e824c781dfcd4f959ab0dcdbb90cdb2'
            '43be760c5f2f4a7b2c9a9527254cd2bbdda8ad7d6f4fc7f841a776f0ee3cdd05')
