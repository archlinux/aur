# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: loqs
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

_pkgname=godot
pkgname=godot3-git
pkgver=r34303.338114d
_pkgverbranch=3.5
pkgrel=3
pkgdesc='Advanced cross-platform 2D and 3D game engine (3.x Branch)'
url='https://godotengine.org'
license=(MIT)
arch=(x86_64)
makedepends=(gcc scons yasm alsa-lib pulseaudio)
depends=(embree3 freetype2 libglvnd libtheora libvorbis libvpx libwebp libwslay
         libsquish libxcursor libxi libxinerama libxrandr miniupnpc opusfile)
optdepends=(pipewire-alsa pipewire-pulse)
provides=("godot3")
conflicts=("godot3")
source=("git+https://github.com/godotengine/godot.git#branch=$_pkgverbranch"
        "godot3.patch")
b2sums=('SKIP'
        '5ed41b79e0121e66614cce997d8c05b3efafefb45d93a426fe4f63bc9917a8dad8519d3f11021a62d6b3a8f7210f2cc86d03361a51dcf79007b0eb71289c1370')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  # Disable the check that adds -no-pie to LINKFLAGS, for gcc != 6
  sed -i 's,0] >,0] =,g' $_pkgname/platform/x11/detect.py

  cd "$srcdir/$_pkgname"
  patch -p1 < "$srcdir/godot3.patch"
}

build() {
  # Not unbundled (yet):
  #  bullet (FS#72924, https://github.com/godotengine/godot/issues/55599)
  #  certs (FS#72762)
  #  enet (contains no upstreamed IPv6 support)
  #  recast, xatlas
  #  AUR: libwebm
  local to_unbundle="embree freetype libogg libpng libsquish libtheora libvorbis libvpx libwebp miniupnpc opus pcre2 wslay zlib zstd"
  local system_libs=""
  for _lib in $to_unbundle; do
    system_libs+="builtin_"$_lib"=no "
    rm -rf $srcdir/$_pkgname/thirdparty/$_lib
  done

  cd $srcdir/$_pkgname
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
  cd "$srcdir/$_pkgname/misc/dist/linux/"

  sed -i 's/Godot Engine/Godot Engine 3 LTS/g' org.godotengine.Godot.desktop

  cd $srcdir/$_pkgname
  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop \
    "$pkgdir/usr/share/applications/godot3.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/godot3.svg"
  install -Dm755 bin/godot.x11.opt.tools.64 "$pkgdir/usr/bin/godot3"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/godot3-git/LICENSE"
  install -Dm644 misc/dist/linux/godot.6 "$pkgdir/usr/share/man/man6/godot3.6"
  install -Dm644 misc/dist/linux/org.godotengine.Godot.xml \
    "$pkgdir/usr/share/mime/packages/org.godotengine.Godot3.xml"
}
