# Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Julien Virey <julien.virey@gmail.com>

pkgbase=termite-barbuk
pkgname=('termite-barbuk' 'termite-barbuk-terminfo')
pkgver=16.1
pkgrel=1
arch=('x86_64')
_vtever='0.64.2a'
_commit='409b8449ab51fccf51057621168c9c15c54d4807'
pkgdesc='A simple VTE-based terminal - BarbUk fork'
url='https://github.com/thestinger/termite/'
license=('LGPL')
depends=(gtk3 pcre2 gnutls vte-common)
makedepends=(git intltool gperf 'meson>=0.58' ninja)
source=("git+https://github.com/BarbUk/termite.git#tag=v${pkgver}?signed"
        "git+https://github.com/BarbUk/vte-ng.git#tag=${_vtever}?signed")
validpgpkeys=('9F59A49568EE372AF17E5452B6D01F84A7519939') # Julien Virey

sha256sums=('SKIP'
            'SKIP')

build() {
  arch-meson vte-ng build --prefix="${srcdir}"/vte-static --default-library=static -D b_lto=false -D static=true -D gir=false -D vapi=false -D docs=false
  meson compile -C build
  meson install -C build

  cd termite
  export PKG_CONFIG_PATH="${srcdir}"/vte-static/lib/pkgconfig
  make
}

package_termite-barbuk() {
  depends+=('termite-terminfo')
  backup=(etc/xdg/termite/config)
  conflicts=(termite)
  provides=(termite)

  make -C termite DESTDIR="${pkgdir}" PREFIX=/usr install
  rm -r "${pkgdir}"/usr/share/terminfo
}

package_termite-barbuk-terminfo() {
  pkgdesc='Terminfo for Termite, a simple VTE-based terminal'
  arch=('any')
  depends=('ncurses')
  conflicts=(termite-terminfo)
  provides=(termite-terminfo)

  mkdir -p "${pkgdir}"/usr/share/terminfo
  tic -x -o "${pkgdir}"/usr/share/terminfo termite/termite.terminfo
}
