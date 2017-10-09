# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname=albert-lite
pkgver=0.13.1
pkgrel=1
pkgdesc="A sophisticated standalone keyboard launcher. Without QML and VirtualBox dependencies"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/albertlauncher"
license=('GPL')
depends=(
  'qt5-svg'
  'qt5-x11extras'
  'libx11'
)
makedepends=(
  'git'
  'cmake'
  'gcc'
  'qt5-svg'
  'muparser'
)
optdepends=(
  'muparser: Calculator plugin'
)
provides=('albert')
conflicts=('albert-git'
           'albert')
source=('git+https://github.com/albertlauncher/albert.git'
        'git+https://github.com/albertlauncher/plugins.git')
md5sums=('SKIP' 'SKIP')


prepare() {
  cd "${srcdir}/albert"
  git checkout "v${pkgver}" > /dev/null 2>&1
  git submodule init
  git config submodule.plugins.url $srcdir/plugins
  git submodule update plugins
}


build() {
  echo -e "

   ╭──────────────────────────────────────────────╮
   │                                              │
   │      \e[31mThis is a plugin based application\e[0m      │
   │       \e[31mCheck the optional dependencies\e[0m        │
   │                                              │
   │   If you plan to report bugs please modify   │
   │   the PKGBUILD to build the debug version.   │
   │                                              │
   ╰──────────────────────────────────────────────╯
"

  [[ -d "build" ]] || mkdir -p "build"
  cd "build"

  cmake \
    "../albert" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release" \
    -DBUILD_WIDGETBOXMODEL=ON \
    -DBUILD_QMLBOXMODEL=OFF \
    -DBUILD_APPLICATIONS=ON \
    -DBUILD_CALCULATOR=ON \
    -DBUILD_CHROMEBOOKMARKS=ON \
    -DBUILD_EXTERNALEXTENSIONS=ON \
    -DBUILD_DEBUG=OFF \
    -DBUILD_FILES=ON \
    -DBUILD_FIREFOXBOOKMARKS=ON \
    -DBUILD_HASHGENERATOR=ON \
    -DBUILD_KVSTORE=ON \
    -DBUILD_MPRIS=ON \
    -DBUILD_SSH=ON \
    -DBUILD_SYSTEM=ON \
    -DBUILD_TEMPLATE=OFF \
    -DBUILD_TERMINAL=ON \
    -DBUILD_VIRTUALBOX=OFF \
    -Wno-dev
  make
}


package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir/" install | grep -v '^-- '
}

# vim:set ts=2 sw=2 et:
