#Contributor:Andrea Tarocchi <valdar9@protonmail.com>
#Maintainer: Andrea Tarocchi <valdar9@protonmail.com>

pkgname=wesnoth-devel
#XXX: when changing major version (i.e. 1.15 to 1.1X) remeber to updated the occurences in build() and package()
pkgver=1.17.14
pkgrel=1
pkgdesc="development version of a turn-based strategy game on a fantasy world"
arch=('i486' 'i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.wesnoth.org/"
license=('GPL')
depends=('sdl2'
         'sdl2_image' 
         'sdl2_mixer' 
         'pango' 
         'dbus' 
         'openssl' 
         'boost-libs')
optdepends=('python:  some tools for UMC developers'
            'tk: for GUI.pyw, a gui for some of these tools'
            'gettext: for creating translation files with wmlxgettext'
            'python-pyenchant: spellchecking with wmllint'
            'optipng: png optimization with wesnoth-optipng / woptipng'
            'advancecomp: png optimization with wesnoth-optipng / woptipng'
            'imagemagick: png optimization with wesnoth-optipng / woptipng')
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

sha256sums=('9b1ef227dc61dd5579b0906143825a768b06936c05fb955ec8fb717a4d4b0aca'
         '3631b4c1eda6c2099e43272f2a26a8a3e897b9541a395ebeb9a1b8b3753a647d'
         '196cd09c73c6503b9caef7c47bb61d0243c10e9b15daa6b3aff437f7ad03448a'
         '98fbd8bafff165c45d0a1eb23a500108e4ce7c8ed32b9abc9bf1c3179e1d3491'
         'ac69c89e3438d8fd327b5fba013d8eafec61060c5938a3c3baaadb6d85678998'
         '534097c1d5fcc6b8b54ae04535ed249f8a8f4b000fab39a87a073f54ab89349a'
         'bbfd14d4c445ca8696ecca8493862d3dd77566b973eb65157f93bd818d161972'
         '8889c59edd31d2f3d51e2a866034d0515ec0eda5d7cc67743251efaa16d06228')

prepare() {
  cd "$srcdir/wesnoth-$pkgver"

  #How to manually create a patch
  #diff -rupN src/ src_new/ > patch_name.patch

  #How to apply a patch
  #patch -p1 < ../../patch_name.patch
}

check() {
  cd "$srcdir"
  desktop-file-validate --no-hints --no-warn-deprecated *.desktop
  appstream-util validate-relax *.appdata.xml
}

build() {
  cd "$srcdir/wesnoth-$pkgver"

  #the option build=debug can be useful if the game crashes and you would like to report a bug
  scons jobs=4 desktop_entry=False prefix=/usr version_suffix=-devel \
  docdir=/usr/share/doc/wesnoth-devel fifodir=/run/wesnothd-devel \
  prefsdir=.local/share/wesnoth/1.17 \
  appdata_file=False enable_lto=True wesnoth wesnothd
}

package(){
  cd "$srcdir/wesnoth-$pkgver"

  scons destdir="$pkgdir" install
  cp -r "$srcdir/wesnoth-$pkgver/utils" "$pkgdir/usr/share/$pkgname/"

  #INSTALLING of menu entry and icons and appstream information:
  install -D -m644 "$srcdir/wesnoth-devel.desktop" "$pkgdir/usr/share/applications/wesnoth-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname-icon.png"

  install -D -m644 "$srcdir/wesnoth_editor-devel.desktop" "$pkgdir/usr/share/applications/wesnoth_editor-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel_editor-icon.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/${pkgname}_editor-icon.png"

  install -D -m644 "$srcdir/wesnothd-devel.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-devel.conf"
  install -D -m644 "$srcdir/wesnothd-devel.service" "$pkgdir/usr/lib/systemd/system/wesnothd-devel.service"

  install -D -m644 "$srcdir/wesnoth-devel.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-devel.appdata.xml"

  # add suffix to manpages (IMPORTANT: .6 is the file extension!!!) and copy them in the right directory
  for filename in "$pkgdir"/usr/share/man/{,*/}man6/wesnoth{,d}.6
    do
      mv "$filename" $(dirname $filename)/$(basename $filename .6)-1.17.6
  done

  # setting dist file
  echo Linux repository > "$pkgdir"/usr/share/wesnoth-devel/data/dist

  # clean up, in case you will use these files not just for building a package
  sed '/destdir = /d' -i "$srcdir/wesnoth-$pkgver/.scons-option-cache"
}
