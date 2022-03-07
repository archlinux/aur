# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

pkgname=srb2
pkgver=2.2.10
_dataver=2.2.10
pkgrel=1
pkgdesc='A 3D Sonic fan game based off of Doom Legacy (aka "Sonic Robo Blast 2")'
arch=('i686' 'x86_64')
license=('GPL')
url='http://www.srb2.org'
depends=('sdl2_mixer' 'libpng' 'libgme' "srb2-data>=$_dataver" 'libopenmpt')
makedepends=('mesa' 'glu')
makedepends_i686=('nasm')
source=("https://github.com/STJr/SRB2/archive/SRB2_release_${pkgver}.zip"
        "srb2.desktop"
        "srb2-opengl.desktop")
sha256sums=('eab373a60408247faf85247199a6ce65053b2da5ed9f4eda95d2d08355434b8b'
            '8ffd2b2d1662045ce890b59ff420f9426531e073e9c8f4f5c158da53e150cc21'
            'ff5f4a5413cf3110d9b064a98f8512a925bf8e7f127c8cf7ddb43885cff3c38d')

prepare() {
  cd SRB2-SRB2_release_$pkgver/src

  # disable Animated PNG saving support, allows build with libpng16
  sed 's|#define USE_APNG|/* & */|' -i m_misc.c

  # make comptime.sh optional
  sed 's/^comptime\.c ::/comptime.c :/' -i Makefile

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
  install -Dm755 SRB2-SRB2_release_$pkgver/bin/lsdl2srb2 \
    "$pkgdir"/usr/bin/srb2

  # icon + .desktop
  install -Dm644 SRB2-SRB2_release_$pkgver/src/sdl/SDL_icon.xpm \
    "$pkgdir"/usr/share/pixmaps/srb2.xpm
  install -Dm644 srb2.desktop "$pkgdir"/usr/share/applications/srb2.desktop
  install -m644 srb2-opengl.desktop "$pkgdir"/usr/share/applications
}
