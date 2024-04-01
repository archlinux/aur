# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique-git
pkgver=1.12.r16.gba46852
pkgrel=1
pkgdesc="A finely crafted music player"
arch=(x86_64)
url="https://flavio.tordini.org/musique"
license=(GPL3)
depends=(qt6-base qt6-declarative taglib mpv)
makedepends=(git qt6-tools)
source=("git+https://github.com/flaviotordini/musique.git"
        "git+https://github.com/flaviotordini/http.git"
        "git+https://github.com/flaviotordini/idle.git"
        "git+https://github.com/flaviotordini/media.git"
        "git+https://github.com/flaviotordini/updater.git"
        "git+https://github.com/flaviotordini/js.git"
        "git+https://github.com/flaviotordini/sharedcache.git"
        "git+https://github.com/itay-grudev/SingleApplication.git"
        "git+https://github.com/flaviotordini/qt-reusable-widgets.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "musique"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "musique"
  install -d build

  git submodule init
  git config 'submodule.lib/http.url' "${srcdir}/http"
  git config 'submodule.lib/idle.url' "${srcdir}/idle"
  git config 'submodule.lib/media.url' "${srcdir}/media"
  git config 'submodule.lib/updater.url' "${srcdir}/updater"
  git config 'submodule.lib/js.url' "${srcdir}/js"
  git config 'submodule.lib/sharedcache.url' "${srcdir}/sharedcache"
  git config 'submodule.lib/singleapplication.url' "${srcdir}/SingleApplication"
  git config 'submodule.lib/qt-reusable-widgets.url' "${srcdir}/qt-reusable-widgets"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "musique/build"
  PATH="$PATH:/usr/lib/qt6/bin"
  qmake6 .. PREFIX=/usr
  make
}

package() {
  cd "musique/build"
  make INSTALL_ROOT="$pkgdir" install
}

