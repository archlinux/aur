# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Manuel Schneider  <manuelschneid3r at googles mail>

pkgname=albert
pkgver=0.17.6
pkgrel=2
pkgdesc="A sophisticated standalone keyboard launcher"
arch=('x86_64')
url="https://github.com/albertlauncher"
license=('GPL')
depends=('qt5-charts' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-svg' 'qt5-x11extras')
makedepends=('cmake' 'git' 'muparser' 'python' 'qt5-declarative' 'virtualbox' 'virtualbox-sdk')
optdepends=('muparser: Calculator plugin'
            'python: Python extension'
            'virtualbox: VirtualBox plugin')
source=("mirrors/albert::git+https://github.com/albertlauncher/albert.git#tag=v${pkgver}"
        "mirrors/plugins::git+https://github.com/albertlauncher/plugins.git"
        "mirrors/python::git+https://github.com/albertlauncher/python.git"
        "mirrors/pybind11::git+https://github.com/pybind/pybind11.git"
        "mirrors/xkcd-plugin::git+https://github.com/bergercookie/xkcd-albert-plugin.git"
        "mirrors/jetbrains-plugin::git+https://github.com/mqus/jetbrains-albert-plugin.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  mkdir -p build

  cd "$srcdir/albert"
  git submodule init
  git config submodule.plugins.url "$srcdir/plugins"
  git -c protocol.file.allow=always submodule update plugins

  cd "$srcdir/albert/plugins"
  git submodule init
  git config submodule.python/pybind11.url "$srcdir/pybind11"
  git config submodule.python/share/modules.url "$srcdir/python"
  git -c protocol.file.allow=always submodule update python/pybind11 python/share/modules
  
  cd "$srcdir/albert/plugins/python/share/modules"
  git submodule init
  git config submodule.jetbrains_projects.url "$srcdir/jetbrains-plugin"
  git config submodule.xkcd.url "$srcdir/xkcd-plugin"
  # currently submodules are out-of-dated in upstream
  # so we have to checkout them
  git -c protocol.file.allow=always submodule update --remote --merge jetbrains_projects xkcd
}


build() {
  cd build

  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev \
    -DBUILD_WIDGETBOXMODEL=ON \
    -DBUILD_QMLBOXMODEL=ON \
    -DBUILD_APPLICATIONS=ON \
    -DBUILD_CALCULATOR=ON \
    -DBUILD_CHROMEBOOKMARKS=ON \
    -DBUILD_DEBUG=OFF \
    -DBUILD_FILES=ON \
    -DBUILD_FIREFOXBOOKMARKS=ON \
    -DBUILD_HASHGENERATOR=ON \
    -DBUILD_MPRIS=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_SSH=ON \
    -DBUILD_SYSTEM=ON \
    -DBUILD_TEMPLATE=OFF \
    -DBUILD_TERMINAL=ON \
    -DBUILD_VIRTUALBOX=ON

  make
}


package() {
  cd build

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

