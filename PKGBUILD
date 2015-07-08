# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
_pkgname=ladish
pkgname=${_pkgname}-git
pkgver=0.3.r147.g5fe205f
pkgrel=1
pkgdesc="Session management system for JACK."
arch=('any')
url="https://launchpad.net/ladish"
license=('GPL2')
depends=('jack2-dbus' 'dbus-glib' 'laditools-git' 'flowcanvas<=0.7.1' 'a2jmidid')
makedepends=('git' 'python2')
provides=("${_pkgname}" "lash")
conflicts=("${_pkgname}" "lash")
install=${pkgname}.install
source=("git://repo.or.cz/${_pkgname}.git")
md5sums=('SKIP')

_branch=master

pkgver() {
  cd ${srcdir}/${_pkgname}
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^ladish-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git checkout ${_branch}
}

build() {
  cd "${srcdir}/${_pkgname}"
  export PYTHON=/usr/bin/python2
  sed -i "s|env python|&2|" ${_pkgname}_control
  sed -i "s|\(RELEASE = \).*|\1True|" wscript
  python2 waf configure --prefix=/usr \
                        --enable-liblash \
                        --enable-pylash
  python2 waf
}

package() {
  cd "${srcdir}/${_pkgname}"
  python2 waf install --destdir="${pkgdir}/"
}
