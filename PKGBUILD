# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=godot3
pkgver=3.5.1
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (3.x Branch)'
url='https://godotengine.org'
license=(MIT)
arch=(x86_64)
makedepends=(gcc scons yasm alsa-lib pulseaudio)
depends=(embree freetype2 libglvnd libtheora libvorbis libvpx libwebp libwslay
         libsquish libxcursor libxi libxinerama libxrandr mbedtls miniupnpc opusfile)
optdepends=(pipewire-alsa pipewire-pulse)
provides=("godot")
conflicts=("godot")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/godotengine/godot/archive/$pkgver-stable.tar.gz")
b2sums=('e8a209972fc680ce9c024762715c64ea36f9d1ca223c6911a5179ff1cff3c2a143b703bb5b41f198b8b3ed5bd2c474316177bda094a3ef34d06e2dcf2adb2815')

prepare() {
  # Disable the check that adds -no-pie to LINKFLAGS, for gcc != 6
  sed -i 's,0] >,0] =,g' $_pkgname-$pkgver-stable/platform/x11/detect.py
}

build() {
  # Not unbundled (yet):
  #  bullet (FS#72924, https://github.com/godotengine/godot/issues/55599)
  #  certs (FS#72762)
  #  enet (contains no upstreamed IPv6 support)
  #  recast, xatlas
  #  AUR: libwebm
  local to_unbundle="embree freetype libogg libpng libsquish libtheora libvorbis libvpx libwebp mbedtls miniupnpc opus pcre2 wslay zlib zstd"
  local system_libs=""
  for _lib in $to_unbundle; do
    system_libs+="builtin_"$_lib"=no "
    rm -rf $srcdir/$_pkgname-$pkgver-stable/thirdparty/$_lib
  done

  cd $srcdir/$_pkgname-$pkgver-stable
  export BUILD_NAME=arch_linux
  scons -j16 \
    bits=64 \
    colored=yes \
    platform=x11 \
    pulseaudio=yes \
    system_certs_path=/etc/ssl/certs/ca-certificates.crt \
    target=release_debug \
    tools=yes \
    use_llvm=no \
    CFLAGS="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    CXXFLAGS="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    LINKFLAGS="$LDFLAGS" \
    $system_libs
}

package() {
  cd $srcdir/$_pkgname-$pkgver-stable
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop \
    "$pkgdir/usr/share/applications/godot.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/godot.svg"
  install -Dm755 bin/godot.x11.opt.tools.64 "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/godot/LICENSE"
  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/godot.6"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot.xml"
}
