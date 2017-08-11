# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=manokwari
pkgname=${_pkgname}-git
pkgver=1.0.13.r0.gec20e0f
pkgrel=1
pkgdesc="HTML5 desktop shell from BlankOn Projects"
arch=('i686' 'x86_64')
url="https://manokwari.blankonlinux.or.id"
license=('GPL3')
depends=('mutter' 'libunique3' 'gnome-session' 'glib2' 'gtk3' 'libwnck3'
         'libgee' 'webkitgtk' 'gnome-menus' 'libnotify' 'xdg-utils')
makedepends=('gnome-common' 'git' 'vala')
optdepends=('bromo-gtk-theme: Gtk theme optimized for Manokwari shell'
            'tebu-icon-theme: Official icon sets from BlankOn'
            'tebu-flat-icon-theme: flat version of tebu-icon from BlankOn'
            'gnome-screensaver: Lock screen'
            'gnome-control-center: System settings'
            'gnome-terminal: Run commands from system menu')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/BlankOn/manokwari.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

prepare(){
  cd "${srcdir}/${_pkgname}"
  # Use libgee 0.8 rather than libgee 0.6
  sed -i 's/gee-1.0/gee-0.8/g' configure.ac
  # x-www-browser isn't provided by any package, use xdg-open instead
  sed -i 's:x-www-browser:xdg-open:' system/js/search.js
  # Install documentation to the correct location
  sed -i 's:\(manokwaridocdir =\).*:\1 ${prefix}/share/doc/manokwari:' Makefile.am
}

build(){
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  cp -R system/{css/,fonts/,img/,js/,widget/,texture.jpg,texture.xcf} --target-directory="${pkgdir}"/usr/lib/manokwari/system/
  chmod +x "${pkgdir}"/usr/bin/blankon-session
}
