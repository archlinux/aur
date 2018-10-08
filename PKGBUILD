# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.12
pkgname=wesnoth-1.12
pkgver=1.12.6
pkgrel=11
pkgdesc="Turn-based strategy game on a fantasy world (legacy version)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'bzip2' 'zlib' 'libvorbis' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi')
makedepends=('boost' 'gettext' 'cmake' 'make')
checkdepends=('desktop-file-utils' 'appstream-glib')
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("https://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
        "wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml"
        "wesnoth-boost.patch::https://github.com/wesnoth/wesnoth/commit/789588d11e3512b3494b4aeac11b44f1c38ad86d.patch")

sha256sums=('a50f384cead15f68f31cfa1a311e76a12098428702cb674d3521eb169eb92e4e'
            'f765499315d6650fe91424c0818cc57fc9fd06108c29e78c2db987c148dbf877'
            '4d11e481ad8610bb2ad65290d2b3d1bf2d058485deaa9016325499b113e0f89f'
            'a2c2c36d141cb0428d699266a75b66c338070deadab05ca678a12086cae0d7cf'
            'd3f031c70e59ac544712c45e6fd9be7cd79f481aad38977e7a129e1bede54840'
            '74bfc9187b3cdd1744477ca509344a516a94c9992a4c6273ed8a9f370d96600a')

PKGEXT='.pkg.tar'

prepare() {
  cd "$srcdir/wesnoth-$pkgver"

  #How to manually create a patch
  #diff -rupN src/ src_new/ > patch_name.patch

  patch -Np1 < ${srcdir}/wesnoth-boost.patch
}

build() {
  cd "$srcdir/wesnoth-$pkgver"

  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.12 branch
  # at bugs.wesnoth.org

  # silence compiler warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  rm -rf build && mkdir build && cd build
  cmake .. \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.12 \
      -DDATADIRNAME=wesnoth-1.12 \
      -DDOCDIR=share/doc/wesnoth-1.12 \
      -DFIFO_DIR=/run/wesnothd-1.12 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.12 \
      -DENABLE_OMP=ON \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -DENABLE_DISPLAY_REVISION=NO \
      -Wno-dev # silence cmake warnings
  make
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

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth$_suffix/data/tools"

  # these translation files are not needed
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete

  # add suffix to manpages
  cd "$pkgdir/usr/share/man"
  for filename in man6/*.6 */man6/*.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.12.6
  done

  # INSTALLING of menu entry and icons as well as systemd files and appstream information:
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$srcdir/wesnoth-$pkgver/images/game-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$srcdir/wesnoth-$pkgver/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
