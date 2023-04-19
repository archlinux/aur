# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=albert-git
_pkgname=${pkgname%-git}
pkgver=0.20.13.r0.gb421ff96
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher"
arch=('x86_64')
url="https://github.com/albertlauncher"
license=('GPL')
depends=('hicolor-icon-theme' 'qt6-scxml' 'qt6-svg')
makedepends=('cmake' 'git' 'muparser' 'pybind11' 'python' 'libqalculate')
optdepends=('muparser: calculator plugin'
            'python: python extension'
            'python-urllib3: python web plugins')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("mirrors/albert::git+https://github.com/albertlauncher/albert.git"
        "mirrors/plugins::git+https://github.com/albertlauncher/plugins.git"
        "mirrors/python::git+https://github.com/albertlauncher/python.git"
        "mirrors/qhotkey::git+https://github.com/Skycoder42/QHotkey.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/albert"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  mkdir -p build

  cd "$srcdir/albert"
  git submodule init

  git config submodule.plugins.url "$srcdir/plugins"
  git -c protocol.file.allow=always submodule update plugins

  git config submodule.lib/QHotkey.url "$srcdir/qhotkey"
  git -c protocol.file.allow=always submodule update lib/QHotkey

  cd "$srcdir/albert/plugins"
  git submodule init
  git config submodule.python/plugins.url "$srcdir/python"
  git -c protocol.file.allow=always submodule update python/plugins
}

build() {
  cd build

  cmake ../$_pkgname \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_FIND_PACKAGE_RESOLVE_SYMLINKS=ON \
    -DQHOTKEY_INSTALL=OFF \
    -DBUILD_WIDGETSBOXMODEL=ON \
    -DBUILD_APPLICATIONS_XDG=ON \
    -DBUILD_CALCULATOR=ON \
    -DBUILD_CHROMIUM=ON \
    -DBUILD_DEBUG=OFF \
    -DBUILD_FILES=ON \
    -DBUILD_HASH=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_SNIPPETS=ON \
    -DBUILD_SSH=ON \
    -DBUILD_SYSTEM=ON \
    -DBUILD_TEMPLATE=OFF \
    -DBUILD_TERMINAL=ON \
    -DBUILD_URLHANDLER=ON \
    -DBUILD_WEBSEARCH=ON

  make
}

package() {
  cd build

  make DESTDIR="$pkgdir/" install

  # remove some trash
  rm -r "$pkgdir/usr/share/albert/python/plugins/.archive"
  rm -r "$pkgdir/usr/share/albert/python/plugins/.git"*
}

# vim:set ts=2 sw=2 et:
