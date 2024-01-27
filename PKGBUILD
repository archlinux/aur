# Maintainer: Milk Brewster (milkii on Freenode)
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-cv-plugins
pkgname="$_pkgname-git"
pkgver=r259.a2feb53
pkgrel=3
pkgdesc='CV (audio-rate control) LV2 plugins from MOD Devices (git version)'
arch=(i686 x86_64)
url='https://github.com/moddevices/mod-cv-plugins'
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc gcc-libs)
makedepends=(git lv2)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/moddevices/mod-cv-plugins.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git')
md5sums=('SKIP'
         'SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url source/mod-logic-operators/dpf "$srcdir/dpf"
  git -c protocol.file.allow=always submodule update
  # fix syntax error in .ttl file
  sed -i -e 's/html ;/html" ;/' source/mod-cv-meter/mod-cv-meter.lv2/mod-cv-meter.ttl
  # remove reference to non-existing file in .ttl file
  sed -i -e 's/ , <modgui\.ttl>//' source/mod-cv-transport/mod-cv-transport.lv2/manifest.ttl
}

build() {
  cd $_pkgname
  make PREFIX=/usr
}

package() {
  cd $_pkgname
  make install DESTDIR="$pkgdir" PREFIX=/usr INSTALL_PATH="$pkgdir"/usr/lib/lv2
}

# vim:set ts=2 sw=2 et:
