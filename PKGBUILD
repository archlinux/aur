# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique-git
pkgver=1.10.1.r11.g4396af9
pkgrel=2
pkgdesc="A finely crafted music player"
arch=(x86_64)
url="https://flavio.tordini.org/musique"
license=(GPL3)
depends=(qt5-base qt5-declarative taglib mpv)
makedepends=(git qt5-tools)
source=("git+https://github.com/flaviotordini/musique.git"
        "git+https://github.com/flaviotordini/http.git"
        "git+https://github.com/flaviotordini/idle.git"
        "git+https://github.com/flaviotordini/media.git"
        "git+https://github.com/flaviotordini/updater.git"
        "git+https://github.com/flaviotordini/js.git"
        "git+https://github.com/flaviotordini/sharedcache.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
  git config 'submodule.lib/updater.url' "${srcdir}/updater"
  git config 'submodule.lib/js.url' "${srcdir}/js"
  git config 'submodule.lib/sharedcache.url' "${srcdir}/sharedcache"
  git -c protocol.file.allow=always submodule update
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

