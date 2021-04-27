# Maintainer: Shakil Shaikh <sshaikh@hotmail.com>
# Original Maintainer: Frederik Schwan <freswa@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgbase=termite-putty-clipboard
pkgname=('termite-putty-clipboard' 'termite-terminfo-putty-clipboard')
_pkgname_termite=termite
_pkgname_terminfo=termite-terminfo
pkgver=15
pkgrel=3.1
_vtever='0.56.2.a'
_commit='409b8449ab51fccf51057621168c9c15c54d4807'
pkgdesc='A simple VTE-based terminal with PuTTY like clipboard actions'
url='https://github.com/thestinger/termite/'
license=('LGPL')
arch=('x86_64')
depends=('gtk3' 'pcre2' 'gnutls' 'vte-common')
makedepends=('git' 'ncurses' 'intltool' 'gperf' 'gtk-doc')
source=("git+https://github.com/thestinger/termite.git#tag=v${pkgver}?signed"
        "git+https://github.com/thestinger/vte-ng.git#tag=${_vtever}"
        "termite-util::git+https://github.com/thestinger/util.git#tag=${_commit}"
        "rc-paste.patch")
validpgpkeys=('E499C79F53C96A54E572FEE1C06086337C50773E'  # Jelle van der Waa
              '65EEFE022108E2B708CBFCF7F9E712E59AF5F22A') # Daniel Micay
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {

  patch -s -p1 < rc-paste.patch

  cd vte-ng
  echo 'sources: $(BUILT_SOURCES)' >> src/Makefile.am 
  NOCONFIGURE=1 ./autogen.sh

  cd ../termite
  git submodule init
  git config --local submodule.util.url "${srcdir}"/termite-util
  git submodule update
}

build() {
  cd vte-ng
  ./configure \
    --prefix="${srcdir}"/vte-static \
    --localedir=/usr/share/termite/locale \
    --enable-static \
    --disable-shared \
    enable_introspection=no \
    enable_vala=no \
    --disable-gtk-doc \
    --disable-glade-catalogue
  make -C src sources install-exec install-data -j 1 # makefile bug does not allow -j
  make install-pkgconfigDATA

  cd ../termite
  export PKG_CONFIG_PATH="${srcdir}"/vte-static/lib/pkgconfig
  make
}

package_termite-putty-clipboard() {
  provides=("${_pkgname_termite}"="${pkgver}")
  conflicts=("${_pkgname_termite}")

  depends+=('termite-terminfo-putty-clipboard')
  backup=(etc/xdg/termite/config)

  make -C vte-ng/po DESTDIR="${pkgdir}" install-data
  make -C termite DESTDIR="${pkgdir}" PREFIX=/usr install
  rm -r "${pkgdir}"/usr/share/terminfo
}

package_termite-terminfo-putty-clipboard() {
  provides=("${_pkgname_terminfo}"="${pkgver}")
  conflicts=("${_pkgname_terminfo}")

  pkgdesc='Terminfo for Termite, a simple VTE-based terminal'
  depends=('ncurses')

  mkdir -p "${pkgdir}"/usr/share/terminfo
  tic -x -o "${pkgdir}"/usr/share/terminfo termite/termite.terminfo
}
