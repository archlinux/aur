# $Id$
# Maintainer: Realex
# Based on cinnamon-screensaver PKGBUILD

_pkgname=cinnamon-screensaver
pkgname=${_pkgname}-git
pkgver=119.8de7ff0
pkgrel=1
pkgdesc="Screensaver for cinnamon desktop"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/cinnamon-screensaver"
license=('GPL')
backup=(etc/pam.d/cinnamon-screensaver)
depends=('cinnamon-desktop-git' 'cinnamon-translations-git' 'dbus-glib' 'libgnomekbd')
makedepends=('intltool' 'gnome-common' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=('git+https://github.com/linuxmint/cinnamon-screensaver.git'
        'cinnamon-screensaver.pam')
sha256sums=('SKIP'
            'b6ea9e2eb586d94bcabb617a8f1c2958111df87afdbb51f645882bccdc15cbda')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
               --libexecdir=/usr/lib/cinnamon-screensaver \
               --localstatedir=/var \
               --with-mit-ext --with-systemd
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../cinnamon-screensaver.pam "$pkgdir/etc/pam.d/cinnamon-screensaver"
}
