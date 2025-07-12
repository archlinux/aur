# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore
pkgver=40.0
pkgrel=7
pkgdesc="A retro gaming application for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Apps/Games"
license=('GPL-3.0-or-later')
depends=(
  'cairo'
  'dconf'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'grilo'
  'gtk4'
  'hicolor-icon-theme'
  'libarchive'
  'libadwaita'
  'libmanette'
  'librsvg'
  'libsoup3'
  'libxml2'
  'retro-gtk-git'
  'sqlite'
  'tinysparql'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
checkdepends=(
  'appstream-glib'
)
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
#  'libretro-duckstation: Sony PlayStation core'
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
  'retroarch: Reference frontend for the libretro API'
)
provides=('gnome-games')
conflicts=('gnome-games')
_commit=b6389d3d279d5904f62249dd5b771523b6eef930  # branch/pre-rewrite
source=("git+https://gitlab.gnome.org/World/highscore.git#commit=${_commit}")
sha512sums=('338c375e41d0f8067f4072f11493e3b4235607a4a8db4242fe315987a59a8aec9a0cbf90d5e9c602e5f715449eaf3e1cf03cf1aa9cb6b2dbe9f476beb6c3a04c'
            'f49f71bf53d206275d0533d57c264952fa65c763e02edde355d9ec5c7379ac27c9e6a7e09f35e9a786c56125585af736799f5767730f8713557d8923232a0645'
            '0a9d66b764d91d6f4fa4741c1b6024b55d3c12d6461738d486bfa6c916856e2dd647b76a4d52f9fe0fa44239c24789fe4ec6d6b7a73f7275e0b91487b2e37a1c'
            '26f0e6914d6c5d23cb87e59a91a8532e74575664b7eef36f6146e326bd9d940792f51a474b3359d54f3eebc4a8a89bd934a9d26550195549ffa73f99c482f2ba'
            '119aec090231c1760f0daf98f76936877f9ee22ff1b7c9a3915810d9882daf22bdc5b69fccd7a37ee76b06450234e76d496a6aed536c9c5c1bb7cf4e869e3260')

prepare() {
  cd "$pkgname"

  # Replace pcsx_rearmed with mednafen_psx
  mv flatpak/libretro-cores/{pcsx_rearmed,mednafen_psx}.libretro
  sed -i 's/^Name=.*/Name=Beetle PSX/
          s/^Module=.*/Module=mednafen_psx_libretro.so/
          s/^Authors=.*/Authors=Mednafen Team;/' \
    flatpak/libretro-cores/mednafen_psx.libretro
}

build() {
  arch-meson "$pkgname" build -Dprofile=development
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/org.gnome.World.Highscore.Devel "$pkgdir/usr/bin/$pkgname"

  # Install *.libretro files
  cd "$pkgname"
  install -Dm644 flatpak/libretro-cores/*.libretro -t "$pkgdir/usr/lib/libretro/"
}
