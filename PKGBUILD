# Maintainer: Walter Casanova  wcasanova [at] disroot [dot] org
# htop fork https://github.com/hishamhm/htop/issues/992
# https://github.com/htop-dev/htop/blob/master/ChangeLog#L3-L7

_pkgname=htop
pkgname=${_pkgname}-dev-git
pkgver=3.0.2.r82.g4b14ab9
pkgrel=1
pkgdesc="htop - an interactive process viewer, full-featured"
url="https://github.com/htop-dev/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses' 'libnl' 'libncursesw.so' )
makedepends=('git' 'python')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process'
            'hwloc: Portable Hardware Locality')
provides=('htop')
conflicts=('htop' 'htop-git')
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-werror \
      --enable-openvz \
      --enable-cgroup \
      --enable-vserver \
      --enable-ancient-vserver \
      --enable-taskstats \
      --enable-unicode \
      --enable-hwloc \
      --enable-setuid \
      --enable-delayacct
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
