# Maintainer: Jimmy Bergström <thekwarf@gmail.com>
_pkgname=rocket-editor
pkgname=${_pkgname}-git
pkgver=0.8.r538.g21da23b
pkgrel=1
pkgdesc="GNU Rocket OpenGL editor"
arch=('i686' 'x86_64')
url="https://github.com/emoon/rocket"
license=('zlib')
depends=(gtk3 libbass sdl)
makedepends=(cmake git)
provides=(${_pkgname})
source=("${_pkgname}::git+https://github.com/emoon/rocket.git"
        "git+https://github.com/rocket/rocket.git"
        "system-libbass.patch")
sha256sums=('SKIP'
            'SKIP'
            'e1f0504529d70c3aa95543bf9881e69f4d7606e2da4e70426e0a98e743cb42f3')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"

  git submodule init
  git config submodule.external/rocket.url "$srcdir/rocket"
  git submodule update

  patch --strip=1 < "${srcdir}/system-libbass.patch"

  mkdir -p "$srcdir/${_pkgname}/build"
}

build() {
  cd "$srcdir/${_pkgname}/build"
  cmake -DCMAKE_C_FLAGS="$(CMAKE_C_FLAGS) -Wno-error=maybe-uninitialized" -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "$srcdir/${_pkgname}/build"
  install -Dm 755 RocketEditor -t "$pkgdir/usr/bin/"
}
