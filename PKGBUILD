# Maintainer: Jimmy Bergström <me@kwarf.com>
_pkgname=rocket-editor
pkgname=${_pkgname}-git
pkgver=1.3.0.r4.g68a18d8
pkgrel=1
pkgdesc="GNU Rocket OpenGL editor"
arch=('i686' 'x86_64')
url="https://github.com/emoon/rocket"
license=('Zlib')
depends=(gtk3 sdl2-compat)
makedepends=(cmake git)
provides=(${_pkgname})
source=("${_pkgname}::git+https://github.com/emoon/rocket.git"
        "git+https://github.com/rocket/rocket.git"
        "tinycthread.patch")
sha256sums=('SKIP'
            'SKIP'
            'ea00c21bffbce0f16de3aa1b9b6fb7a51c38a3ac4f4e16e01a29a3adc7373f4b')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"

  git submodule init
  git config submodule.external/rocket.url "$srcdir/rocket"
  git -c protocol.file.allow=always submodule update

  patch --strip=1 < "${srcdir}/tinycthread.patch"

  mkdir -p "$srcdir/${_pkgname}/build"
}

build() {
  cd "$srcdir/${_pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "$srcdir/${_pkgname}/build"
  install -Dm 755 RocketEditor -t "$pkgdir/usr/bin/"
}
