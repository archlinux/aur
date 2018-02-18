# Maintainer: artemtech <sofyanartem@gmail.com>
# Credit: twa022 <twa022@gmail.com>

pkgname=manokwari
pkgver=1.0.18
pkgrel=1
pkgdesc="HTML5 desktop shell from BlankOn Projects"
arch=('i686' 'x86_64')
url="https://manokwari.blankonlinux.or.id"
license=('GPL3')
depends=('mutter' 'libunique3' 'gnome-session' 'glib2' 'gtk3' 'libwnck3' 'libgee' 'webkitgtk' 'gnome-menus' 'libnotify')
makedepends=('gnome-common' 'git' 'vala' 'icu59' 'enchant1.6' 'cairo-ubuntu')
optdepends=('bromo-gtk-theme: Gtk theme optimized for Manokwari shell'
            'tebu-icon-theme: Official icon sets from BlankOn'
            'tebu-flat-icon-theme: flat version of tebu-icon from BlankOn'
            'gnome-screensaver: Lockscreen support'
            'gnome-control-center: System settings'
            'gnome-terminal: Run commands via dashboard')
source=("https://github.com/BlankOn/$pkgname/archive/$pkgver.tar.gz")
md5sums=('SKIP')

prepare(){
  cd ${srcdir}/${pkgname}-${pkgver}
  # Use gee-0.8 rather than gee-0.6
  sed -i 's/gee-1.0/gee-0.8/g' configure.ac
  # Fix documentations install dir
  sed -i 's:\(manokwaridocdir =\).*:\1 ${prefix}/share/doc/manokwari:' Makefile.am
  # Patching blankon-session install
  cat << @@@ > files/bin/Makefile.am
sessiondir = $(bindir)
dist_bin_SCRIPTS = blankon-session
CLEANFILES = $(dist_bin_SCRIPTS)
@@@
}

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
