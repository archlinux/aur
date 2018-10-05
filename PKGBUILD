# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

# BUILDING THIS PACKAGE REQUIRES THAT »lua« is not installed!

# »lua52« does not cause problems, and »lua« being installed together with this package (after building) is fine

# if Lua has been detected correctly, you will see a line such as:
# -- Found Lua51: /usr/lib/liblua5.1.so;/usr/lib/libm.so (found version "5.1.5")

# if the »lua« package is installed, the following will be shown instead:
# -- Found Lua51: /usr/lib/liblua5.1.so;/usr/lib/libm.so (found version "")

_suffix=-1.8
pkgname=wesnoth-1.8
pkgver=1.8.6+dev
pkgrel=5
pkgdesc="Turn-based strategy game on a fantasy world (legacy version for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi' 'lua51')
makedepends=('boost' 'gettext' 'cmake' 'make' 'git')
checkdepends=('desktop-file-utils' 'appstream-glib')
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml")

md5sums=('7fa59aab4ec96e6466dd276a76462e78'
         'a3afc892c43bbff72a9b150de513beaf'
         '8f88ebc8879ba6aabf87baeefade4b41'
         'f11a61e8d08b11a954707a527f113af2')

PKGEXT='.pkg.tar'

prepare() {
  msg ""
  msg ""
  msg ""
  msg ""
  msg "LUA DETECTEION DOES NOT WORK CORRECTLY IF YOU HAVE MULTIPLE VERSIONS OF LUA INSTALLED"
  msg "YOU MUST REMOVE THE PACKAGE »lua« PRIOR TO BUILDING THIS PACKAGE"
  msg ""
  msg "you can use the following command for building"
  msg "sudo pacman -Rdd lua && makepkg -sri --nocheck ; sudo pacman -S --asdeps lua"
  msg ""
  msg "THIS BUILD WILL FAIL LATER OTHERWISE"
  msg ""
  msg ""
  msg ""
  msg ""

  cd "$startdir"
  # get a shallow clone of the git repo and store it outside the srcdir
  msg "Connecting to GIT server...."

  if  [ -d "$pkgname-git" ] ; then
    cd "$pkgname-git" && git pull origin
    msg "The local files are up to date"
  else
    git clone https://github.com/wesnoth/wesnoth -b 1.8 --shallow-exclude=1.8.6 --single-branch $pkgname-git
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.8 branch
  # at bugs.wesnoth.org

  # silence compiler warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  rm -rf "$srcdir/build" && mkdir -p "$srcdir/build" && cd "$srcdir/build"
  cmake "$startdir/$pkgname-git" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.8 \
      -DDATADIRNAME=wesnoth-1.8 \
      -DMANDIR=share/man \
      -DDOCDIR=share/doc/wesnoth-1.8 \
      -DFIFO_DIR=/run/wesnothd-1.8 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.8 \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -DENABLE_STRICT_COMPILATION=OFF \
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
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.8.6
  done

  # INSTALLING of menu entry and icons as well as systemd files and appstream information:
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$startdir/$pkgname-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$startdir/$pkgname-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
