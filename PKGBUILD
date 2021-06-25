# Contributor: Florian B <mr.maxmeier at gmail dot com>
# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy
pkgver=0.7.8
pkgrel=1
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://github.com/wolfpld/tracy"
license=('BSD')
depends=('glfw-x11' 'gtk3' 'intel-tbb' 'capstone')
makedepends=('pkgconf' 'git')
provides=('tracy')
conflicts=('tracy')
source=("git+$url#tag=v$pkgver" "tracy.desktop" "gcc11.patch" )
sha256sums=('SKIP' 'd70322648a10aacab4b471fa657ae57bf477ac98c77383d1a8491b3aa5a1c907'
                   'e64a6131a12c978f57e711a07b5f8dba7eecb02062d37fa7dbc09497f341c7cd')

prepare() {
  cd tracy
  patch --forward --strip=1 --input="${srcdir}/gcc11.patch"
}

build() {
  cd tracy
  make -C profiler/build/unix release
  make -C update/build/unix release
  make -C capture/build/unix release
}

package() {
  install -Dm644 tracy.desktop $pkgdir/usr/share/applications/tracy.desktop

  cd tracy
  install -Dm755 profiler/build/unix/Tracy-release $pkgdir/usr/bin/tracy
  install -Dm755 update/build/unix/update-release $pkgdir/usr/bin/tracy-update
  install -Dm755 capture/build/unix/capture-release $pkgdir/usr/bin/tracy-capture
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 icon/icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/tracy.png
}
