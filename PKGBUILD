# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.
# Have a look what is done in the build() and package() functions below.
# Execute the same command which are used there.

# On other systems, ignore the used variables like $pkgdir and $srcdir.
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir would be the place where you have your files)


pkgname=wesnoth-1.10
pkgver=1.10.7+dev
pkgrel=8
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'zlib' 'pango' 'cairo' 'fontconfig' 'dbus')
makedepends=('boost' 'cmake' 'git')
# package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-iostreams-dev libboost-regex-dev libboost-serialization-dev libboost-program-options-dev libboost-system-dev libboost-thread-dev zlib1g-dev libpango1.0-dev libcairo2-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev gettext-base cmake make pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth-1.10-git::git+https://github.com/wesnoth/wesnoth.git#branch=1.10"
        "wesnoth-1.10.desktop"
        "wesnothd-1.10.tmpfiles.conf"
        "wesnothd-1.10.service"
        "wesnoth-1.10.appdata.xml")
# Not finding the files? https://aur.archlinux.org/packages/wesnoth-1.10
# Rest assured, they are optional. Things like a launcher for your convenience…

# Except for the wesnoth download, which can also be retrieved with this command:
# git clone https://github.com/wesnoth/wesnoth.git -b 1.10 --shallow-exclude=1.10.7 wesnoth-1.10-git

md5sums=('SKIP'
         'fe8278239945d0c69d686bf70b8362e0'
         '6c139ff1ccb6f30a375d6fea6d7049a2'
         '29df1e28cf007b910bb556a63a4532e8'
         'a9085aef6abd6cae39059ac83f7dd687')


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
      -Wno-dev
  make
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

  # better use the patched tools from a recent version of wesnoth
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
  # sudo update-desktop-database
}
