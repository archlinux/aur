# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique-git
pkgver=1.7.r9.g96afcad
pkgrel=1
pkgdesc="A finely crafted music player"
arch=(x86_64)
url="https://flavio.tordini.org/musique"
license=(GPL3)
depends=(qt5-base taglib mpv)
makedepends=(git qt5-tools)
source=("git+https://github.com/flaviotordini/musique.git"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/musique-missing-header.patch"
        "git+https://github.com/flaviotordini/http.git"
        "git+https://github.com/flaviotordini/idle.git"
        "git+https://github.com/flaviotordini/media.git")
sha256sums=('SKIP'
            '13ff6edfa5fd8f407be0bdc3eabfbc0a513cd15f9b88f9707bde21714180aeea'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  install -d build

  git submodule init
  git config 'submodule.lib/http.url' "${srcdir}/http"
  git config 'submodule.lib/idle.url' "${srcdir}/idle"
  git config 'submodule.lib/media.url' "${srcdir}/media"
  git submodule update

  cd "${srcdir}/${pkgname%-git}/src/model"
  patch artist.cpp -i "${srcdir}"/musique-missing-header.patch
}

build() {
  cd "${pkgname%-git}/build"
  qmake-qt5 ../musique.pro PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make INSTALL_ROOT="$pkgdir" install
}

