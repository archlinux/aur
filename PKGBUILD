# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.6
pkgname=wesnoth-1.6
pkgver=1.6.5+dev
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (legacy version for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi')
makedepends=('boost' 'gettext' 'cmake' 'make')
checkdepends=('desktop-file-utils' 'appstream-glib')
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml")

md5sums=('99f136647c5af1820d0132df08350965'
         'ec9cab718ba96b7a4c85c224f6b747c3'
         'cb2c4cc145b526f570a837a5055a71dc'
         '1018b1fae1a65d49bed1094ba0280d87')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  msg "Connecting to git server..."

  if  [ -d "$pkgname-git" ] ; then
    cd "$pkgname-git" && git pull origin
    msg "The local files are up to date"
  else
    git clone https://github.com/wesnoth/wesnoth -b 1.6 --shallow-exclude=1.6.5 --single-branch $pkgname-git
    msg "Git checkout done (or server timeout)"
  fi


  ln -sf "$startdir/$pkgname-git" "$srcdir/$pkgname-git"
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.6 branch
  # at bugs.wesnoth.org
  export CXX_FLAGS="$CXX_FLAGS -w"
  export C_FLAGS="$C_FLAGS -w"

  rm -rf build && mkdir -p build && cd build
  cmake ../$pkgname-git  \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.6 \
      -DDATADIRNAME=wesnoth-1.6 \
      -DDOCDIR=share/doc/wesnoth-1.6 \
      -DFIFO_DIR=/run/wesnothd-1.6 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.6 \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -Wno-dev \
      -DCMAKE_CXX_FLAGS="$CXX_FLAGS -ansi" \
      -DCMAKE_C_FLAGS="$C_FLAGS -ansi"
  make
}

check() {
  desktop-file-validate --no-hints --no-warn-deprecated *.desktop
  appstream-util validate-relax *.appdata.xml
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth$_suffix/data/tools"

  # these translation files are not needed anymore after building
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete

  # add suffix to manpages
  cd "$pkgdir/usr/share/man"
  for filename in man6/*.6 */man6/*.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.6.6
  done


  # INSTALLING of menu entry and icons as well as systemd files and appstream information:
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$srcdir/$pkgname-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$srcdir/$pkgname-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
