# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.
# Have a look what is done in the build() and package() functions below.
# Execute the same command which are used there.

# On other systems, ignore the used variables like $pkgdir and $srcdir.
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir would be the place where you have your files)


pkgname=wesnoth-1.0
pkgver=1.0.2+dev
pkgrel=2
pkgdesc="Turn-based strategy game on a fantasy world (historical version)"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'freetype2')
makedepends=('git')
# Package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev gettext-base pkgconf autoconf automake make gcc g++ git
options=('!emptydirs')
install=wesnoth-1.0.install
source=("wesnoth-1.0-git::git+https://github.com/wesnoth/wesnoth.git#branch=1.0"
        "wesnoth-1.0.desktop"
        "wesnothd-1.0.tmpfiles.conf"
        "wesnothd-1.0.service"
        "wesnoth-1.0.appdata.xml"
        "wesnoth-icon-64x64.png::https://raw.githubusercontent.com/wesnoth/wesnoth/1.12/icons/wesnoth-icon.png"
        "wesnoth-icon-128x128.png::https://raw.githubusercontent.com/wesnoth/wesnoth/1.12/icons/wesnoth-icon-Mac.png")
# Not finding the files? https://aur.archlinux.org/packages/wesnoth-1.0/
# Rest assured, they are optional. Things like a launcher for your convenience…

# Except for the wesnoth download, which can also be retrieved with this command:
# git clone https://github.com/wesnoth/wesnoth.git -b 1.0 --shallow-exclude=1.0.2  wesnoth-1.0-git

md5sums=('SKIP'
         '29dcc619dad3ba9e7806b97badee3023'
         '1d061d2df18d707b212c314440c30cd2'
         'bd36602fa96cacfebd9d64bd589509fa'
         'a648d60211379cb37020034ccc32cef8'
         '3c271ac7485d871400dd1f7af2ecfd8d'
         '0327cec01cd5b98acee056ec79702bab')


prepare() {
  # clean up previous builds, in case different flags or library versions were
  # used before. (|| true avoids failure if the makefile is not yet generated.)
  cd "$srcdir/wesnoth-1.0-git"
  make distclean || true

  # Patch
  sed '/#include <vector>/a #include <cstddef>' -i src/serialization/string_utils.hpp
}


build() {
  cd "$srcdir/wesnoth-1.0-git"
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.0 branch
  # at bugs.wesnoth.org

  ./autogen.sh

  # One couldn't change the userdata directory in 1.0, ~/.wesnoth will be used.
  # Explicitely disabled zipios, as it causes huge slowdowns.
  ./configure --with-freetype-prefix=/usr/lib --prefix=/usr --program-suffix=-1.0 --with-datadir-name=wesnoth-1.0 --enable-editor --enable-server --with-fifodir=/run/wesnothd-1.0 --without-zipios

  make
}


# These commands have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd "$srcdir/wesnoth-1.0-git"

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # When installing by hand, the above command may fail, in case you have
  # another wesnoth version installed, because they use the same file name for
  # the manpages.
  # If that happens, temporarily uninstall the other wesnoth package, then re-run
  # the above command, and thereafter use the below command to rename the files.

  # add "-1.0" suffix to manpages (".6" is the file extension)
  # (Note: this is a single command, only add "sudo " once.)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d,_editor}.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.0.6
  done

  # remove cruft (use the current tools instead, they have been patched)
  rm -r "$pkgdir/usr/share/wesnoth-1.0/data/tools"
  rm "$pkgdir/usr/bin/wmlxgettext-1.0"

  # placing launcher, icons and (not required) appdata and systemd files
  install -D -m644 "$srcdir/wesnoth-1.0.desktop" "$pkgdir/usr/share/applications/wesnoth-1.0.desktop"
  install -D -m644 "$srcdir/wesnoth-icon-64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.0-icon.png"
  install -D -m644 "$srcdir/wesnoth-icon-128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.0-icon.png"

  install -D -m644 "$srcdir/wesnoth-1.0.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.0.appdata.xml"

  # On other Linux systems, the two files go into /etc instead of /usr/lib
  install -D -m644 "$srcdir/wesnothd-1.0.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.0.conf"
  install -D -m644 "$srcdir/wesnothd-1.0.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.0.service"

  # All done, but it doesn't show up? Try that:
  # sudo update-desktop-database
}
