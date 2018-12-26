# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.
# There you have to execute the commands in the functions(){…} below by hand.

# On other systems, ignore the used variables like $pkgdir, $srcdir or $startdir
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir as well as $stardir would be the place where you have your files)

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
source=("wesnoth-1.8.desktop"
        "wesnothd-1.8.tmpfiles.conf"
        "wesnothd-1.8.service"
        "wesnoth-1.8.appdata.xml")
# Not finding the files? https://aur.archlinux.org/packages/wesnoth-1.8
# Rest assured, they are optional. Things like a launcher for your convenience…

md5sums=('7fa59aab4ec96e6466dd276a76462e78'
         'a3afc892c43bbff72a9b150de513beaf'
         '634ea29d903ba62e751aa3e3cf24e80b'
         '46f8e791922b58f4b0cea7bebef511ad')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.8-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.8 --shallow-exclude=1.8.6 wesnoth-1.8-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.8-git" ] ; then
    ln -s "$startdir/wesnoth-1.8-git" "$srcdir/wesnoth-1.8-git"
  fi
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.8 branch
  # at bugs.wesnoth.org

  # silence compiler warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  # It's a convention to use /usr/local when installing by hand, it allows you
  # to keep easier track of what was installed.
  # Feel free to replace ALL occurences of /usr with /usr/local in the commands
  # below, and edit the start command in the file wesnothd-1.8.service.
  rm -rf build && mkdir build && cd build
  cmake ../wesnoth-1.8-git \
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

# The commands below have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd build

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # add suffix to manpages (.6 is the file extension for manpages)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.8.6
  done

  # use the patched tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth-1.8/data/tools"

  # these files are not needed
  find "$pkgdir/usr/share/wesnoth-1.8/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth-1.8/translations" -name wesnoth-manual.mo -delete
  find "$pkgdir/usr/share" -name .gitignore -delete

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth-1.8.desktop" "$pkgdir/usr/share/applications/wesnoth-1.8.desktop"
  install -D -m644 "$srcdir/wesnoth-1.8-git/images/wesnoth-icon-small.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.8-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.8-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.8-icon.png"

  install -D -m644 "$srcdir/wesnoth-1.8.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.8.appdata.xml"

  # On other Linux systems, use /etc instead of /usr/lib for these two files
  install -D -m644 "$srcdir/wesnothd-1.8.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.8.conf"
  install -D -m644 "$srcdir/wesnothd-1.8.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.8.service"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
