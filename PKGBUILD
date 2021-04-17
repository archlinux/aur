# Maintainer: Milk Brewster (milkii on Freenode)
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-cv-plugins
pkgname="${_pkgname}-git"
pkgver=r214.0ac8ecd
pkgrel=2
pkgdesc="CV (audio-rate control) LV2 plugins from MOD Devices (git version)"
arch=('i686' 'x86_64')
url="https://github.com/moddevices/mod-cv-plugins"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'lv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/moddevices/mod-cv-plugins.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP'
         'SKIP')


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
  git submodule set-url source/mod-logic-operators/dpf "${srcdir}/dpf"
  git submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -dm755 "${pkgdir}"/usr/lib/lv2
  make DEST_DIR="${pkgdir}/usr/lib/lv2" install
}

# vim:set ts=2 sw=2 et:
