# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
pkgname=ladish-git
pkgver=0.3.r147.g5fe205f
pkgrel=3
pkgdesc="Session management system for JACK."
arch=('any')
url="https://launchpad.net/ladish"
license=('GPL2')
depends=('jack2-dbus' 'dbus-glib' 'laditools-git' 'flowcanvas<=0.7.1' 'a2jmidid')
makedepends=('git' 'python2')
provides=("ladish" "lash")
conflicts=("ladish" "lash")
install=${pkgname}.install
source=("git://repo.or.cz/ladish.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/ladish
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^ladish-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/ladish"
  git checkout master
}

build() {
  cd "${srcdir}/ladish"
  export PYTHON=/usr/bin/python2
  sed -i "s|env python|&2|" ladish_control
  sed -i "s|\(RELEASE = \).*|\1True|" wscript
  python2 waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python2 waf
}

package() {
  cd "${srcdir}/ladish"
  python2 waf install --destdir="${pkgdir}/"
}
