# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Adrian Bacircea <adrian.bacircea@gmail.com>
pkgname=chap-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r113.78bd79f
pkgrel=2
pkgdesc="ELF core file memory analyzer"
arch=(x86_64)
url="https://github.com/vmware/chap"
license=('GPL2')
makedepends=('git' 'cmake')
source=('chap::git+https://github.com/vmware/chap.git')
sha256sums=('SKIP')

pkgver() {
   cd "$srcdir/chap"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd "$srcdir/chap"
   git submodule update --init --recursive
   mkdir -p build-chap
   cd build-chap
   cmake ../
}

build() {
   cd "$srcdir/chap/build-chap"
   make
}

package() {
   cd "$srcdir/chap/build-chap"
   make DESTDIR=${pkgdir} install
}
