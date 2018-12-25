# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.
# There you have to execute the commands in the functions(){…} below by hand.

# On other systems, ignore the used variables like $pkgdir, $srcdir or $startdir
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir as well as $stardir would be the place where you have your files)

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
options=('!emptydirs' '!zipman')
source=("wesnoth-1.6.desktop"
        "wesnothd-1.6.tmpfiles.conf"
        "wesnothd-1.6.service"
        "wesnoth-1.6.appdata.xml")

md5sums=('99f136647c5af1820d0132df08350965'
         'ec9cab718ba96b7a4c85c224f6b747c3'
         'c537d69cb8338594a606ebbc93cbd00e'
         '3bf40dd42fb269275bd66ecaf892f3fc')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.6-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.6 --shallow-exclude=1.6.5 wesnoth-1.6-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.6-git" ] ; then
    ln -s "$startdir/wesnoth-1.6-git" "$srcdir/wesnoth-1.6-git"
  fi
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.6 branch
  # at bugs.wesnoth.org

  # It's a convention to use /usr/local when installing by hand, it allows you
  # to keep easier track of what was installed.
  # Feel free to replace ALL occurences of /usr with /usr/local below.
  rm -rf build && mkdir -p build && cd build
  cmake ../wesnoth-1.6-git \
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
  cd build

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # add a suffix to the manpages (using one multi-line command)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.6.6
  done

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth-1.6/data/tools"

  # remove unneeded files
  find "$pkgdir/usr/share" -name .gitignore -delete

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth-1.6.desktop" "$pkgdir/usr/share/applications/wesnoth-1.6.desktop"
  install -D -m644 "$srcdir/wesnoth-1.6-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.6-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.6-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.6-icon.png"

  install -D -m644 "$srcdir/wesnoth-1.6.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.6.appdata.xml"

  # On other Linux systems, use /etc instead of /usr/lib for the files below
  install -D -m644 "$srcdir/wesnothd-1.6.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.6.conf"

  # On Debian / Ubuntu / Mint, edit the file and change:
  # Group=nobody to Group=nogroup
  # /usr/bin/rm to /bin/rm
  install -D -m644 "$srcdir/wesnothd-1.6.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.6.service"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
