# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=noise-player-bzr
pkgver=r1909
pkgrel=1
pkgdesc='The Pantheon Music Player'
arch=('i686' 'x86_64')
url='https://launchpad.net/noise'
license=('GPL3')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'hicolor-icon-theme'
         'json-glib' 'libaccounts-glib' 'libgda' 'libgee' 'libgpod'
         'libgsignon-glib' 'libnotify' 'libpeas' 'libsoup' 'pango' 'taglib'
         'zeitgeist'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'intltool' 'vala')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries'
            'gst-libav: Libav plugin')
replaces=('noise-bzr')
provides=('noise' 'noise-player')
conflicts=('noise' 'noise-player')
install='noise-player.install'
source=('bzr+lp:noise'
        'mesa-demos-conflict.patch'
        'noise-install-dirs.patch')
sha256sums=('SKIP'
            '0bda9d1b767b6ecd6bd3285abf348f74f7451ea6ae0a725d9a91885d0ff56b8e'
            'd0ebc710a742d942e04a8df61d91dd75ae4b2aeafe7fece08f1fbc90c507f1df')

pkgver() {
  cd noise

  echo "r$(bzr revno)"
}

prepare() {
  cd noise

  patch -Np1 -i ../mesa-demos-conflict.patch
  patch -Np1 -i ../noise-install-dirs.patch

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd noise/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make -j1
}

package() {
  cd noise/build

  make -j1 DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
