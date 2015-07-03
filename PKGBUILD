

#Contributor:Andrea Tarocchi <valdar@email.it>
#Maintainer: Andrea Tarocchi <valdar@email.it>

pkgname=wesnoth-devel
pkgver=1.13.0
pkgrel=1
pkgdesc="development version of a turn-based strategy game on a fantasy world"
arch=('i686' 'x86_64')
url="http://www.wesnoth.org/"
license=('GPL')
depends=('pango>=1.14.8' 'sdl_ttf>=2.0.8' 'sdl_net>=1.2.7' 'sdl_mixer>=1.2.7' 'sdl_image>=1.2.7' 'fribidi>=0.10.9' 'dbus-core' 'python2' 'boost-libs' 'lua' 'desktop-file-utils')
makedepends=('boost>=1.56.0' 'scons>=0.98.3')
install=${pkgname}.install
source=("http://downloads.sourceforge.net/sourceforge/wesnoth/wesnoth-$pkgver.tar.bz2"
    "${pkgname}.desktop"
    "wesnoth_editor-devel.desktop"
    "wesnoth-devel-icon.xpm"
    "wesnoth-devel_editor-icon.xpm"
    "wesnothd-devel.tmpfiles.conf"
    "wesnothd-devel.service")
 
md5sums=('9c076f960ba85d71b34757e9520e3571'
'a906eae5d541a51de77038469b1f794b'
'b9de9e7ee16f757aa406466657c274a9'
'b73f4fdefd3e7daa158cce278f11be64'
'931e7443fe37b2862ca59f65ded74a0b'
'ffc4b6c06dcd187855710ed96a55fc8f'
'959aea3af36e7b2a1be6bf4537ec54b7')

prepare() {
  cd "${srcdir}/wesnoth-$pkgver"

  #How to manually create a patch 
  #diff -rupN src/ src_new/ > patch_name.patch

  #Patching due to boost 1.56 changes
  #[https://gna.org/bugs/?22643]
  #atch -p1 < ../0001-multiplayer_connect_engine.cpp-dereference-pointer.patch
}

build() {
  cd "${srcdir}/wesnoth-$pkgver"
 
  scons prefix=/usr program_suffix=-devel datadirname=wesnoth-devel prefsdir=.wesnoth-devel fifodir=/run/wesnothd-devel \
  localedir=/usr/share/locale docdir=/usr/share/doc/wesnoth-devel mandir=/usr/share/man/wesnoth-devel python_site_packages_dir=/lib/python/site-packages/wesnoth all
}

package(){
 cd "${srcdir}/wesnoth-$pkgver"
 scons destdir=${pkgdir} install
 
 #INSTALLING of menu entry and icons:
 install -D -m644 ../../wesnoth-devel.desktop ${pkgdir}/usr/share/applications/wesnoth-devel.desktop
 install -D -m644 ../../wesnoth-devel-icon.xpm ${pkgdir}/usr/share/pixmaps/wesnoth-devel-icon.xpm
 install -D -m644 ../../wesnoth-devel-icon.xpm ${pkgdir}/usr/share/icons/wesnoth-devel-icon.xpm
 
 install -D -m644 ../../wesnoth_editor-devel.desktop ${pkgdir}/usr/share/applications/wesnoth_editor-devel.desktop
 install -D -m644 ../../wesnoth-devel_editor-icon.xpm ${pkgdir}/usr/share/pixmaps/wesnoth-devel_editor-icon.xpm
 install -D -m644 ../../wesnoth-devel_editor-icon.xpm ${pkgdir}/usr/share/icons/wesnoth-devel_editor-icon.xpm
 
 #chmod +x ${pkgdir}/var/run/wesnothd-devel
 #chmod o+r ${pkgdir}/var/run/wesnothd-devel
 
 rm -f ${pkgdir}/usr/share/applications/wesnoth.desktop
 rm -f ${pkgdir}/usr/share/applications/wesnoth_editor.desktop
 rm -f ${pkgdir}/usr/share/icons/wesnoth-icon.png
 rm -f ${pkgdir}/usr/share/icons/wesnoth_editor-icon.png
 rm -rf ${pkgdir}/run/wesnothd-devel/
 rm -rf ${pkgdir}/run/

 install -Dm644 "$srcdir/wesnothd-devel.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/wesnothd-devel.conf"
 install -Dm644 "$srcdir/wesnothd-devel.service" "$pkgdir/usr/lib/systemd/system/wesnothd-devel.service"
}