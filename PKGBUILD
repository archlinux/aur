# Maintainer: Severin Glöckner <severin.gloeckner@stud-htwk.leipzig.de>

# This script contains as well instructions for other Linux systems.
# Have a look what is done in the build() and package() functions below.
# Execute the same command which are used there.

# On other systems, ignore the used variables like $pkgdir and $srcdir.
# (there $pkgdir would be the same as an undefined variable (empty),
#  and $srcdir would be the place where you have your files)


pkgname=wesnoth-1.12
pkgver=1.12.6+dev
pkgrel=13
pkgdesc="Turn-based strategy game on a fantasy world (oldstable)"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'sdl_net' 'boost-libs' 'bzip2' 'zlib' 'libvorbis' 'pango' 'cairo' 'fontconfig' 'dbus' 'fribidi')
makedepends=('boost' 'scons' 'git')
# package names on Debian / Ubuntu / Mint:
# libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl-net1.2-dev libboost-filesystem-dev libboost-locale-dev libboost-iostreams-dev libboost-regex-dev libboost-serialization-dev libasio-dev libboost-program-options-dev libboost-system-dev zlib1g-dev libpango1.0-dev libcairo2-dev libvorbis-dev libfontconfig1-dev libdbus-1-dev libfribidi-dev gettext-base scons pkgconf gcc g++ git
options=('!emptydirs')
source=("wesnoth-1.12-git::git+https://github.com/wesnoth/wesnoth.git#branch=1.12"
        "wesnoth-1.12.desktop"
        "wesnothd-1.12.tmpfiles.conf"
        "wesnothd-1.12.service"
        "wesnoth-1.12.appdata.xml")
# Not finding some files? https://aur.archlinux.org/packages/wesnoth-1.12
# Rest assured, they are optional. Things like a launcher for your convenience…

# Except for the wesnoth download, which can also be retrieved with this command:
# git clone https://github.com/wesnoth/wesnoth.git -b 1.12 --shallow-exclude=1.12.6 wesnoth-1.12-git

sha256sums=('SKIP'
            'f765499315d6650fe91424c0818cc57fc9fd06108c29e78c2db987c148dbf877'
            '4d11e481ad8610bb2ad65290d2b3d1bf2d058485deaa9016325499b113e0f89f'
            'f8e20adabc0ecdbce23aed375ad9b28b616cebb0d261b3c6b8e576ccb61dcdae'
            '15a5aa798923defd3debad04379f654c60bcbd59cc238c09b15c546eff954a0a')


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

  cd wesnoth-1.12-git
  scons jobs=$(nproc) \
      prefix=/usr \
      version_suffix=-1.12 \
      docdir=share/doc/wesnoth-1.12 \
      fifodir=/run/wesnothd-1.12 \
      prefsdir=.local/share/wesnoth/1.12 \
      openmp=False \
      desktop_entry=False \
      cxx0x=True \
      wesnoth wesnothd
}


# The commands below have to be run with root privileges.
# E.g. by prefixing them with "sudo ".
package() {
  cd wesnoth-1.12-git

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "scons install"
  scons destdir="$pkgdir" install

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
  # sudo update-desktop-database
}
