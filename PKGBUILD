# Maintainer: Daurnimator <quae@daurnimator.com>
# Contributor: Jens Staal <staal1978@gmail.com>

## Known issue: cmake uses absolute paths which result in binaries containing
## build root via __FILE__ macro

pkgname=('arcan'
         'arcan-acfgfs'
         'arcan-aclip'
         'arcan-aloadimage'
         'arcan-leddec'
         'arcan-ltui'
         'arcan-shmmon'
         'arcan-vrbridge')
pkgver=0.5.5
pkgrel=2
pkgdesc='Game Engine meets a Display Server meets a Multimedia Framework'
arch=('x86_64')
url='https://arcan-fe.com'
license=('GPL' 'LGPL' 'BSD')
makedepends=('cmake'
             'fuse3'
             'libvncserver'
             'lua51' # Doesn't compile against LuaJIT 2.1 due to deprecated ref API usage
             # TODO: vrbridge wants openhmd
             'ruby')
source=("$pkgname-$pkgver.tar.gz::https://github.com/letoram/arcan/archive/$pkgver.tar.gz")
sha256sums=('578ed860a99a02cf1cf963efac830eb8af08093e4322832b2be6554d8c922ff2')

build() {
  cd "$pkgbase-$pkgver"

  # Build docs
  ## Needs to happen before cmake runs
  ruby -C doc -Ku docgen.rb mangen

  # Build main library/application
  mkdir -p build
  env -C build cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDISABLE_JIT=ON \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
    -DDISTR_TAG=arch \
    -DENGINE_BUILDTAG="$pkgver" \
    -DDISABLE_HIJACK=OFF \
    -DVIDEO_PLATFORM=sdl \
    ../src
  make -C build

  # Build misc utils
  ## waybridge is disabled on VIDEO_PLATFORM=sdl
  ## leddec and ltui are missing install rules, so build with install RPATH
  for tool in acfgfs aclip aloadimage leddec ltui shmmon vrbridge; do
    env -C "src/tools/$tool" \
      cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DARCAN_SHMIF_INCLUDE_DIR=../../shmif \
      -DARCAN_SHMIF_LIBRARY=../../../build/shmif/libarcan_shmif.so \
      -DARCAN_TUI_INCLUDE_DIR=../../shmif \
      -DARCAN_TUI_LIBRARY=../../../build/shmif/libarcan_tui.so \
      -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
    make -C "src/tools/$tool"
  done
}

package_arcan() {
  depends=('apr'
           'harfbuzz-icu'
           'libvncserver'
           'lua51'
           'openal'
           'sdl'
           'vlc')

  cd "$pkgbase-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_arcan-acfgfs() {
  pkgdesc='Arcan virtual filesystem for working with the format that durden (and others) provide over a domain socket'
  depends=('fuse3')

  cd "$pkgbase-$pkgver"

  make -C src/tools/acfgfs DESTDIR="$pkgdir" install
}

package_arcan-aclip() {
  pkgdesc='Arcan clipboard integration, similarly to how "xclip" works for Xorg'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C src/tools/aclip DESTDIR="$pkgdir" install
}

package_arcan-aloadimage() {
  pkgdesc='Arcan sandboxed image loader, supporting multi-process privilege separation, playlists and so on - similar to xloadimage'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C src/tools/aloadimage DESTDIR="$pkgdir" install
}

package_arcan-shmmon() {
  pkgdesc='Simple shmif- debugging aid for Arcan'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C src/tools/shmmon DESTDIR="$pkgdir" install
}

package_arcan-vrbridge() {
  pkgdesc='Aggregates samples from VR related SDKs and binds into a single avatar in a way that integrates with the core engine VR path'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  make -C src/tools/vrbridge DESTDIR="$pkgdir" install
}

package_arcan-leddec() {
  pkgdesc='A simple skeleton that can be used for interfacing with custom LED controllers using Arcan'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  install -Dm755 src/tools/leddec/leddec "$pkgdir/usr/bin/arcan_leddec"
}

package_arcan-ltui() {
  pkgdesc='A patched version of the Lua interactive CLI that loads in the shmif-tui (text-user interfaces)'
  depends=('arcan')

  cd "$pkgbase-$pkgver"

  install -Dm755 src/tools/ltui/ltui "$pkgdir/usr/bin/arcan_ltui"
}
