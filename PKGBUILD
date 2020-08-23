# Maintainer: Walter Casanova  wcasanova [at] disroot [dot] com
# htop fork https://github.com/hishamhm/htop/issues/992
# https://github.com/htop-dev/htop/blob/master/ChangeLog#L3-L7

_pkgname=htop
pkgname=${_pkgname}-dev-git
pkgver=3.0.0rc2.r0.g9e57b5c
pkgrel=1
pkgdesc="htop - an interactive process viewer"
url="https://github.com/htop-dev/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'python')
optdepends=('lsof: list open files for running process'
            'strace: attach to running process')
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
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

check() {
  cd "${srcdir}/${_pkgname}"
  make -k check
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
