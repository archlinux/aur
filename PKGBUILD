# Maintainer Severin Glöckner <severin.gloeckner@stud-htwk.leipzig.de>

# This script contains as well instructions for other Linux systems.
# Have a look what is done in the function(){…} below.

# On other systems, ignore the used variables like $pkgdir, $srcdir or $startdir
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir as well as $stardir would be the place where you have your files)

pkgname=wesnoth-1.12
pkgver=1.12.6+dev
pkgrel=9
pkgdesc="Turn-based strategy game on a fantasy world (oldstable)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'bzip2' 'zlib' 'libvorbis' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi')
makedepends=('boost' 'cmake' 'git')
# package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-filesystem-dev libboost-locale-dev libboost-iostreams-dev libboost-regex-dev libboost-serialization-dev libasio-dev libboost-program-options-dev libboost-system-dev zlib1g-dev libpango1.0-dev libcairo2-dev  libvorbis-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev gettext-base cmake make pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth-1.12.desktop"
        "wesnothd-1.12.tmpfiles.conf"
        "wesnothd-1.12.service"
        "wesnoth-1.12.appdata.xml")
# Not finding some files? https://aur.archlinux.org/packages/wesnoth-1.12
# Rest assured, they are optional. Things like a launcher for your convenience…

sha256sums=('f765499315d6650fe91424c0818cc57fc9fd06108c29e78c2db987c148dbf877'
            '4d11e481ad8610bb2ad65290d2b3d1bf2d058485deaa9016325499b113e0f89f'
            'bbc1a80412d3e880d695cf0e818969da90c578501b455d0a6a81a45568cd8231'
            'e5b0bd418e97d5f8cfc9392045dc749941c71e9cf805ef6f343c318022088384')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.12-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.12 --shallow-exclude=1.12.6 wesnoth-1.12-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.12-git" ] ; then
    ln -s "$startdir/wesnoth-1.12-git" "$srcdir/wesnoth-1.12-git"
  fi
}

build() {
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.12 branch
  # at bugs.wesnoth.org

  # silence compiler warnings - they are not going to be fixed
  export CFLAGS="$CFLAGS -w"
  export CXXFLAGS="$CXXFLAGS -w"

  # It's a convention to use /usr/local when installing by hand, it allows you
  # to keep easier track of what was installed.
  # Feel free to replace ALL occurences of /usr with /usr/local in the commands
  # below, and edit the start command in the file wesnothd-1.12.service.

  rm -rf build && mkdir build && cd build
  cmake ../wesnoth-1.12-git \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBINARY_SUFFIX=-1.12 \
      -DDATADIRNAME=wesnoth-1.12 \
      -DDOCDIR=share/doc/wesnoth-1.12 \
      -DFIFO_DIR=/run/wesnothd-1.12 \
      -DPREFERENCES_DIR=.local/share/wesnoth/1.12 \
      -DENABLE_OMP=ON \
      -DENABLE_DESKTOP_ENTRY=OFF \
      -DENABLE_DISPLAY_REVISION=OFF \
      -Wno-dev # silence cmake warnings
  make -j 4
}

# The commands below have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd build

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # On Debian / Ubuntu / Mint / Fedora, the above command may fail, in case you
  # have another wesnoth version installed, because they use the same file name
  # for the manpages.
  # If that happens, temporarily uninstall the other wesnoth package, then re-run
  # the above command, and thereafter use the below command to rename the files.

  # add suffix to manpages (.6 is the file extension)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.12.6
  done

  # better use the patched tools from the newest version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth-1.12/data/tools"

  # these translation files are not needed
  find "$pkgdir/usr/share/wesnoth-1.12/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth-1.12/translations" -name wesnoth-manual.mo -delete

  # placing relevant packaging files (launcher, icons, systemd and appdata files)
  install -D -m644 "$srcdir/wesnoth-1.12.desktop" "$pkgdir/usr/share/applications/wesnoth-1.12.desktop"
  install -D -m644 "$srcdir/wesnoth-1.12-git/images/game-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.12-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.12-git/data/core/images/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.12-icon.png"

  install -D -m644 "$srcdir/wesnoth-1.12.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.12.appdata.xml"

  # On other Linux systems, use /etc istead of /usr/lib for these two files
  install -D -m644 "$srcdir/wesnothd-1.12.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.12.conf"
  install -D -m644 "$srcdir/wesnothd-1.12.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.12.service"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
