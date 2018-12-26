# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This script contains as well instructions for other Linux systems.
# There you have to execute the commands in the functions(){…} below by hand.

# On other systems, ignore the used variables like $pkgdir, $srcdir or $startdir
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir as well as $stardir would be the place where you have your files)

pkgname=wesnoth-1.0
pkgver=1.0.2+dev
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (historical version)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'freetype2')
# Package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev gettext-base pkgconf autoconf automake make gcc g++ git
options=('!emptydirs')
install=wesnoth-1.0.install
source=("wesnoth-1.0.desktop"
        "wesnothd-1.0.tmpfiles.conf"
        "wesnothd-1.0.service"
        "wesnoth-1.0.appdata.xml"
        "wesnoth-icon-64x64.png::https://raw.githubusercontent.com/wesnoth/wesnoth/1.12/icons/wesnoth-icon.png"
        "wesnoth-icon-128x128.png::https://raw.githubusercontent.com/wesnoth/wesnoth/1.12/icons/wesnoth-icon-Mac.png")
# Not finding the files? https://aur.archlinux.org/packages/wesnoth-1.0/
# Rest assured, they are optional. Things like a launcher for your convenience…

md5sums=('29dcc619dad3ba9e7806b97badee3023'
         '1d061d2df18d707b212c314440c30cd2'
         '9db79a418d64046ed49e3899e294da3b'
         '81953f9a24639fb66e435b34ba530b94'
         '3c271ac7485d871400dd1f7af2ecfd8d'
         '0327cec01cd5b98acee056ec79702bab')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo (and store it outside the srcdir)
  if  [ ! -d "wesnoth-1.0-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.0 --shallow-exclude=1.0.2  wesnoth-1.0-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.0-git" ] ; then
    ln -s "$startdir/wesnoth-1.0-git" "$srcdir/wesnoth-1.0-git"
  fi

  # clean up previous builds, in case different flags or library versions were
  # used before. (|| true avoids failure if the makefile is not yet generated.)
  cd "$srcdir/wesnoth-1.0-git"
  make distclean || true
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

  make -j4
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
  # update-desktop-database
}
