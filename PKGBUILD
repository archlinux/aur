# Maintainer: Daniel Maslowski <info@orangecms.org>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=upplay-git
pkgver=1.9.10.r28.gef79569
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(libupnpp qt6-base qt6-webchannel qt6-webengine jsoncpp glibc gcc-libs hicolor-icon-theme
         libupnpp.so)
makedepends=(git qt6-tools)
provides=(upplay)
conflicts=(upplay)
source=("git+https://framagit.org/medoc92/upplay.git"
        "git+https://framagit.org/medoc92/amber-mpris.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd upplay
  git submodule init
  git config submodule.amber-mpris.url "${srcdir}/amber-mpris"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd upplay
  git describe --long --tags | sed 's/^UPPLAY_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd upplay
  qmake6 -o Makefile upplay.pro PREFIX=/usr
  make
}

package() {
  cd upplay
  make install INSTALL_ROOT="${pkgdir}"
}
