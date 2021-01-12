#Contributor:Andrea Tarocchi <valdar@email.it>
#Maintainer: Andrea Tarocchi <valdar@email.it>

pkgname=wesnoth-devel
# when changing major version (i.e. 1.15 to 1.1X) remeber to updated the occurences in build() and package()
pkgver=1.15.8
pkgrel=1
pkgdesc="development version of a turn-based strategy game on a fantasy world"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org/"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'pango' 'fribidi' 'lua' 'dbus' 'openssl' 'boost-libs' 'desktop-file-utils')
optdepends=('python:  some tools for UMC developers'
            'python2: some tools for UMC developers'
            'tk: for GUI.pyw, a gui for some of these tools'
            'gettext: for creating translation files with wmlxgettext'
            'python-pyenchant: spellchecking with wmllint'
            'optipng: png optimization with wesnoth-optipng / woptipng'
            'advancecomp: png optimization with wesnoth-optipng / woptipng'
            'imagemagick: png optimization with wesnoth-optipng / woptipng'
            'libpng:  png screenshots')
makedepends=('boost' 'scons' 'pkg-config')
checkdepends=('desktop-file-utils' 'appstream-glib')
install=${pkgname}.install
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("https://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
        "${pkgname}.desktop"
        "wesnoth_editor-devel.desktop"
        "${pkgname}-icon.png"
        "${pkgname}_editor-icon.png"
        "wesnothd-devel.tmpfiles.conf"
        "wesnothd-devel.service"
        "wesnoth-devel.appdata.xml")

md5sums=('845d08ac4f8d439ccf206f0dd6922ada'
         '719df848ebda176f995051ef9da302c6'
         '049a22a72074277e53484e3a530d1d69'
         '251f487241afda73c048b4fb654ceda7'
         'c5dc8ed0f8ece0b3990bfe367097509c'
         'd9d4677b083eab179200e34c6dea8899'
         '93f1afc41c66eb324a45ca26055f1507'
         'eb0e7466413cd0cdf5ed535146e87f87')

PKGEXT='.pkg.tar'

prepare() {
  cd "$srcdir/wesnoth-$pkgver"

  #How to manually create a patch
  #diff -rupN src/ src_new/ > patch_name.patch

  #How to apply a patch
  #patch -p1 < ../../sdlmixer_2.0.2.patch
}

check() {
  cd "$srcdir"
  desktop-file-validate --no-hints --no-warn-deprecated *.desktop
  appstream-util validate-relax *.appdata.xml
}

build() {
  cd "$srcdir/wesnoth-$pkgver"

  #the option build=debug can be useful if the game crashes and you would like to report a bug
  scons jobs=4 desktop_entry=False prefix=/usr version_suffix=-devel prefsdir=.wesnoth-devel \
  docdir=/usr/share/doc/wesnoth-devel fifodir=/run/wesnothd-devel \
  prefsdir=.local/share/wesnoth/1.15 \
  appdata_file=False enable_lto=True wesnoth wesnothd
}

package(){
  cd "$srcdir/wesnoth-$pkgver"

  scons destdir="$pkgdir" install
  cp -r "$srcdir/wesnoth-$pkgver/utils" "$pkgdir/usr/share/$pkgname/"

  #INSTALLING of menu entry and icons and appstream information:
  install -D -m644 "$srcdir/wesnoth-devel.desktop" "$pkgdir/usr/share/applications/wesnoth-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel-icon.png" "$pkgdir/usr/share/pixmaps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnoth_editor-devel.desktop" "$pkgdir/usr/share/applications/wesnoth_editor-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel_editor-icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}_editor-icon.png"

  install -D -m644 "$srcdir/wesnothd-devel.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-devel.conf"
  install -D -m644 "$srcdir/wesnothd-devel.service" "$pkgdir/usr/lib/systemd/system/wesnothd-devel.service"

  install -D -m644 "$srcdir/wesnoth-devel.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-devel.appdata.xml"

  # add suffix to manpages (.6 is the file extension) and copy them in the right directory
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.15.6
  done

  # setting dist file
  echo Linux repository > "$pkgdir"/usr/share/wesnoth-devel/data/dist

  # clean up, in case you will use these files not just for building a package
  sed '/destdir = /d' -i "$srcdir/wesnoth-$pkgver/.scons-option-cache"
}
