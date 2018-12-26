# Maintainer Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

# This doesn't compile with gcc 4.5, 4.9 or the current versions of gcc or clang
# It does compile with gcc 4.3.

pkgname=wesnoth-1.4
pkgver=1.4.7+dev
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (for old replays)"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_net' 'boost-libs' 'zlib' 'freetype2')
makedepends=('boost' 'gcc43')
options=('!emptydirs' '!zipman')
install=wesnoth-1.4.install
source=("wesnoth-1.4.desktop"
        "wesnothd-1.4.tmpfiles.conf"
        "wesnothd-1.4.service"
        "wesnoth-1.4.appdata.xml")

md5sums=('b4052583dce2f360af5686f6320247a7'
         'e5e9941ae3fd5fce9af88a27c4e6795c'
         'c4d2f3ff8cf62ef214b9b249111df860'
         '5dfa63b303f48842ee54bc65ed89f7a2')

PKGEXT='.pkg.tar'

prepare() {
  cd "$startdir"

  # get a shallow clone of the git repo and store it outside the srcdir
  if  [ ! -d "wesnoth-1.4-git" ] ; then
    git clone https://github.com/wesnoth/wesnoth -b 1.4 --shallow-exclude=1.4.7 wesnoth-1.4-git
    msg "Git checkout done (or server timeout)"
  fi

  # Archlinux specific (hide the usage of the $startdir variable)
  if [ ! -e "$srcdir/wesnoth-1.4-git" ]; then
    ln -s "$startdir/wesnoth-1.4-git" "$srcdir/wesnoth-1.4-git"
  fi

  # clean up previous builds, in case different flags or library versions were
  # used before. (|| true avoids failure if the makefile is not yet generated.)
  cd "$srcdir/wesnoth-1.4-git"
  make distclean || true
}

build() {
  cd "$srcdir/wesnoth-1.4-git"
  # As this is an older version and not worked on anymore, it will someday break
  # If you happen to find a fix, please fill a Pull Request for the 1.4 branch
  # at bugs.wesnoth.org

  # There is a bug in the buildscripts:
  # CFLAG & CXXFLAGS Environment variables whose values contain a space are
  # problematic, which means in particular that one can only set one additional
  # compiler flag! (one can add the values directly in configure.ac though)
  unset CFLAGS CXXFLAGS

  export CC=gcc-4.3
  export CXX=g++-4.3

  ./autogen.sh --with-freetype-prefix=/usr/lib --prefix=/usr --with-preferences-dir=.local/share/wesnoth/1.4 --program-suffix=-1.4 --with-datadir-name=wesnoth-1.4 --docdir=/usr/share/doc/wesnoth-1.4 --disable-desktop-entry --enable-editor --enable-server --with-fifodir=/run/wesnothd-1.4 CXXFLAGS=-w
  make -j4
}

# These commands have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd "$srcdir/wesnoth-1.4-git"

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  make DESTDIR="$pkgdir" install

  # The manpages have no suffix by default, so they have the same name like
  # the manpages of other wesnoth installations. To avoid conflicts, rename
  # (or delete) them.
  # Note that you can do this only the installation step shown above, as the
  # command will fail if it doesn't find these files.
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.4.6
  done

  # no need for a subdirectory for the manual
  mv "$pkgdir"/usr/share/doc/wesnoth-1.4/manual/* "$pkgdir"/usr/share/doc/wesnoth-1.4/
  rmdir "$pkgdir/usr/share/doc/wesnoth-1.4/manual/"

  # better use the tools from a recent version of wesnoth
  rm -r "$pkgdir/usr/share/wesnoth-1.4/data/tools"

  # remove unneeded files
  rm -r "$pkgdir/usr/share/wesnoth-1.4/icons"
  find "$pkgdir/usr/share" -name .gitignore -delete

  # placing launcher, icons and (not required) appdata and systemd files
  install -D -m644 "$srcdir/org.wesnoth.Wesnoth_1.4.desktop" "$pkgdir/usr/share/applications/wesnoth-1.4.desktop"
  install -D -m644 "$srcdir/wesnoth-1.4-git/icons/wesnoth-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/wesnoth-1.4-icon.png"
  install -D -m644 "$srcdir/wesnoth-1.4-git/icons/wesnoth-icon-Mac.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wesnoth-1.4-icon.png"

  # On Debian / Ubuntu / Mint, the two files go into /etc instead of /usr/lib
  install -D -m644 "$srcdir/wesnothd-1.4.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-1.4.conf"
  # On Debian / Ubuntu / Mint, edit the file and change:
  # Group=nobody to Group=nogroup
  # /usr/bin/rm to /bin/rm
  install -D -m644 "$srcdir/wesnothd-1.4.service" "$pkgdir/usr/lib/systemd/system/wesnothd-1.4.service"

  install -D -m644 "$srcdir/org.wesnoth.Wesnoth_1.4.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-1.4.appdata.xml"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
