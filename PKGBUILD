# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Maintainer: liberodark
 
pkgname=natron-git
name=natron
pkgver=2.3.10
ver=2.3
pkgrel=3
pkgdesc="Open source compositing software. Node-graph based. Similar in functionalities to Adobe After Effects and Nuke by The Foundry."
arch=("i686" "x86_64")
url="https://github.com/mrkepzie/natron"
license=("GPL")
depends=('fontconfig' 'qt4' 'python2-pyside' 'python2-shiboken' 'boost-libs' 'pixman' 'glfw-x11' 'cairo')
makedepends=('git' 'expat' 'boost')
optdepends=('openfx-io-git' 'openfx-misc-git' 'openfx-arena-git: Extra 
OpenFX 
plugins for Natron includes text node' 'openfx-gmic-git' 'natron-plugins' 
'firejail-extras: Run Natron with an isolated enviorment')
com=4e1ebc9fd4d81daf24f2adc5a9fad232ea7b6362
source=("$name::git+https://github.com/NatronGitHub/Natron.git#commit=$com"
        "https://github.com/MrKepzie/OpenColorIO-Configs/archive/Natron-v${ver}.tar.gz"
        "config.pri")


sha512sums=('SKIP'
            '3150970fe1de1c30fe6e58b999249c6c1157c7f60b6e21c316e6690112aabc0d2908f1735f9b51cc70611297a25cefc59d57dbbe4b7155f8775700d12372ae5d'
            '9ec6c75d0bba8b139f4373e13357a9bb34b41ff2accd0365e09d9a517d93f93090f2a8784ff7bdde2cfbebbc3bad2c06d07563231710e18ff6cdedbfc7b42bee')


prepare() {
  cd "$srcdir/$name"
  
  mv "$srcdir/OpenColorIO-Configs-Natron-v${ver}" "$srcdir/$name/OpenColorIO-Configs"

  # Git submodules
git submodule update --init --recursive


  mv "${srcdir}/config.pri" "${srcdir}/${pkgname%%-*}/config.pri"
  # Fix for gcc6 build issues
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Gui/Gui.pro
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Engine/Engine.pro
  sed -i '1s/^/QMAKE_CXXFLAGS += -std=c++98\n/' Tests/Tests.pro
}

build() {
  cd "$srcdir/$name"

  [[ -d build ]] && rm -r build; mkdir build; cd build

  qmake-qt4 -r "$srcdir/natron/Project.pro" PREFIX=/usr CONFIG+=release DEFINES+=QT_NO_DEBUG_OUTPUT QMAKE_CFLAGS_RELEASE="${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"

  make
}

 package() {
  cd "$srcdir/$name/build"
  make INSTALL_ROOT="$pkgdir" install
 }
