# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=natron
pkgver=2.1.9
pkgrel=1
pkgdesc="Open source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry."
arch=("i686" "x86_64")
url="http://natron.fr/"
license=("GPL")
depends=('fontconfig' 'qt4' 'python2-pyside' 'python2-shiboken' 'boost-libs' 'pixman' 'glfw-x11' 'cairo' 'openfx-io' 'openfx-misc')
makedepends=('git' 'expat' 'boost')
optdepends=('openfx-arena: Extra OpenFX plugins for Natron includes text node')
source=("$pkgname::git+https://github.com/MrKepzie/Natron.git#tag=$pkgver"
        "git+https://github.com/devernay/openfx.git"
        "git+https://github.com/MrKepzie/google-test.git"
        "git+https://github.com/MrKepzie/google-mock.git"
        "git+https://github.com/MrKepzie/SequenceParsing.git"
        "git+https://github.com/MrKepzie/tinydir"
        "https://github.com/MrKepzie/OpenColorIO-Configs/archive/Natron-v${pkgver%.*}.tar.gz"
        "config.pri")
sha512sums=('SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           'SKIP'
           '5ee7b561703acb0489953867887c06e9b70ffc729d59a1686aace54b87a3c2736d87484d992c713d5bf464f6a9cf6332631825090fcaf834289d1126cd0ea0b9'
           '48017b7b9cd1854064b9ddffecedef89a4d38070f9a7d2cd506aad481a8061c5cffe5e5c84fc9b0ac5216fc99e093481db367e91ce52cb2a8a66223c4209402a')

prepare() {
  cd "$srcdir/$pkgname"
  
  mv "$srcdir/OpenColorIO-Configs-Natron-v${pkgver%.*}" "$srcdir/$pkgname/OpenColorIO-Configs"

  # Git submodules
  git config submodule.libs/OpenFX.url $srcdir/openfx
  git config submodule.Tests/google-mock.url $srcdir/google-mock
  git config submodule.Tests/google-test.url $srcdir/google-test
  git config submodule.libs/SequenceParsing.url $srcdir/SequenceParsing
  git submodule update

  cd libs/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
  cd ../..

  mv "${srcdir}/config.pri" "${srcdir}/${pkgname%%-*}/config.pri"
  # Fix for gcc6 build issues
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Gui/Gui.pro
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Engine/Engine.pro
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Tests/Tests.pro
}

build() {
  cd "$srcdir/$pkgname"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r "$srcdir/natron/Project.pro" PREFIX=/usr CONFIG+=release DEFINES+=QT_NO_DEBUG_OUTPUT QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make INSTALL_ROOT="$pkgdir" install
}
