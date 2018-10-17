# Maintainer Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.6
pkgname=wesnoth-1.6
pkgver=1.6.5+dev
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi')
makedepends=('boost' 'cmake' 'git')
# Package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-iostreams-dev libboost-regex-dev zlib1g-dev libpango1.0-dev libcairo2-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev gettext-base cmake make pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth$_suffix.desktop"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service"
        "wesnoth$_suffix.appdata.xml")

md5sums=('99f136647c5af1820d0132df08350965'
         'ec9cab718ba96b7a4c85c224f6b747c3'
         '11fbbf345aae2a2e3f45de5fcfd479d3'
         '1018b1fae1a65d49bed1094ba0280d87')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "$pkgname-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.6 --shallow-exclude=1.6.5 $pkgname-git
    msg "Git checkout done (or server timeout)"
  fi

  ln -sf "$startdir/$pkgname-git" "$srcdir/$pkgname-git"
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.6 branch
  # at bugs.wesnoth.org

  rm -rf build && mkdir -p build && cd build
  cmake ../$pkgname-git \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.6 \
      -DDATADIRNAME=wesnoth-1.6 \
      -DDOCDIR=share/doc/wesnoth-1.6 \
      -DFIFO_DIR=/run/wesnothd-1.6 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.6 \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -Wno-dev \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS -ansi -w" \
      -DCMAKE_C_FLAGS="$CFLAGS -ansi -w"
  make -j 4
}

# Note: the manpages are first installed to the same place which other wesnoth
# versions use and renamed afterwards, this may cause conflicts. One can change
# -DMANDIR above to specify another location.

# For the Archlinux package this is no problem because the files are installed
# into the empty $pkgdir, and it's content is copied later to the system.

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  # add suffix to manpages
  cd "$pkgdir/usr/share/man"
  for filename in */man6/wesnoth.6 man6/wesnoth.6 */man6/wesnothd.6 man6/wesnothd.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.6.6
  done

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth$_suffix/data/tools"

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth$_suffix.desktop" "$pkgdir/usr/share/applications/wesnoth$_suffix.desktop"
  install -D -m644 "$srcdir/$pkgname-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"
  install -D -m644 "$srcdir/$pkgname-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  install -D -m644 "$srcdir/wesnoth$_suffix.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth$_suffix.appdata.xml"
}
