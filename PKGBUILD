# Maintainer: Steven De Bondt <egnappah at gmail dot com>

pkgbase=mate-wayland-session-git
_srcname=mate-wayland-session
install=matewayland.install
pkgver=1.28.0
pkgrel=2
arch=('x86_64')
url="https://github.com/mate-desktop/mate-desktop"
license=('GNU GENERAL PUBLIC LICENSE Version 2')
depends=('dconf' 'gtk3' 'startup-notification' 'wayfire' 'xorg-xwayland')
makedepends=('mate-common-git' 'yelp-tools' 'gtk-doc' 'gobject-introspection' 'autoconf-archive' 'meson')

# We all love colors. Stop pretending you don't.
BRED="\033[1;31m"
BYELLOW='\033[1;93m'
BORANGE='\033[01;38;5;214m'
BGREEN='\033[1;92m'
NOCOLOR='\033[0m'


source=("git+https://github.com/mate-desktop/mate-wayland-session"
	"wayfire.ini.sample")
sha256sums=('SKIP'
            'SKIP')
pkgver() {
  echo $pkgver
}

prepare() {
	echo -e "${BYELLOW}Now ${BGREEN}checking and configuring${BYELLOW} via the autogen.${NOCOLOR}"
	cd "${_srcname}"
	./autogen.sh --prefix=/usr
}

build() {
	echo -e "${BYELLOW}Now ${BGREEN}building${BYELLOW} ${_srcname}${NOCOLOR}"
	cd "${_srcname}"
	make
}

package() {
	pkgdesc="Builds the experimental mate wayland session"
	cd "${srcdir}/${_srcname}"
	echo -e "${BYELLOW}Now ${BGREEN}Fixing/Patching${BYELLOW} packaging parameters..${NOCOLOR}"
	bindir=${pkgdir}/usr
	datadir=${pkgdir}/usr/share/wayland-sessions
	sed -i "s/\${exec_prefix}/${bindir//\//\\/}/g" "${srcdir}/${_srcname}/session/Makefile"
	sed -i "s/\${datarootdir}/${datadir//\//\\/}/g" "${srcdir}/${_srcname}/session/Makefile"
	sed -i "s/\${datarootdir}/${datadir//\//\\/}/g" "${srcdir}/${_srcname}/data/mate/Makefile"
	sed -i "s/\${exec_prefix}/${bindir//\//\\/}/g" "${srcdir}/${_srcname}/data/Makefile"
	sed -i "s/\${datarootdir}/${datadir//\//\\/}/g" "${srcdir}/${_srcname}/data/Makefile"
	sed -i "s/\${prefix}/${bindir//\//\\/}/g" "${srcdir}/${_srcname}/data/Makefile"
	sed -i '/mkdir -p \$(datadir)\/doc\/firedecor/a\
	mkdir -p \$(datadir)/glib-2.0/schemas/' "${srcdir}/${_srcname}/data/Makefile"
	sed -i /glib-compile-schemas/d "${srcdir}/${_srcname}/data/Makefile"
	make install
	mkdir -p "${pkgdir}/usr/share/doc/wayfire/"
	cp ${srcdir}/wayfire.ini.sample "${pkgdir}/usr/share/doc/wayfire/wayfire-mate-wayland.ini"
}

pkgname=("${pkgbase}")
