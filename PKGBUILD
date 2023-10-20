# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=kf5-servicemenus-jetbrains-dolphin-plugin-git
pkgver=r46.28fd06f
pkgrel=1
pkgdesc="Open directories and associated projects in the JetBrains IDEs"
license=('GPL')
_project_name="JetBrainsDolphinPlugin"
_url='https://github.com/alex1701c'
_submodule_name="jetbrains-api"
url="$_url/$_project_name"
arch=('x86_64')
depends=('kio5')
makedepends=('git' 'cmake' 'extra-cmake-modules')
_branch=master
source=("git+$url#branch=$_branch"
        "git+$_url/$_submodule_name#branch=$_branch")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_project_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_project_name"
  git submodule init
  git config submodule.src/jetbrains-api.url "$srcdir/jetbrains-api"
  git -c protocol.file.allow=always submodule update
}

build() {
  mkdir -p "$srcdir/$_project_name/build"
  cd "$srcdir/$_project_name/build"
  cmake -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release ..
  make
}


package() {
  cd "$srcdir/$_project_name/build"
  make DESTDIR="$pkgdir" install
}
