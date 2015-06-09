# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=noise-bzr
pkgver=r1798
pkgrel=1
pkgdesc='The Pantheon Music Player'
arch=('i686' 'x86_64')
url='https://launchpad.net/noise'
license=('GPL3')
depends=('desktop-file-utils' 'granite-bzr' 'gst-plugins-base-libs' 'libgpod'
         'libindicate-gtk3' 'libnotify' 'libpeas' 'sqlheavy' 'taglib')
makedepends=('bzr' 'cmake' 'vala')
optdepends=('gst-plugins-base: "Base" plugin libraries'
            'gst-plugins-good: "Good" plugin libraries'
            'gst-plugins-bad: "Bad" plugin libraries'
            'gst-plugins-ugly: "Ugly" plugin libraries'
            'gst-libav: Libav plugin')
provides=('noise')
conflicts=('noise')
install='noise.install'
source=('bzr+lp:noise'
        'noise-mesa-conflict.patch'
        'noise-plugin-path.patch')
sha256sums=('SKIP'
            '4097f73439bad8bac46eda80af4a557a31fc14ac5ae10edfc0a2c601071df62a'
            'e83aa10261109d7459945a6731ca18910707426ca7576557bf138614491d0073')

pkgver() {
  cd noise

  echo "r$(bzr revno)"
}

prepare() {
  cd noise

  patch -Np1 -i ../noise-mesa-conflict.patch
  patch -Np1 -i ../noise-plugin-path.patch
}

build() {
  cd noise

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

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
