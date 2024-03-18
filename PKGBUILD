# Maintainer: ryuukk_ <ryuukk.dev@gmail.com>
# Contributor: ryuukk_ <ryuukk.dev@gmail.com>

pkgbase=freetype2
pkgname=(
  freetype2-macos
  freetype2-demos
  freetype2-docs
)
pkgver=2.13.2
pkgrel=1
epoch=
pkgdesc="Font rasterization library with a patch to make it render text like on macOS"
url="https://www.freetype.org/"
arch=(
  x86_64
)
license=(GPL)
depends=(
  brotli
  bzip2
  libpng
  sh
  zlib

  # adding harfbuzz for improved OpenType features auto-hinting
  # introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
  harfbuzz
)
makedepends=(
  librsvg
  libx11
  meson
  qt5-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-doc-$pkgver.tar.xz{,.sig}
  https://download-mirror.savannah.gnu.org/releases/freetype/ft2demos-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-long-PCF-family-names.patch
  9999-macos-like.patch
  freetype2.sh
)
b2sums=('cebc82180d9afaeb112a65ba78903d7bf7a9295a803166a033585ad2325add6023f05066852240c4665e56285345ba503b01ecd461d48f0478a8f3f56136988e'
        'SKIP'
        '273ab405b6c7097ace9c7882fddb22d2a0cf8cc1594e9d141ca18d13a3745ee2e481bd2ee214cba6d99224ef0d67fdcba1b08aa06e3556a80cda29f3b6026f97'
        'SKIP'
        '5e2c3eb2fccb359d03e154b94d349baab27aa465e40274ea99be1e19c8519ec9c434749c78a41743540bd38064a7c68e5389ff99443b8e320e617c4fe7f4558b'
        'SKIP'
        '2c148694e150b3faae9dc46ead824ae6d94cfe34f2918bc9066f45bab7e6b6f77b4d4b2fee00c3d466d866e1985132cea4a774dcf1bab95409b7cf55efff01e1'
        '9598d13eae0411878c1af8e5d875c3b1fc09f4e6649edfbbf3b0a819c4c585648521f0b30ffd1318f5106cfde9c899d3db70c8ffe36dac59f3f98b5fd7dab115'
        '66deb179d1f1f4e2e35f6d50acfbacce80595d5128f5fed8c1871838c210dbf1a7173a87dd937d64997844c8f478c8f81120f71e33b9d59d980e179d103ff31c'
        'SKIP'
        'a964f46886b5017a5c180f29408f72ae8aba29f37404c48b4681ff12ca0a2cfa2a8e219480e98d63d45fb5c266a6e5826df170c9a0d701cd866e395c5ac6e87d')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F  # Werner Lemberg <wl@gnu.org>
)

prepare() {
  # Build FreeType as part of the demos
  ln -sr freetype-$pkgver ft2demos-$pkgver/subprojects/freetype2

  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../9999-macos-like.patch
}

build() {
  local meson_options=(
    -D freetype2:default_library=shared
  )

  arch-meson ft2demos-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_freetype2-macos() {
  provides=(
    libfreetype.so
  )
  conflicts=()
  install=freetype2.install
  backup=(etc/profile.d/freetype2.sh)

  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    freetype-$pkgver/builds/unix/freetype2.m4

  _pick demos "$pkgdir"/usr/bin
  _pick demos "$pkgdir"/usr/share/man/man1
}

package_freetype2-demos() {
  pkgdesc="Freetype tools and demos"
  depends=(
    freetype2
    librsvg
    libx11
  )
  optdepends=(
    'qt5-base: ftinspect'
  )
  provides=()
  conflicts=()

  mv demos/* "$pkgdir"
}

package_freetype2-docs() {
  pkgdesc="Freetype documentation"
  depends=(freetype2)

  mkdir -p "${pkgdir}/usr/share/doc"
  cp -r freetype-$pkgver/docs "$pkgdir/usr/share/doc/$pkgbase"
}

# vim:set sw=2 sts=-1 et:
