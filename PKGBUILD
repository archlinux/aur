# Maintainer: Daurnimator <quae@daurnimator.com>
# Contributor: Jens Staal <staal1978@gmail.com>

## Known issue: cmake uses absolute paths which result in binaries containing
## build root via __FILE__ macro

pkgname=arcan
pkgver=0.6.2
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
         #'libuvc' # TODO: using vendored copy until moved to community
         'libvncserver'
         'lua51' # Doesn't compile against LuaJIT 2.1 due to deprecated ref API usage
         'mesa'
         'libmupdf'
         'openal'
         'sdl'
         'sqlite'
         'tesseract'
         'wayland'
         'vlc')
makedepends=('cmake'
             'meson'
             'ruby')
source=("$pkgname-$pkgver.tar.gz::https://github.com/letoram/arcan/archive/$pkgver.tar.gz")
sha256sums=('635c447c341c7b803fd13317d3027ce438e8965803943a213a8f4409352d889c')

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
    src
  make -C build
}

package() {
  cd "$pkgbase-$pkgver"

  make -C build DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
