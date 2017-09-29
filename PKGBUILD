# Maintainer: Manuel Schneider  <manuelschneid3r at googles mail>
pkgname=albert
pkgver=0.13.0
pkgrel=7
pkgdesc="A DE agnostic omnilauncher."
arch=('i686' 'x86_64')
url="https://github.com/albertlauncher/albert"
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
  'qt5-declarative'
  'virtualbox-sdk'
  'muparser'
)
optdepends=(
  'virtualbox: VirtualBox plugin'
  'muparser: Calculator plugin'
  'qt5-quickcontrols: QML frontend'
  'qt5-graphicaleffects: QML frontend'
)
provides=('albert')
conflicts=('albert-git')
source=("git://github.com/albertlauncher/albert.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')


prepare() {
  cd ${pkgname}

  # Workaround permission problems, this should be fixed in v0.13.1
  sed -i 's/git@github.com:/https:\/\/github.com\//' .gitmodules

  git submodule update --init --recursive
}


build() {
  cat << EOD

   ╭──────────────────────────────────────────────╮
   │                                              │
   │   If you plan to report bugs please modify   │
   │   the PKGBUILD to build the debug version.   │
   │                                              │
   ╰──────────────────────────────────────────────╯

EOD

  [[ -d "build" ]] || mkdir -p "build"
  cd "build"

  cmake \
    "../${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE="Release" \
    -Wno-dev

    # Maybe you want to add some of those
    # but remember to adjust the dependencies

    #-DCMAKE_BUILD_TYPE="Debug"
    #-DBUILD_WIDGETBOXMODEL=ON
    #-DBUILD_QMLBOXMODEL=ON
    #-DBUILD_APPLICATIONS=ON
    #-DBUILD_CALCULATOR=ON
    #-DBUILD_CHROMEBOOKMARKS=ON
    #-DBUILD_EXTERNALEXTENSIONS=ON
    #-DBUILD_DEBUG=OFF
    #-DBUILD_FILES=ON
    #-DBUILD_FIREFOXBOOKMARKS=ON
    #-DBUILD_HASHGENERATOR=ON
    #-DBUILD_KVSTORE=ON
    #-DBUILD_MPRIS=ON
    #-DBUILD_SSH=ON
    #-DBUILD_SYSTEM=ON
    #-DBUILD_TEMPLATE=OFF
    #-DBUILD_TERMINAL=ON
    #-DBUILD_VIRTUALBOX=ON

  make
}


package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir/" install | grep -v '^-- '
}

# vim:set ts=2 sw=2 et:
