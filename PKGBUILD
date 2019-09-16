# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# Maintainer: Martin Kröning <m.kroening@hotmail.de>
# Contributor: sl1pkn07
# Contributor: Ryan Peters <sloshy45 at sbcglobal dot net>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: Dan Guzek <dguzek@gmail.com>

pkgname=stepmania-git
pkgver=5.1.0_b2_362_g75d9400cb0
pkgrel=1
pkgdesc="An advanced rhythm game designed for both home and arcade use"
arch=(x86_64)
url="https://www.stepmania.com/"
license=(MIT)
depends=(ffmpeg glew gtk2 libmad libtommath)
makedepends=(cmake git ninja)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/${pkgname%-git}/${pkgname%-git}.git"
        '0001-GtkModule-Add-harfbuzz-dependency.patch')
sha256sums=('SKIP'
            'e14451013f32aba41b37ae0c4b4ee5963eccb47e011843bf52f7e5fdc1034468')

pkgver() {
	cd ${pkgname%-git}
	git describe --tags | sed 's/^v//;s/-/_/g'
}

prepare() {
	cd ${pkgname%-git}
  mkdir build
  # Related issue: Harfbuzz includes missing
  # https://github.com/stepmania/stepmania/issues/1850
	patch -p1 -i "$srcdir/0001-GtkModule-Add-harfbuzz-dependency.patch"
}

build() {
  cd ${pkgname%-git}/build
  # # Related issues
  # * OpenGL GL preference: https://github.com/stepmania/stepmania/issues/1859
  # * system libpng: https://github.com/stepmania/stepmania/issues/1881
  # * system tomcrypt: https://github.com/stepmania/stepmania/issues/1885
  # * system jsoncpp: https://github.com/stepmania/stepmania/issues/1883
  cmake -G Ninja .. \
    -DCMAKE_INSTALL_PREFIX=/opt \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DWITH_LTO=ON \
    -DWITH_SYSTEM_PNG=OFF \
    -DWITH_SYSTEM_OGG=ON \
    -DWITH_SYSTEM_GLEW=ON \
    -DWITH_SYSTEM_TOMMATH=ON \
    -DWITH_SYSTEM_TOMCRYPT=OFF \
    -DWITH_SYSTEM_MAD=ON \
    -DWITH_SYSTEM_JSONCPP=OFF \
    -DWITH_SYSTEM_JPEG=ON \
    -DWITH_SYSTEM_PCRE=ON \
    -DWITH_SYSTEM_ZLIB=ON \
    -DWITH_SYSTEM_FFMPEG=ON
  cmake --build .
}

package() {
  cd ${pkgname%-git}
  DESTDIR="$pkgdir" cmake --install build

  # Symlink stepmania binary which is located in /opt
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/${pkgname%-git}-5.1/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"

  # Install auxiliary files
  install -Dt "$pkgdir/usr/share/applications" -m644 "$srcdir/${pkgname%-git}/${pkgname%-git}.desktop"
  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/${pkgname%-git}/icons" "$pkgdir/usr/share/icons"

  # Install license
  install -Dm644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
