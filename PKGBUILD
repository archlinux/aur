# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.12
pkgname=wesnoth-1.12
pkgver=1.12.6
pkgrel=10
pkgdesc="Turn-based strategy game on a fantasy world (legacy version)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org/"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'bzip2' 'zlib' 'libvorbis' 'pango' 'cairo' 'fontconfig' 'dbus' 'readline' 'fribidi')
makedepends=('boost' 'gettext' 'cmake' 'make')
checkdepends=('desktop-file-utils' 'appstream-glib')
install=$pkgname.install
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("https://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
        "wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml"
        "wesnoth-boost.patch")

sha256sums=('a50f384cead15f68f31cfa1a311e76a12098428702cb674d3521eb169eb92e4e'
            'f765499315d6650fe91424c0818cc57fc9fd06108c29e78c2db987c148dbf877'
            '4d11e481ad8610bb2ad65290d2b3d1bf2d058485deaa9016325499b113e0f89f'
            'e7ae24484ac6028ee705ed46b3c37f23f98126575429f415d7f273ff78579dc2'
            'bb50e9fa9551a0669471921ac57c23ed0ebb4915c0445875223dd71689f9dcda'
            'ccacb1049a71935392b46f919c4045b11936b232522ed2763561fbc0fb1e40b7')

PKGEXT='.pkg.tar'

prepare() {
  cd "$srcdir/wesnoth-$pkgver"

  #How to manually create a patch
  #diff -rupN src/ src_new/ > patch_name.patch

  patch -Np1 < ${srcdir}/wesnoth-boost.patch
}

build() {
  cd "$srcdir/wesnoth-$pkgver"

  mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.12 \
      -DDATADIRNAME=wesnoth-1.12 \
      -DFIFO_DIR=/run/wesnoth-1.12 \
      -DMANDIR=/usr/share/man/wesnoth-1.12 \
      -DDOCDIR=/usr/share/doc/wesnoth-1.12 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.12 \
      -DENABLE_OMP=ON \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -DENABLE_CAMPAIGN_SERVER=OFF \
      -DENABLE_DISPLAY_REVISION=OFF
  make
  #   -DLOCALEDIR=/usr/share/locale
}

check() {
  cd "$srcdir"
  desktop-file-validate --no-hints --no-warn-deprecated *.desktop
  appstream-util validate-relax *.appdata.xml
}

package() {
  cd "$srcdir/wesnoth-$pkgver/build"

  make DESTDIR="$pkgdir" install

  cd "$srcdir/wesnoth-$pkgver"

  # better use the tools from wesnoth 1.14
  rm -r "$pkgdir/usr/share/wesnoth$_suffix/data/tools"

  # these translation files are not needed anymore after building
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete
  #find "$pkgdir/usr/share/locale" -name wesnoth-manpages.mo -delete
  #find "$pkgdir/usr/share/locale" -name wesnoth-manual.mo -delete

  # INSTALLING of menu entry and icons as well as systemd files and appstream information:
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$srcdir/wesnoth-$pkgver/images/game-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$srcdir/wesnoth-$pkgver/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
