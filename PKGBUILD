# Contributor: Florian B <mr.maxmeier at gmail dot com>
# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy-x11
pkgver=0.12.2
pkgrel=1
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://github.com/wolfpld/tracy"
license=('BSD-3-Clause')
depends=('glfw-x11' 'freetype2' 'dbus' 'hicolor-icon-theme')
makedepends=('pkgconf' 'git' 'cmake')
optdepends=('xdg-desktop-portal: file dialogs')
options=('!lto')
provides=('tracy')
conflicts=('tracy')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd tracy

  cmake -S . -B build -D CMAKE_BUILD_TYPE=Release
  make -C build
  cmake -S capture -B capture/build -D CMAKE_BUILD_TYPE=Release
  make -C capture/build
  cmake -S csvexport -B csvexport/build -D CMAKE_BUILD_TYPE=Release
  make -C csvexport/build
  cmake -S import -B import/build -D CMAKE_BUILD_TYPE=Release
  make -C import/build
  cmake -S profiler -B profiler/build -D CMAKE_BUILD_TYPE=Release -D LEGACY=ON
  make -C profiler/build
  cmake -S update -B update/build -D CMAKE_BUILD_TYPE=Release
  make -C update/build
}

package() {
  cd tracy
  install -Dm644 build/libTracyClient.a $pkgdir/usr/lib/libTracyClient.a
  install -Dm755 capture/build/tracy-capture $pkgdir/usr/bin/tracy-capture
  install -Dm755 csvexport/build/tracy-csvexport $pkgdir/usr/bin/tracy-csvexport
  install -Dm755 import/build/tracy-import-chrome $pkgdir/usr/bin/tracy-import-chrome
  install -Dm755 import/build/tracy-import-fuchsia $pkgdir/usr/bin/tracy-import-fuchsia
  install -Dm755 profiler/build/tracy-profiler $pkgdir/usr/bin/tracy
  install -Dm755 update/build/tracy-update $pkgdir/usr/bin/tracy-update

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
