# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2
pkgver=2.1.23
_dataver=2.1.23
_patchver=2.1.23
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl2_mixer' 'libpng' 'libgme' "srb2-data>=$_dataver")
makedepends=('mesa' 'glu')
makedepends_i686=('nasm')
source=("https://github.com/STJr/SRB2/archive/SRB2_release_$pkgver.zip"
        "https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v${_patchver//./}-patch.zip"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('f3f50363251c652dbcf6a778361a5140e57783c3b0c4a1c62b528db07e1b1421'
            'e5e3ecb5c2734dd8fea6ff5fe6531d1b3b0092dcb2dff1ee85c7c97a6cbb9f01'
            'ac9fa63f29ad9413797da8c6f0a4f76fa6f4dd0710d1e84a457a8c42cf6df4f9'
            'f696bab390d2b1028bf2f5c5d4d838c0981dc211cec4c4a8f349b7ec0580e701')

prepare() {
  cd SRB2-SRB2_release_$pkgver/src
  # disable Animated PNG saving support, allows build with libpng16
  sed 's|#define USE_APNG|/* & */|' -i m_misc.c

  # use better version string
  sed 's/-DCOMPVERSION//' -i Makefile
  sed 's/illegal/AUR/' -i comptime.c
}

build() {
  cd SRB2-SRB2_release_$pkgver/src

  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  # do not upx binary, do not use version script (optional: show warnings, be verbose)
  make LINUX$IS64BIT=1 NOUPX=1 NOVERSION=1 #WARNINGMODE=1 ECHO=1
}

package() {
  [ "$CARCH" == "x86_64" ] && IS64BIT="64" || IS64BIT=""
  install -Dm755 SRB2-SRB2_release_$pkgver/bin/Linux$IS64BIT/Release/lsdl2srb2 \
    "$pkgdir"/usr/bin/srb2

  # data patch 2.1.15 → 2.1.23
  install -Dm644 patch.dta "$pkgdir"/usr/share/games/SRB2/patch.dta

  # icon + .desktop
  install -Dm644 SRB2-SRB2_release_$pkgver/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
}
