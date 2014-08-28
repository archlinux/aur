# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2
pkgver=2.1.11
_dataver=2.1.11
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl2_mixer' 'libpng' "srb2-data=$_dataver")
makedepends=('mesa' 'glu')
[ "$CARCH" == "i686" ] && makedepends+=('nasm')
source=("https://github.com/STJr/SRB2/archive/SRB2_release_$pkgver.zip"
        "http://rosenthalcastle.org/srb2/SRB2-v${pkgver//./}-patch.zip"
        "https://raw.githubusercontent.com/STJr/SRB2/SRB2_release_$pkgver/src/sdl/SDL_icon.xpm"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('675074b1e326f064e62fe5367c03c970504c1b8aa851760cd4c2e1ecc6be44d1'
            '49a5af21f772938c39082942b1376c901f9ceeec2b5d971977d7d493152a8101'
            '25b73393baa18ac60782c3b4172c1d4345649322e420bbfe284e542445987d3f'
            'ac9fa63f29ad9413797da8c6f0a4f76fa6f4dd0710d1e84a457a8c42cf6df4f9'
            'f696bab390d2b1028bf2f5c5d4d838c0981dc211cec4c4a8f349b7ec0580e701')

prepare() {
  cd SRB2-SRB2_release_$pkgver/src
  # backport of a commit, that fixes the sdl2 build
  # https://github.com/STJr/SRB2/commit/b1e1163b91fc8237dd2005a018fa2b0b60f30118
  sed 's|INTERFACE=sdl2|INTERFACE=sdl|' -i Makefile.cfg
  # disable Animated PNG saving support, allows build with libpng16
  sed 's|#define USE_APNG|/* & */|' -i m_misc.c
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

  # data patch 2.1.10 → 2.1.11
  install -Dm644 patch.dta "$pkgdir"/usr/share/games/SRB2/patch.dta

  # icon + .desktop
  install -Dm644 SDL_icon.xpm "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
}
