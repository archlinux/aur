# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>

pkgbase=termite
pkgname=('termite' 'termite-terminfo')
pkgver=15
pkgrel=6
_vtever='0.64.2a'
_commit='409b8449ab51fccf51057621168c9c15c54d4807'
pkgdesc='A simple VTE-based terminal'
url='https://github.com/thestinger/termite/'
install=termite.install
license=('LGPL')
arch=('x86_64')
depends=('gtk3' 'pcre2' 'gnutls' 'vte-common')
makedepends=('git' 'ncurses' 'intltool' 'gperf' 'gtk-doc' 'meson')
source=("git+https://github.com/thestinger/termite.git#tag=v${pkgver}?signed"
        "git+https://github.com/BarbUk/vte-ng.git#tag=${_vtever}"
        "termite-util::git+https://github.com/thestinger/util.git#tag=${_commit}")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E'  # Jelle van der Waa
              '65EEFE022108E2B708CBFCF7F9E712E59AF5F22A') # Daniel Micay
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd termite
  git submodule init
  git config --local submodule.util.url "${srcdir}"/termite-util
  git submodule update
}

build() {
  arch-meson vte-ng build --prefix="${srcdir}"/vte-static --default-library=static -D docs=true -D b_lto=false -D static=true -D gir=false -D vapi=false -D docs=false
  meson compile -C build
  meson install -C build

  cd termite
  export PKG_CONFIG_PATH="${srcdir}"/vte-static/lib/pkgconfig
  make
}

package_termite() {
  depends+=('termite-terminfo')
  backup=(etc/xdg/termite/config)

  make -C termite DESTDIR="${pkgdir}" PREFIX=/usr install
  rm -r "${pkgdir}"/usr/share/terminfo
}

package_termite-terminfo() {
  pkgdesc='Terminfo for Termite, a simple VTE-based terminal'
  depends=('ncurses')

  mkdir -p "${pkgdir}"/usr/share/terminfo
  tic -x -o "${pkgdir}"/usr/share/terminfo termite/termite.terminfo
}
