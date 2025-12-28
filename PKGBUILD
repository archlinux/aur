# Maintainer: Jérôme Launay <jerome@projet-libre.org>

pkgname=cr2xt-git
pkgver=0.9.0.r1.078e184
pkgrel=1
pkgdesc='E-book to XTC format converter based on Cool Reader and crengine.'
arch=(x86_64)
url=https://github.com/CrazyCoder/cr2xt
license=(GPL-2.0-only)
depends=(qt6-base zlib libpng libjpeg-turbo libwebp freetype2 harfbuzz fribidi libunibreak zstd libutf8proc fontconfig hicolor-icon-theme)
makedepends=(git cmake qt6-tools)
provides=(cr2xt)
conflicts=(crqt-ng crqt-ng-git crengine-ng crengine-ng-git)
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/cr2xt"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/cr2xt"
  git submodule update --init --recursive
}

prepare() {
    repo="${srcdir}/cr2xt"
    git -C $repo submodule init
    git -C $repo -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S "$srcdir/cr2xt" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT=QT6 \
    -DUSE_COLOR_BACKBUFFER=OFF \
    -DGRAY_BACKBUFFER_BITS=2 \
    -DCRE_BUILD_SHARED=ON \
    -DCRE_BUILD_STATIC=OFF

  cmake --build build
}

package() {
  make -C build DESTDIR="$pkgdir/" install
  ln -s /usr/bin/crqt "$pkgdir/usr/bin/cr2xt"
}
