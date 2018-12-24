# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This doesn't compile with gcc 4.5, 4.9 or the current versions of gcc or clang.
# It does compile with gcc 4.3.

pkgname=wesnoth-1.2
pkgver=1.2.8+dev
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'freetype2')
makedepends=('gcc43')
options=('!emptydirs')
source=("wesnoth-1.2.desktop"
        "wesnothd-1.2.tmpfiles.conf"
        "wesnothd-1.2.service"
        "wesnoth-1.2.appdata.xml")

md5sums=('c3ba9b84c818bba105b0ea236b1d3744'
         'd23cafae5c732d6bf10a836bdabd15b9'
         'a1831302d36c5d5ddffcf76c42483e1d'
         'b6dfb0e146e6ac3a265487b6e32e9766')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.2-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.2 --shallow-exclude=1.2.8  wesnoth-1.2-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the deprecated $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.2-git" ] ; then
    ln -s "$startdir/wesnoth-1.2-git" "$srcdir/wesnoth-1.2-git"
  fi

  # clean up previous builds, in case different flags or library versions were
  # used before. (|| true avoids failure if the makefile is not yet generated.)
  cd "$srcdir/wesnoth-1.2-git"
  make distclean || true
}

build() {
  cd "$srcdir/wesnoth-1.2-git"
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.2 branch
  # at bugs.wesnoth.org

  # Archs default flags are too new for the old compiler
  unset CFLAGS CXXFLAGS
  export CXXFLAGS="-w -pipe"

  export CC=gcc-4.3
  export CXX=g++-4.3

  ./autogen.sh
  ./configure --with-freetype-prefix=/usr/lib --prefix=/usr --with-preferences-dir=.local/share/wesnoth/1.2 --program-suffix=-1.2 --with-datadir-name=wesnoth-1.2 --enable-editor --enable-server --with-fifodir=/run/wesnothd-1.2
  make -j4
}

# These commands have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd "$srcdir/wesnoth-1.2-git"

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # The manpages have no suffix by default, so they have the same name like
  # the manpages of other wesnoth installations. To avoid conflicts, rename
  # (or delete) them.
  # Note that you can do this only the installation step shown above, as the
  # command will fail if it doesn't find these files.
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d,_editor}.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.2.6
  done

  # use the tools from a recent version of wesnoth, where they received patches
  rm -r "$pkgdir/usr/share/wesnoth-1.2/data/tools"

  # remove unneeded files
  find "$pkgdir/usr/share" -name .gitignore -delete

  # placing launcher, icons and (not required) appdata and systemd files
  install -D -m644 "$srcdir/wesnoth-1.2.desktop" "$pkgdir/usr/share/applications/wesnoth-1.2.desktop"
  install -D -m644 "$srcdir/wesnoth-1.2-git/icons/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.2-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.2-git/icons/wesnoth-icon-Mac.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.2-icon.png"

  # On Debian / Ubuntu / Mint, the two files go into /etc instead of /usr/lib
  install -D -m644 "$srcdir/wesnothd-1.2.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.2.conf"
  # On Debian / Ubuntu / Mint, edit the file and change:
  # Group=nobody to Group=nogroup
  # /usr/bin/rm to /bin/rm
  install -D -m644 "$srcdir/wesnothd-1.2.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.2.service"

  install -D -m644 "$srcdir/wesnoth-1.2.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.2.appdata.xml"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
