# Maintainer: Severin Glöckner <severin dot gloeckner at stud dot htwk minus leipzig dot de>

_suffix=-1.14
pkgname=wesnoth-1.14
pkgver=1.14.17
pkgrel=1
pkgdesc="Turn-based strategy game on a fantasy world (1.14 version)"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.wesnoth.org"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'boost-libs' 'bzip2' 'zlib' 'libvorbis' 'pango' 'cairo' 'fontconfig' 'openssl' 'dbus' 'fribidi' 'readline')
makedepends=('boost' 'scons' 'sed')
options=('!emptydirs')
source=("https://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
        "wesnothd$_suffix.tmpfiles.conf"
        "wesnothd$_suffix.service")

sha256sums=('3646cba604e09c12d6900a733bcb78cbf05f2f75f05346630d6529c220f584e1'
            '544f3692a6602e9a0aab33f7a15fa13c9c58530725ae7d0eff3db28db64161be'
            '50517c01496360b37431eb4932cd834ce2d863cb3a4ecba1c4b0f669242556d7')

build() {
  cd wesnoth-$pkgver
  scons jobs=4 \
      prefix=/usr \
      version_suffix=$_suffix \
      docdir=share/doc/wesnoth$_suffix \
      fifodir=/run/wesnothd$_suffix \
      prefsdir=.local/share/wesnoth/1.14 \
      enable_lto=True \
      wesnoth wesnothd
}

package() {
  cd wesnoth-$pkgver

  # On Debian / Ubuntu / Mint / Fedora / Suse, just "make install"
  scons destdir="$pkgdir" install

  # these translation files are not needed
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manpages.mo -delete
  find "$pkgdir/usr/share/wesnoth$_suffix/translations" -name wesnoth-manual.mo -delete

  # add suffix to manpages (-1.14 is added, .6 is not part of version number, it is the file extension)
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv $filename $(dirname $filename)/$(basename $filename .6)-1.14.6
  done

  # rename icons
  cd "$pkgdir/usr/share/icons/hicolor"
  for iconname in */apps/wesnoth-icon.png
    do
      mv "$iconname" "$(dirname $iconname)"/wesnoth-1.14-icon.png
  done
  cd "$pkgdir/usr/share/icons/HighContrast/scalable/apps/"
  mv wesnoth-icon.svg wesnoth-1.14-icon.svg

  # add suffix to the program launcher
  cd "$pkgdir/usr/share/applications"
  mv wesnoth.desktop wesnoth-1.14.desktop
  sed -i '/^Icon/ s/wesnoth-icon/wesnoth-1.14-icon/' wesnoth-1.14.desktop
  sed -i '/^Exec/ s/wesnoth/wesnoth-1.14/' wesnoth-1.14.desktop
  # change everything between the two lines ... including the two lines
  sed -i '/^Type/,/^GenericName/ s/$/ (1.14)/' wesnoth-1.14.desktop
  # so we revert the changes in these two lines
  sed -i '/^Type/ s/ (1.14)//' wesnoth-1.14.desktop
  sed -i '/^GenericName/ s/ (1.14)//' wesnoth-1.14.desktop

  # add suffix for the store description file
  cd "$pkgdir/usr/share/metainfo"
  mv wesnoth.appdata.xml wesnoth-1.14.appdata.xml
  sed -i 's!<id>wesnoth!<id>wesnoth-1.14!' wesnoth-1.14.appdata.xml
  sed -i 's!.desktop</launchable>!-1.14.desktop</launchable>!' wesnoth-1.14.appdata.xml
  sed -i 's!</name>! (1.14)</name>!' wesnoth-1.14.appdata.xml
  sed -i 's!</binary>!-1.14</binary>!' wesnoth-1.14.appdata.xml
  sed -i '/translation type="gettext"/d' wesnoth-1.14.appdata.xml

  # add systemd files for the multiplayer server
  install -D -m644 "$srcdir/wesnothd$_suffix.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd$_suffix.conf"
  install -D -m644 "$srcdir/wesnothd$_suffix.service" "$pkgdir/usr/lib/systemd/system/wesnothd$_suffix.service"

  # All done, but it doesn't show up? Try that:
  # update-desktop-database
}
