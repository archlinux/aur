#Contributor:Andrea Tarocchi <valdar@email.it>
#Maintainer: Andrea Tarocchi <valdar@email.it>

pkgname=wesnoth-devel
pkgver=1.13.11
pkgrel=1
pkgdesc="development version of a turn-based strategy game on a fantasy world"
arch=('i686' 'x86_64')
url="https://www.wesnoth.org/"
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'pango' 'fribidi' 'lua' 'dbus' 'openssl' 'boost-libs' 'desktop-file-utils' 'ttf-dejavu' 'ttf-droid' 'ttf-lato')
optdepends=('python:  some tools for UMC developers'
            'python2: some tools for UMC developers'
            'tk: for GUI.pyw, a gui for some of these tools'
            'gettext: for creating translation files with wmlxgettext'
            'python-pyenchant: spellchecking with wmllint'
            'optipng: png optimization with wesnoth-optipng / woptipng'
            'advancecomp: png optimization with wesnoth-optipng / woptipng'
            'imagemagick: png optimization with wesnoth-optipng / woptipng'
            'libpng:  png screenshots')
makedepends=('boost' 'scons' 'libpng')
install=${pkgname}.install
options=('!emptydirs')
#options=('!emptydirs' '!strip') #use this when building with debugging symbols
source=("https://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
        "${pkgname}.desktop"
        "wesnoth_editor-devel.desktop"
        "wesnoth-devel-icon.xpm"
        "wesnoth-devel_editor-icon.xpm"
        "wesnothd-devel.tmpfiles.conf"
        "wesnothd-devel.service"
        "wesnoth-devel.appdata.xml")

md5sums=('e1c22dd75f4d3edb1504a1dbd51ff750'
         'fb3c2d5cfb93c8e8bce213f562c366e9'
         'b9de9e7ee16f757aa406466657c274a9'
         'b73f4fdefd3e7daa158cce278f11be64'
         '931e7443fe37b2862ca59f65ded74a0b'
         'd9d4677b083eab179200e34c6dea8899'
         '93f1afc41c66eb324a45ca26055f1507'
         'b6da095ff0849b5fd95204702a257496')

PKGEXT='.pkg.tar'

prepare() {
  cd "$srcdir/wesnoth-$pkgver"

  #How to manually create a patch
  #diff -rupN src/ src_new/ > patch_name.patch

  #How to apply a patch
  #patch -p1 < ../../sdlmixer_2.0.2.patch
}

build() {
  cd "$srcdir/wesnoth-$pkgver"

  #the option build=debug can be useful if the game crashes and you would like to report a bug
  scons jobs=4 desktop_entry=False prefix=/usr version_suffix=-devel prefsdir=.wesnoth-devel \
  docdir=/usr/share/doc/wesnoth-devel mandir=/usr/share/man/wesnoth-devel fifodir=/run/wesnothd-devel \
  appdata_file=False enable_lto=True openmp=True wesnoth wesnothd
}

package(){
  cd "$srcdir/wesnoth-$pkgver"

  scons destdir="$pkgdir" install
  cp -r "$srcdir/wesnoth-$pkgver/utils" "$pkgdir/usr/share/$pkgname/"

  #INSTALLING of menu entry and icons and appstream information:
  install -D -m644 "$srcdir/wesnoth-devel.desktop" "$pkgdir/usr/share/applications/wesnoth-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel-icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname-icon.xpm"

  install -D -m644 "$srcdir/wesnoth_editor-devel.desktop" "$pkgdir/usr/share/applications/wesnoth_editor-devel.desktop"
  install -D -m644 "$srcdir/wesnoth-devel_editor-icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname_editor-icon.xpm"

  install -D -m644 "$srcdir/wesnothd-devel.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-devel.conf"
  install -D -m644 "$srcdir/wesnothd-devel.service" "$pkgdir/usr/lib/systemd/system/wesnothd-devel.service"

  install -D -m644 "$srcdir/wesnoth-devel.appdata.xml" "$pkgdir/usr/share/metainfo/wesnoth-devel.appdata.xml"

  #clean up, in case you will use these files not just for building a package
  sed '/destdir = /d' -i "$srcdir/wesnoth-$pkgver/.scons-option-cache"
}
