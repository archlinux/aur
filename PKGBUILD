# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Janne Haapsaari <haaja at iki dot fi>
# Contributor: Christopher Krooß <didi2002 at web dot de>

pkgname=gnome-shell-extension-dash-to-dock-git
pkgver=44.r29.gaa1720b
pkgrel=1
pkgdesc="Extends the dash, transforming it into an intellihide dock."
arch=('any')
url="https://github.com/micheleg/dash-to-dock/"
license=('GPL')
depends=('dconf')
makedepends=('git' 'gnome-common' 'intltool')
provides=('gnome-shell-extension-dash-to-dock')
conflicts=('gnome-shell-extensions-git' 'gnome-shell-extension-dash-to-dock')
install="gschemas.install"
source=("${pkgname}::git+https://github.com/micheleg/dash-to-dock.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^extensions.gnome.org.v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch}
  sed -i 's/INSTALLBASE = ~\/.local\/share\/gnome-shell\/extensions/INSTALLBASE = ${DESTDIR}/' Makefile
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions" "${pkgdir}/usr/share/glib-2.0/schemas/"
  make DESTDIR="${pkgdir}/usr/share/gnome-shell/extensions" install
  install -m644 "schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml" \
    "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml"
}
