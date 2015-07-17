# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Earnestly

pkgname=antimony-git
pkgver=0.8.0b.r223.g24899a4
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
url="http://www.mattkeeter.com/projects/antimony/3/"
provides=('antimony')
conflicts=('antimony')
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'boost-libs' 'python' 'libpng' 'lemon')
makedepends=('boost' 'git')
source=("git+https://github.com/mkeeter/antimony.git")
md5sums=('SKIP')

# todo, replace bundled eigen with official

_gitname="antimony"
_gitbranch="master"

pkgver() {
  cd "$_gitname"
  #git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
  git describe | sed 's/-/.r/; s/-/./'
}

build() {
    cd "$_gitname"

    sed -i 's|\(executable.path =\).*|\1 /usr/bin|' app/app.pro
    sed -i 's|\(nodes_folder.path =\).*|\1  /usr/share/antimony/sb/nodes|' app/app.pro
    sed -i 's|\(fab_folder.path =\).*|\1 /usr/lib/python3.4/site-packages/fab|' app/app.pro
    sed -i 's|return path.join("/");|return "/usr/share/antimony/sb/nodes";|' app/src/app/app.cpp

    mkdir -p build
    cd build
    qmake-qt5 PREFIX="/usr" ../sb.pro
    sed -i 's|/local/bin|/bin|g' Makefile
    make
}

check() {
    cd "$_gitname"
    return 0
    mkdir -p tests
    cd tests
    qmake-qt5 PREFIX="/usr" ../qt/antimony-tests.pro
    make
    # failure involving QNetworkAccessManager
}

package() {
    cd "$_gitname/build"
    make INSTALL_ROOT="$pkgdir" install
    install -Dm755 app/antimony "$pkgdir/usr/bin/antimony"
}
