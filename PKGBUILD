# Contributor: Florian B <mr.maxmeier at gmail dot com>
# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy
pkgver=0.9
pkgrel=1
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://github.com/wolfpld/tracy"
license=('BSD')
depends=('glfw-x11' 'gtk3' 'intel-tbb' 'capstone')
makedepends=('pkgconf' 'git')
optdepends=('xdg-desktop-portal: file dialogs')
provides=('tracy')
conflicts=('tracy')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd tracy
  make -C capture/build/unix release
  make -C csvexport/build/unix release
  make -C import-chrome/build/unix release
  make -C library/unix release
  make -C profiler/build/unix release
  make -C update/build/unix release
}

package() {
  cd tracy
  install -Dm755 capture/build/unix/capture-release $pkgdir/usr/bin/tracy-capture
  install -Dm755 csvexport/build/unix/csvexport-release $pkgdir/usr/bin/tracy-csvexport
  install -Dm755 import-chrome/build/unix/import-chrome-release $pkgdir/usr/bin/tracy-import-chrome
  install -Dm755 library/unix/libtracy-release.so $pkgdir/usr/lib/libtracy.so
  install -Dm755 profiler/build/unix/Tracy-release $pkgdir/usr/bin/tracy
  install -Dm755 update/build/unix/update-release $pkgdir/usr/bin/tracy-update

  mkdir -p $pkgdir/usr/include/Tracy/client
  mkdir -p $pkgdir/usr/include/Tracy/common
  mkdir -p $pkgdir/usr/include/Tracy/tracy

  cp -p public/client/*.{h,hpp} $pkgdir/usr/include/Tracy/client/
  cp -p public/common/*.{h,hpp} $pkgdir/usr/include/Tracy/common/
  cp -p public/tracy/*.{h,hpp} $pkgdir/usr/include/Tracy/tracy/

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 extra/desktop/tracy.desktop $pkgdir/usr/share/applications/tracy.desktop
  install -Dm644 icon/icon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/tracy.svg
  install -Dm644 extra/desktop/application-tracy.xml $pkgdir//usr/share/mime/packages/application-tracy.xml
  install -Dm644 icon/application-tracy.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/application-tracy.svg
}
