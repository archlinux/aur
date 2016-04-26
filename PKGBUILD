# Maintainer: Thomas Fischer <fischer@unix-ag.uni-kl.de>

_basename=kdiff3
_gitbranch=kf5
pkgname=${_basename}-${_gitbranch}-git
pkgver=20160423_2b7e23a
pkgrel=1
pkgdesc="A KDE file comparator/merge tool"
arch=('i686' 'x86_64')
url="https://quickgit.kde.org/?p=scratch%2Fthomasfischer%2Fkdiff3.git"
license=('GPL')
depends=('kparts')
conflicts=("$_basename" "${_basename}-git" "${_basename}-${_gitbranch}" "${_basename}-qt")
makedepends=('cmake' 'extra-cmake-modules' 'git' 'kdoctools')
source=("git://anongit.kde.org/scratch/thomasfischer/${_basename}.git#branch=${_gitbranch}")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_basename"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g')_$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  # Strange source directory structure upstream, so "$srcdir/$_basename/$_basename" *is* correct
  cmake "$srcdir/$_basename/$_basename"  \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
