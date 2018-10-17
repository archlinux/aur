# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.8
pkgname=wesnoth-1.8
pkgver=1.8.6+dev
pkgrel=5
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi' 'lua51')
makedepends=('boost' 'cmake' 'git')
# package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-iostreams-dev libboost-regex-dev libboost-serialization-dev zlib1g-dev libpango1.0-dev libcairo2-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev liblua5.1.0-dev gettext-base cmake make pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml")

md5sums=('7fa59aab4ec96e6466dd276a76462e78'
         'a3afc892c43bbff72a9b150de513beaf'
         '47fb0b812309ae367744b3306a5a5b84'
         '46f8e791922b58f4b0cea7bebef511ad')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "$pkgname-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.8 --shallow-exclude=1.8.6 $pkgname-git
    msg "Git checkout done (or server timeout)"
  fi

  ln -sf "$startdir/$pkgname-git" "$srcdir/$pkgname-git"
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.8 branch
  # at bugs.wesnoth.org

  # silence compiler warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  rm -rf build && mkdir build && cd build
  cmake ../$pkgname-git \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.8 \
      -DDATADIRNAME=wesnoth-1.8 \
      -DDOCDIR=share/doc/wesnoth-1.8 \
      -DFIFO_DIR=/run/wesnothd-1.8 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.8 \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -Wno-dev # silence cmake warnings
  make -j 4
}

# Note: the manpages are first installed to the same place which other wesnoth
# versions use and renamed afterwards, this may cause conflicts. One can change
# -DMANDIR above to specify another location.

# For the Archlinux package this is no problem because the files are installed
# into the empty $pkgdir, and it's content is copied later to the system.

package() {
  cd build

  make DESTDIR="$pkgdir" install

  # add suffix to manpages
  cd "$pkgdir/usr/share/man"
  for filename in */man6/wesnoth.6 man6/wesnoth.6 */man6/wesnothd.6 man6/wesnothd.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.8.6
  done

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth$_suffix/data/tools"

  # these translation files are not needed
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$srcdir/$pkgname-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$srcdir/$pkgname-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
