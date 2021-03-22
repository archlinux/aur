# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-arpeggiator-lv2
pkgname="${_pkgname}-git"
pkgver=r101.5fefe42
pkgrel=1
pkgdesc="A MIDI arpeggiator LV2 plugin from MOD Devices (git version)"
arch=('x86_64')
url="https://github.com/moddevices/mod-arpeggiator-lv2"
license=('GPL')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/moddevices/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule init
  git submodule set-url dpf "${srcdir}/dpf"
  git submodule update
}


build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}


package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
