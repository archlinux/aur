# Maintainer: Parker Reed <parker.l.reed@gmail.com>
# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: archtux <antonio dot arias99999 at gmail dot com>
# Contributor: andy123 < ajs [at] online [dot] de >
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Linus Sjögren <thelinx@unreliablepollution.net>
# Contributor: Eric Forgeot < http://anamnese.online.fr >, dreeze
# Contributor: SanskritFritz (gmail)

pkgname=love07
pkgver=0.7.2
pkgrel=9
pkgdesc="An open-source 2D game engine using Lua scripting language (legacy 0.7.x version)"
arch=('i686' 'x86_64')
url="http://love2d.org/"
license=('zlib')
depends=('devil' 'freetype2' 'hicolor-icon-theme' 'libmodplug' 'libvorbis' 'lua51' 'mpg123' 'openal' 'physfs' 'sdl' 'libgl')
makedepends=('glu')
source=("https://github.com/love2d/love/releases/download/0.7.2/love-0.7.2-linux-src.tar.gz"
        "https://raw.githubusercontent.com/love2d/love/0.7.2/license.txt"
        "${pkgname}.svg::https://raw.githubusercontent.com/love2d/love/0.7.2/platform/unix/app.svg"
        "love07.desktop"
        "love07.patch")
sha256sums=('a57adcb0cbdc390a9bd8e2fe477bc175799b9ffd3486e01f859a36bf27f7f268'
            'c4cb43c06ab89c84349704a62849e9e66bf0c245e8a4df4f9068204124de1845'
            'b8116c4cc8d7b80adba579b582b9570d8178f93d3d9e35977d621e03500b8a7f'
            '8b6db85ae8098a537e1e6d04153f2ba81e3aca0f963c80a4743fece885f43ea1'
            '6b63906f9dabc9c000ddce32bec7020e89f51e88425d1eb940a533dd9b9ab09b')

prepare() {
  cd "$srcdir/love-HEAD"

  patch -p1 < ../love07.patch

  # Fix for freetype2 and variants(ubuntu, infinality etc...)
  FILE="/usr/include/freetype2/freetype/freetype.h"
  if [ -f $FILE ];
  then
    sed -i 's|<freetype|<freetype2/freetype|' src/modules/font/freetype/{Font,TrueTypeRasterizer}.h
  else
    sed -i 's|<freetype|&2|' src/modules/font/freetype/{Font,TrueTypeRasterizer}.h
  fi
  
  # Fix mesa 10 GLee.h(thanks to ajs124)
  sed -i '70itypedef XID GLXContextID;' "src/modules/graphics/opengl/GLee.h"

  echo
  echo "Editing 'configure.in':"
  echo "-- removing MNG dependency (not needed by 'devil')"
  echo "-- reenabling check for GLU: needed during build so better let 'configure' verify it"
  sed -e '/mng_initialize/d' \
      -e '/gluOrtho2D/s/^#//' \
      -i 'configure.in'

  echo "Regenerating autoconf scripts after changing 'configure.in'..."
  autoreconf --verbose --force --install --symlink
  echo

  echo "Configuring the env vars for the build"
  echo '-- Adding CPPFLAGS to CFLAGS and CXXFLAGS, otherwise the build scripts ignore the former'
  echo '-- Adding LDFLAGS to CFLAGS and CXXFLAGS, otherwise the build scripts ignore the former'
  export CFLAGS+=" ${CPPFLAGS} ${LDFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} ${LDFLAGS}"
  echo

  echo "Running 'configure' script..."
  ./configure --prefix=/usr --program-suffix=07
}

build() {
  cd "$srcdir/love-HEAD"
  make
}

package() {
  cd "$srcdir/love-HEAD"

  make DESTDIR=$pkgdir install

  cd ..
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "$pkgname.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}
