# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=plasma5-runners-jetbrains-runner-git
_pkgname=plasma5-runners-jetbrains-runner
pkgver=r158.b6eb12d
pkgrel=1
pkgdesc="Launch your recent JetBrains projects from KRunner"
license=('LGPL3')
_project_name="JetBrainsRunner"
_url='https://github.com/alex1701c'
_submodule_name="jetbrains-api"
url="$_url/$_project_name"
arch=('x86_64')
depends=('krunner5' 'libnotify' 'kcmutils5' 'kio5')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
  cmake -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make
}

package() {
  cd "$srcdir/$_project_name/build"
  make DESTDIR="$pkgdir" install
}
