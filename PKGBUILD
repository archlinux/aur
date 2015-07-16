# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=ladish
pkgname=${_pkgbase}-git
pkgver=0.3.r147.g5fe205f
pkgrel=1
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://launchpad.net/ladish"
license=('GPL2')
depends=('jack' 'dbus-glib' 'laditools-git' 'flowcanvas<=0.7.1' 'a2jmidid')
makedepends=('git' 'python2')
provides=('ladish' 'lash')
conflicts=('ladish' 'lash')
install=${pkgname}.install
source=("git://repo.or.cz/${_pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^ladish.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  _branch=master
  cd "${srcdir}/${_pkgbase}"
  git checkout ${_branch}
  sed -i "s|env python|&2|" ladish_control
  sed -i "s|\(RELEASE = \).*|\1True|" wscript
}

build() {
  cd "${srcdir}/${_pkgbase}"
  export PYTHON=/usr/bin/python2
  python2 waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python2 waf
}

package() {
  cd "${srcdir}/${_pkgbase}"
  python2 waf install --destdir="${pkgdir}/"
}
