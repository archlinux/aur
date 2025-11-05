# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=godot3
pkgver=3.6.2
pkgrel=1
pkgdesc='Advanced cross-platform 2D and 3D game engine (3.x Branch)'
url='https://godotengine.org'
license=(MIT)
arch=(x86_64)
makedepends=(gcc scons yasm alsa-lib pulse-native-provider)
depends=(embree3 freetype2 libglvnd libtheora libvorbis libvpx libwebp libwslay
         libsquish libxcursor libxi libxinerama libxrandr opusfile
	 zstd zlib glibc libxrender pcre2 libx11 opus libogg libxext)
optdepends=(pipewire-alsa pipewire-pulse)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/godotengine/godot/archive/$pkgver-stable.tar.gz"
        "godot3.patch")
b2sums=('f0114815b1cb3178a9c1f4a9eb3057d52b7a90c762d84f398926695d3b593d809bed7945431314df4ca37c03806632217a48fcc9e99266d3f25c82c0efe34eda'
        '5ed41b79e0121e66614cce997d8c05b3efafefb45d93a426fe4f63bc9917a8dad8519d3f11021a62d6b3a8f7210f2cc86d03361a51dcf79007b0eb71289c1370')

prepare() {
  # Disable the check that adds -no-pie to LINKFLAGS, for gcc != 6
  sed -i 's,0] >,0] =,g' $_pkgname-$pkgver-stable/platform/x11/detect.py

  # Make godot build a binary compatible with Godot 4
  cd "$srcdir/$_pkgname-$pkgver-stable"
  patch -p1 < "$srcdir/godot3.patch"
  #sed -i 's/addr, 16/addr, 16, nullptr, 0/g' "$srcdir/$_pkgname-$pkgver-stable/modules/upnp/upnp.cpp"
}

build() {
  # Not unbundled (yet):
  #  bullet (FS#72924, https://github.com/godotengine/godot/issues/55599)
  #  certs (FS#72762)
  #  enet (contains no upstreamed IPv6 support)
  #  recast, xatlas
  #  AUR: libwebm
  local to_unbundle="embree freetype libogg libpng libsquish libtheora libvorbis libvpx libwebp opus pcre2 wslay zlib zstd"
  local system_libs=""
  for _lib in $to_unbundle; do
    system_libs+="builtin_"$_lib"=no "
    rm -rf $srcdir/$_pkgname-$pkgver-stable/thirdparty/$_lib
  done

  cd $srcdir/$_pkgname-$pkgver-stable
  export BUILD_NAME=arch_linux
  scons -j$(nproc) \
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
  # make godot3 compatible with godot
  cd "$srcdir/$_pkgname-$pkgver-stable/misc/dist/linux/"

  sed -i 's/Godot Engine/Godot Engine 3 LTS/g' org.godotengine.Godot.desktop
  
  cd $srcdir/$_pkgname-$pkgver-stable
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop \
    "$pkgdir/usr/share/applications/org.godotengine.Godot3.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm755 bin/godot.x11.opt.tools.64 "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot3.xml"
}
