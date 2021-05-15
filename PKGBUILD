# Maintainer: Daurnimator <quae@daurnimator.com>
# Contributor: Jens Staal <staal1978@gmail.com>

## Known issue: cmake uses absolute paths which result in binaries containing
## build root via __FILE__ macro

pkgname=('arcan'
         'arcan-acfgfs'
         'arcan-aclip'
         'arcan-adbgcapture'
         'arcan-adbginject'
         'arcan-aloadimage'
         'arcan-shmmon'
         'arcan-trayicon'
         'arcan-vrbridge')
pkgver=0.6.1pre1
pkgrel=1
pkgdesc='Game Engine meets a Display Server meets a Multimedia Framework'
arch=('x86_64')
url='https://arcan-fe.com'
license=('GPL' 'LGPL' 'BSD')
depends=('espeak-ng'
         'freetype2'
         'harfbuzz'
         'leptonica'
         'libseccomp'
         'libuvc'
         'libvncserver'
         'lua51' # Doesn't compile against LuaJIT 2.1 due to deprecated ref API usage
         'mesa'
         'openal'
         'sdl'
         'sqlite'
         'tesseract'
         'wayland'
         'vlc')
makedepends=('cmake'
             'meson'
             'ruby'
             # Dependencies for tools
             'fuse3'
             'openhmd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/letoram/arcan/archive/$pkgver.tar.gz")
sha256sums=('23fc768f006e6a19e1088451aaf95ca1e7d2b5c8e78d8e3954002ef7eba32613')

build() {
  cd "$pkgbase-$pkgver"

  # Build docs
  ## Needs to happen before cmake runs
  ruby -C doc -Ku docgen.rb mangen

  # Build main library/application
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISABLE_JIT=ON \
    -DDISTR_TAG=arch \
    -DENGINE_BUILDTAG="$pkgver-$pkgrel" \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
    -DHYBRID_HEADLESS=ON \
    -DHYBRID_SDL=ON \
    -DSTATIC_LIBUVC=OFF \
    src
  make -C build

  # Build misc utils
  for tool in adbgcapture adbginject trayicon; do
    arch-meson "src/tools/$tool" "build-$tool"
    meson compile -C "build-$tool"
  done
  for tool in acfgfs aclip aloadimage shmmon vrbridge; do
    cmake -B "build-$tool" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DARCAN_SHMIF_INCLUDE_DIR=src/shmif \
      -DARCAN_SHMIF_LIBRARY=build/shmif/libarcan_shmif.so \
      -DARCAN_SHMIF_EXT_LIBRARY=build/shmif/libarcan_shmif_ext.so \
      -DARCAN_TUI_INCLUDE_DIR=src/shmif \
      -DARCAN_TUI_LIBRARY=build/shmif/libarcan_tui.so \
      -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
      -Wno-dev \
      "src/tools/$tool"
    make -C "build-$tool"
  done
}

package_arcan() {
  cd "$pkgbase-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_arcan-acfgfs() {
  pkgdesc='Arcan virtual filesystem for working with the format that durden (and others) provide over a domain socket'
  depends=('arcan'
           'fuse3')

  cd "$pkgbase-$pkgver"

  make -C build-acfgfs DESTDIR="$pkgdir" install
}

package_arcan-aclip() {
  pkgdesc='Arcan clipboard integration, similarly to how "xclip" works for Xorg'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C build-aclip DESTDIR="$pkgdir" install
}

package_arcan-adbgcapture() {
  pkgdesc='debugging tool that uses arcan-tui as a frontend to launch a debugger or otherwise interactively control what to do with a process that has crashed'
  depends=('arcan')
  optdepends=('gdb'
              'lldb')

  cd "$pkgbase-$pkgver"

  DESTDIR="$pkgdir" meson install -C build-adbgcapture
}

package_arcan-adbginject() {
  pkgdesc='a trivial dynamic interposition library for providing some arcan UI interfacing'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  DESTDIR="$pkgdir" meson install -C build-adbginject
}

package_arcan-aloadimage() {
  pkgdesc='Arcan sandboxed image loader, supporting multi-process privilege separation, playlists and so on - similar to xloadimage'
  depends=('arcan'
           'libseccomp')

  cd "$pkgbase-$pkgver"

  make -C build-aloadimage DESTDIR="$pkgdir" install
}

package_arcan-shmmon() {
  pkgdesc='Simple shmif- debugging aid for Arcan'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C build-shmmon DESTDIR="$pkgdir" install
}

package_arcan-trayicon() {
  pkgdesc='a simple tool that connects to arcan as an ICON'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  DESTDIR="$pkgdir" meson install -C build-trayicon
}

package_arcan-vrbridge() {
  pkgdesc='Aggregates samples from VR related SDKs and binds into a single avatar in a way that integrates with the core engine VR path'
  depends=('arcan'
           'openhmd')

  cd "$pkgbase-$pkgver"

  make -C build-vrbridge DESTDIR="$pkgdir" install
}
