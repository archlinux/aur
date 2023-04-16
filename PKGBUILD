# Maintainer: Antiquete <antiquete@proton.me>

pkgname=mmconneqt-git
pkgver=v0.1.1.r2.gc61b42a
pkgrel=1
pkgdesc="A simple Qt based gui for ModemManager"
arch=('x86_64')
url="https://gitlab.com/Antiquete/mmconneqt"
license=('GPL3')
depends=('qt5-base' 'modemmanager')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'ac2d984d9c86da3a7af523e99b3f31796b8063c60056319d61688fd3cc8c4766')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  export QMAKE_CFLAGS="${CFLAGS}"
  export QMAKE_CXXFLAGS="${CXXFLAGS}"
  export QMAKE_LFLAGS="${LDFLAGS}"

  pushd build
  qmake-qt5 CONFIG+='c++11' PREFIX='/usr' ../MMConneqt.pro
  make
  popd
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  install -Dm755 "build/${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm644 "src/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
}