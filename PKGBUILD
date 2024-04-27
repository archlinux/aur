# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname=plasma6-runners-jetbrains-runner-git
_pkgname=plasma6-runners-jetbrains-runner
pkgver=r183.74516b8
pkgrel=1
pkgdesc="Launch your recent JetBrains projects from KRunner"
license=('LGPL3')
_project_name="JetBrainsRunner"
_url='https://github.com/alex1701c'
_submodule_name="jetbrains-api"
url="$_url/$_project_name"
arch=('x86_64')
depends=('krunner' 'libnotify' 'kcmutils' 'kio')
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
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF -DBUILD_WITH_QT6=ON ..
  make
}

package() {
  cd "$srcdir/$_project_name/build"
  make DESTDIR="$pkgdir" install
}
