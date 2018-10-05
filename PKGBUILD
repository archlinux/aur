# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.10
pkgname=wesnoth-1.10
pkgver=1.10.7+dev
pkgrel=6
pkgdesc="Turn-based strategy game on a fantasy world (legacy version for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus')
makedepends=('boost' 'gettext' 'cmake' 'make' 'git')
checkdepends=('desktop-file-utils' 'appstream-glib')
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml")

md5sums=('fe8278239945d0c69d686bf70b8362e0'
         '6c139ff1ccb6f30a375d6fea6d7049a2'
         '6782d38643289c8afb8a8a05658be269'
         '26e8abc0a1e9a978be114ce73904fd41')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  msg "Connecting to GIT server...."

  if  [ -d "$pkgname-git" ] ; then
    cd "$pkgname-git" && git pull origin
    msg "The local files are up to date"
  else
    git clone https://github.com/wesnoth/wesnoth -b 1.10 --shallow-exclude=1.10.7 --single-branch $pkgname-git
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.10 branch
  # at bugs.wesnoth.org

  # silence warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  rm -rf "$srcdir/build" && mkdir -p "$srcdir/build" && cd "$srcdir/build"
  cmake "$startdir/$pkgname-git" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.10 \
      -DDATADIRNAME=wesnoth-1.10 \
      -DDOCDIR=share/doc/wesnoth-1.10 \
      -DFIFO_DIR=/run/wesnoth-1.10 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.10 \
      -DENABLE_OMP=ON \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -Wno-dev # silence cmake warnings
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

  # these translation files are not needed
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete

  # add suffix to manpages
  cd "$pkgdir/usr/share/man"
  for filename in man6/*.6 */man6/*.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.10.6
  done

  # INSTALLING of menu entry and icons as well as systemd files and appstream information:
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$startdir/$pkgname-git/images/game-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$startdir/$pkgname-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
