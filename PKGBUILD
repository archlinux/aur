# Maintainer:  dantob

pkgname=mupen64plus-z64
pkgver=2.5
pkgrel=1
pkgdesc='Nintendo64 Emulator with z64 plugins; works better with low end machines'
arch=('i686' 'x86_64')
url='https://github.com/mupen64plus'
license=('GPL')
depends=('sdl' 'libpng' 'freetype2' 'zlib')
makedepends=('mesa')
provides=('mupen64plus')
conflicts=('mupen64plus')
#options=('!strip' 'debug')
source=("https://github.com/mupen64plus/mupen64plus-core/releases/download/${pkgver}/mupen64plus-bundle-src-${pkgver}.tar.gz"
        "https://github.com/mupen64plus/mupen64plus-rsp-z64/releases/download/2.0.0/mupen64plus-rsp-z64-src-2.0.0.tar.gz"
		"https://github.com/mupen64plus/mupen64plus-video-z64/releases/download/2.0.0/mupen64plus-video-z64-src-2.0.0.tar.gz")
#autofill using updpkgsums
sha256sums=('9c75b9d826f2d24666175f723a97369b3a6ee159b307f7cc876bbb4facdbba66'
            'df69eb722fae9a4edd7b764e9c9a459f6a6d3482225d469871c393c695f86e9b'
            'dec06a0afb8b403754faa26da36c6ada77f7918124516c6f449a9d90d3c4861f')

prepare() {
  # move z64 plugins to the bundle directory
  mv mupen64plus-rsp-z64 $srcdir/mupen64plus-bundle-src-${pkgver}/source/
  mv mupen64plus-video-z64 $srcdir/mupen64plus-bundle-src-${pkgver}/source/

  # BUG: video-z64 has a problem finding system glew.h
  cd $srcdir/mupen64plus-bundle-src-${pkgver}/source/mupen64plus-video-z64/src
  sed -i 's:glew.h:GL/glew.h:g' rgl.h
  sed -i 's:glew.h:GL/glew.h:g' glshader.cpp
}

build() {
  # BUG: video-rice and video-glide64 crash on my intel system, so lets disable them
  # BUG: Intel Corporation 82915G/GV/910GL Integrated Graphics Controller (rev 04)
  # BUG: OpenGL renderer string: Mesa DRI Intel(R) 915G 
  # BUG: OpenGL version string: 2.1 Mesa 10.5.5

  # disabled: rsp-hle, video-rice, video-glide64mk2
  cd $srcdir/mupen64plus-bundle-src-${pkgver}
  export M64P_COMPONENTS="core rom ui-console audio-sdl input-sdl rsp-z64 video-z64"
  sh m64p_build.sh
}

package() {
  cd $srcdir/mupen64plus-bundle-src-$pkgver
  
  # set LDCONFIG since we are using fakeroot and scripts run root commands by checking the uid
  ./m64p_install.sh DESTDIR="$pkgdir" PREFIX='/usr' MANDIR='/usr/share/man' LDCONFIG='true'
}

