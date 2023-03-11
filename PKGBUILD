# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=godot3-mono
pkgver=3.5.2
pkgrel=2
pkgdesc='Advanced cross-platform 2D and 3D game engine (3.x Branch Mono)'
url='https://godotengine.org'
license=(MIT)
arch=(x86_64)
makedepends=(gcc scons yasm alsa-lib pulseaudio nuget xorg-server-xvfb)
depends=(embree freetype2 libglvnd libtheora libvorbis libvpx libwebp libwslay
         libsquish libxcursor libxi libxinerama libxrandr mbedtls miniupnpc opusfile dotnet-sdk)
optdepends=(pipewire-alsa pipewire-pulse)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/godotengine/godot/archive/$pkgver-stable.tar.gz"
        "godot"
        "godot3-mono.patch")
b2sums=('f5f9449711b7727846dcc34d0ff44c7fdb64fbdf29c85ca0ba42c2933d01c41aaac8f584e1b9c33b36fc30cfe47710fae935502855255da305694873a9148e7c'
        '3929ecb0ce01d4bf67df2f6ebf4ce2c92390c585c70c4aacfe283cf9978bf034884388d00d929f16e15adf3e65b95c7484bab9e64007b79a9a6c3e30d4b1da45'
        'a5f2aeacb377ed177614c4226c5de6b8dfd68b818591d93786c5c8114c6b55d52c37d8fca5a291966ea01a2c5104ad2d242a7dbc71bc8bf5292f7f6c5107660a')

prepare() {
  # Disable the check that adds -no-pie to LINKFLAGS, for gcc != 6
  sed -i 's,0] >,0] =,g' $_pkgname-$pkgver-stable/platform/x11/detect.py

  # Make godot3-mono be installed with godot
  cd "$srcdir/$_pkgname-$pkgver-stable"
  patch -p1 < "$srcdir/godot3-mono.patch"
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
    rm -rf thirdparty/$_lib
  done

  # Build one to generate mono glue
  
  cd $_pkgname-$pkgver-stable
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
    module_mono_enabled=yes \
    mono_glue=no \
    CFLAGS="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    CXXFLAGS="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
    LINKFLAGS="$LDFLAGS" \
    $system_libs

    # Generate godot mono glue
    cd $srcdir/$_pkgname-$pkgver-stable
    xvfb-run -s "-screen 0 1920x1080x24 -nolisten local" \
    ./bin/godot.x11.opt.tools.64.mono --generate-mono-glue $srcdir/$_pkgname-$pkgver-stable/modules/mono/glue

    # Build two with mono glue
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
      module_mono_enabled=yes \
      mono_glue=yes \
      CFLAGS="$CFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
      CXXFLAGS="$CXXFLAGS -fPIC -Wl,-z,relro,-z,now -w" \
      LINKFLAGS="$LDFLAGS" \
      $system_libs
}

package() {
  # Make godot3-mono compataible with godot
  cd "$srcdir/$_pkgname-$pkgver-stable/misc/dist/linux"

  sed -i 's/Godot Engine/Godot Engine 3 LTS Mono/g' org.godotengine.Godot.desktop

  cd "$srcdir"/$_pkgname-$pkgver-stable
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm755 bin/godot.x11.opt.tools.64.mono "$pkgdir/opt/$pkgname/godot.x11.opt.tools.64.mono"
  install -Dm755 bin/libmonosgen-2.0.so "$pkgdir/opt/$pkgname/libmonosgen-2.0.so"
  cp -r bin/GodotSharp "$pkgdir/opt/$pkgname/GodotSharp"
  install -Dm755 "$srcdir/godot" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/$pkgname.6"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot3-Mono.xml"
}
