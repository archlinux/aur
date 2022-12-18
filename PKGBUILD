# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: <skrylar@UFO>

_pkgname=ingen
pkgname=$_pkgname-git
pkgver=0.5.1.r3006.819fba38
pkgrel=1
pkgdesc='A modular plugin host for JACK and LV2 (git version)'
arch=(x86_64)
url='https://drobilla.net/software/ingen.html'
license=(GPL)
depends=(gtkmm python-rdflib)
makedepends=(boost ganv git jack lilv lv2 portaudio raul suil serd sord sratom)
provides=($_pkgname lv2-host)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://gitlab.com/drobilla/ingen.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  if [[ -d $pkgname-builddir ]]; then
    arch-meson --reconfigure $pkgname-builddir $_pkgname
  else
    arch-meson $pkgname-builddir $_pkgname
  fi

  meson compile -C $pkgname-builddir
}

#check() {
#  meson test -C $pkgname-builddir
#}

package() {
  depends+=(libganv-1.so libjack.so liblilv-0.so libportaudio.so libserd-0.so libsigc-2.0.so libsord-0.so libsratom-0.so libsuil-0.so )
  meson install --destdir="$pkgdir" -C $pkgname-builddir
  cd $_pkgname
  install -v -D -m 644 AUTHORS README.md THANKS -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
