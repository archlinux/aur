# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore
pkgver=40.0
pkgrel=5
pkgdesc="A retro gaming application for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Apps/Games"
license=('GPL3')
depends=('grilo' 'libarchive' 'libhandy' 'libmanette' 'retro-gtk' 'tracker3')
makedepends=('meson' 'vala')
optdepends=(
  'libretro-beetle-ngp: Support for Neo Geo Pocket and Neo Geo Pocket Color games'
  'libretro-beetle-pce-fast: NEC PC Engine/CD core'
  'libretro-beetle-pce: NEC PC Engine/SuperGrafx/CD core'
  'libretro-beetle-psx-hw: Sony PlayStation core'
  'libretro-beetle-psx: Sony PlayStation core'
  'libretro-beetle-vb: Support for Virtual Boy games'
#  'libretro-beetle-wswan: Support for WonderSwan and WonderSwan Color games'
  'libretro-beetle-supergrafx: NEC SuperGrafx core'
  'libretro-blastem: Sega Mega Drive core'
  'libretro-bsnes-hd: Super Nintendo Entertainment System core'
#  'libretro-bsnes-mercury-balanced: Support for Super Nintendo Entertainment System games'
  'libretro-bsnes2014: Super Nintendo Entertainment System cores'
  'libretro-bsnes: Super Nintendo Entertainment System cores'
  'libretro-citra: Nintendo 3DS core'
  'libretro-core-info: Libretro core info files'
  'libretro-desmume: Nintendo DS core'
#  'libretro-desmume2015: Support for Nintendo DS games'
  'libretro-dolphin: Nintendo GC/Wii core'
  'libretro-duckstation: Sony PlayStation core'
  'libretro-flycast: Sega Dreamcast core'
  'libretro-gambatte: Nintendo Game Boy/Game Boy Color core'
#  'libretro-gearsystem: Support for Game Gear, Master System and SG-1000 games'
  'libretro-genesis-plus-gx: Sega MS/GG/MD/CD core'
  'libretro-handy: Support for Atari Lynx games'
  'libretro-kronos: Sega Saturn core'
  'libretro-melonds: Nintendo DS core'
  'libretro-mesen-s: Super Nintendo Entertainment System core'
  'libretro-mesen: Nintendo Entertainment System core'
  'libretro-mgba: Nintendo Game Boy Advance core'
  'libretro-mupen64plus-next: Nintendo 64 core'
  'libretro-nestopia: Nintendo Entertainment System core'
  'libretro-overlays: Collection of overlays for libretro'
  'libretro-parallel-n64: Nintendo 64 core'
  'libretro-pcsx2: Sony PlayStation 2 core'
  'libretro-picodrive: Sega MS/MD/CD/32X core'
  'libretro-play: Sony PlayStation 2 core'
  'libretro-ppsspp: Sony PlayStation Portable core'
  'libretro-prosystem: Support for Atari 7800 games'
  'libretro-retrodream: Sega Dreamcast core'
  'libretro-sameboy: Nintendo Game Boy/Game Boy Color core'
  'libretro-scummvm: ScummVM core'
  'libretro-shaders-slang: Collection of shaders for libretro'
  'libretro-snes9x: Super Nintendo Entertainment System core'
  'libretro-stella2014: Support for Atari 2600 games'
  'libretro-yabause: Sega Saturn core'
  'retroarch: Reference frontend for the libretro API')
checkdepends=('appstream-glib')
provides=('gnome-games')
conflicts=('gnome-games')
replaces=('gnome-games')
source=("https://gitlab.gnome.org/World/highscore/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        'tracker3.patch'
        'meson-0.60.patch')
sha512sums=('39e1abfe4dae8a349449d8a42070a5f1eb9e7556c5857477ef24213710aff09faebffd0e77ce1aaf22f65ea3e7d057c6f8b590810dcab97324f8772dd22a31fa'
            'b7e60604171b3189cd38cbfdb165d29d524a9f08c807fef7dccf251b52a745d60cfadafc86e305634c2313f04989664e26d0483cd86fb51ea176ecff47e38967'
            '714e7cabbb45b63eddccfe295976a29bc85b577c2040a55903b84a2270fa7b63621cbed50c0bfecf1f17a8a8eb28d98e0a3f7c611ba30a97b62a44ffd6566340')

prepare() {
  cd $pkgname-$pkgver
  # Port to Tracker 3
  patch -Np1 -i ../tracker3.patch

  # Fix build with meson 0.60 (Alpine)
  patch -p1 -i ../meson-0.60.patch

  # Replace pcsx_rearmed with mednafen_psx
  mv flatpak/libretro-cores/{pcsx_rearmed,mednafen_psx}.libretro
  sed -i 's/^Name=.*/Name=Beetle PSX/
          s/^Module=.*/Module=mednafen_psx_libretro.so/
          s/^Authors=.*/Authors=Mednafen Team;/' \
    flatpak/libretro-cores/mednafen_psx.libretro
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Install *.libretro files
  cd "$pkgname-$pkgver"
  install -Dm644 flatpak/libretro-cores/*.libretro -t "$pkgdir/usr/lib/libretro/"
}
