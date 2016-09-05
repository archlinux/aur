# Maintainer: WoefulDerelict <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=ladish-git
pkgver=1.r47.g5fe205f
pkgrel=1
pkgdesc="Session management system for JACK."
arch=('i686' 'x86_64')
url="https://github.com/LADI/ladish"
license=('GPL2')
depends=('a2jmidid' 'boost' 'dbus-glib' 'flowcanvas<=0.7.1' 'jack' 'laditools-git' 'python2')
makedepends=('git' 'intltool')
provides=("${pkgname%-*}" 'lash')
conflicts=("${pkgname%-*}" 'lash')
source=("${pkgname}::git+https://github.com/LADI/ladish.git")
sha512sums=('SKIP')
_branch=master

pkgver() {
  cd "${pkgname}"
  git checkout ${_branch} --quiet
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^ladish.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  git checkout ${_branch}
  sed -i "s|env python|&2|" ladish_control
  sed -i "s|\(RELEASE = \).*|\1True|" wscript
}

build() {
  cd "${pkgname}"
  export PYTHON=/usr/bin/python2
  export CXX='g++ -std=c++11'
  python2 waf configure --prefix=/usr \
              --enable-liblash \
              --enable-pylash
  python2 waf
}

package() {
  cd "${pkgname}"
  python2 waf install --destdir="${pkgdir}/"
}
