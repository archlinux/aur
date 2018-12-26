# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.

# On other systems, ignore the used variables like $pkgdir, $srcdir or $startdir
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir as well as $stardir would be the place where you have your files)

# skip right below to the interesting part in the functions() { … }

pkgname=wesnoth-1.10
pkgver=1.10.7+dev
pkgrel=6
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus')
makedepends=('boost' 'cmake' 'git')
# package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-iostreams-dev libboost-regex-dev libboost-serialization-dev libboost-program-options-dev libboost-system-dev libboost-thread-dev zlib1g-dev libpango1.0-dev libcairo2-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev gettext-base cmake make pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth-1.10.desktop"
        "wesnothd-1.10.tmpfiles.conf"
        "wesnothd-1.10.service"
        "wesnoth-1.10.appdata.xml")

md5sums=('fe8278239945d0c69d686bf70b8362e0'
         '6c139ff1ccb6f30a375d6fea6d7049a2'
         '1a2eca33a8305f912b0f7db46abefff2'
         '96f06b5eb48a9537f68b74c199a7b383')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.10-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.10 --shallow-exclude=1.10.7 wesnoth-1.10-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.10-git" ] ; then
    ln -s "$startdir/wesnoth-1.10-git" "$srcdir/wesnoth-1.10-git"
  fi
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.10 branch
  # at bugs.wesnoth.org

  # silence warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  # It's a convention to use /usr/local when installing by hand, it allows you
  # to keep easier track of what was installed.
  # Feel free to replace ALL occurences of /usr with /usr/local in the commands
  # below, and edit the start command in the file wesnothd-1.10.service.

  rm -rf build && mkdir -p build && cd build
  cmake ../wesnoth-1.10-git \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.10 \
      -DDATADIRNAME=wesnoth-1.10 \
      -DDOCDIR=share/doc/wesnoth-1.10 \
      -DFIFO_DIR=/run/wesnothd-1.10 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.10 \
      -DENABLE_OMP=ON \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -Wno-dev # silence cmake warnings
  make -j 4
}

# Note: the manpages are first installed to the same place which other wesnoth
# versions use and renamed afterwards, this may cause conflicts. One can change
# -DMANDIR above to specify another location.

# For the Archlinux package this is no problem because the files are installed
# into the empty $pkgdir, and it's content is copied later to the system.

# Thes commands below have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd build

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # add suffix to manpages (this is a single command) (.6 is the file extension)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.10.6
  done

  # better use the pacthed tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth-1.10/data/tools"

  # these files are not needed
  find "$pkgdir/usr/share/wesnoth-1.10/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth-1.10/translations" -name wesnoth-manual.mo -delete
  find "$pkgdir/usr/share/wesnoth-1.10" -name .gitignore -delete

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth-1.10.desktop" "$pkgdir/usr/share/applications/wesnoth-1.10.desktop"
  install -D -m644 "$srcdir/wesnoth-1.10-git/images/game-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.10-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.10-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.10-icon.png"

  install -D -m644 "$srcdir/wesnoth-1.10.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.10.appdata.xml"

  # On other Linux systems, use /etc instead of /usr/lib for these two files
  install -D -m644 "$srcdir/wesnothd-1.10.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.10.conf"
  install -D -m644 "$srcdir/wesnothd-1.10.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.10.service"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
