# Maintainer: Keil <keilmillerjr@outlook.com>

pkgname=attractplus
pkgver=3.2.3
pkgrel=1
pkgdesc='Graphical frontend for MAME and other command-line emulators'
arch=('x86_64')
url='https://github.com/oomek/attractplus'
# GPL for Attract-Mode Plus; the rest for bundled code compiled into it:
# SFML and sqrat (Zlib), squirrel and rapidjson (MIT), cereal (BSD-3-Clause),
# nowide (BSL-1.0), miniz (Unlicense)
license=('GPL-3.0-or-later' 'Zlib' 'MIT' 'BSD-3-Clause' 'BSL-1.0' 'Unlicense')
depends=('curl' 'expat' 'ffmpeg' 'flac' 'freetype2' 'glibc' 'hicolor-icon-theme'
         'libarchive' 'libdrm' 'libgcc' 'libglvnd' 'libstdc++' 'libvorbis' 'libx11'
         'libxcursor' 'libxi' 'libxinerama' 'libxrandr' 'mesa' 'systemd-libs' 'zlib')
makedepends=('cmake' 'glu' 'openal')  # linked by the Makefile, dropped by --as-needed
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('51ecce34e7a7550a5af8d3544d0bb448768dce02970583a995ed153a97e3026d')

build() {
  cd "$pkgname-$pkgver"
  # The Makefile ignores CFLAGS and LDFLAGS from the environment, but uses
  # EXTRA_CFLAGS for both compiling and linking
  local _flags=(
    prefix=/usr
    EXTRA_CFLAGS="$CXXFLAGS $CPPFLAGS $LDFLAGS"
    FE_HWACCEL_VAAPI=1
    FE_HWACCEL_VDPAU=1
  )

  # Build the X11 and the KMS (no display server) binaries in turn, each from
  # a clean obj/: upstream's Makefile always builds its bundled SFML in
  # obj/sfml, so the two cannot use separate object directories.
  rm -rf obj
  make "${_flags[@]}"
  rm -rf obj
  make "${_flags[@]}" USE_DRM=1 EXE_BASE=attractplus-kms
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 attractplus attractplus-kms -t "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/attractplus"
  cp -r --no-preserve=ownership config/. "$pkgdir/usr/share/attractplus"

  # Upstream points Icon= at an absolute path, in the wrong size directory
  sed 's/^Icon=.*/Icon=attract-mode-plus/' util/linux/attract-mode-plus.desktop \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/attract-mode-plus.desktop"
  install -Dm644 util/linux/attract-mode-plus.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/attract-mode-plus.png"
  install -Dm644 util/linux/attract-mode-plus.appdata.xml \
    "$pkgdir/usr/share/metainfo/attract-mode-plus.metainfo.xml"

  install -Dm644 Readme.md Manual.md Layouts.md -t "$pkgdir/usr/share/doc/$pkgname"

  local _dir="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 extlibs/SFML/license.md "$_dir/SFML.md"
  install -Dm644 extlibs/squirrel/COPYRIGHT "$_dir/squirrel.txt"
  install -Dm644 extlibs/rapidjson/license.txt "$_dir/rapidjson.txt"
  install -Dm644 extlibs/cereal/LICENSE "$_dir/cereal.txt"
}
