# Maintainer: Walter Casanova  wcasanova [at] disroot [dot] org

_pkgname=htop
pkgname=${_pkgname}-dev-git
pkgver=3.0.3.r19.g738d31b
pkgrel=1
pkgdesc="htop - an interactive process viewer, full-featured"
url="https://github.com/htop-dev/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses' 'libnl' 'libncursesw.so' 'hwloc' 'lm_sensors')
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
      --enable-werror \
      --enable-openvz \
      --enable-vserver \
      --enable-ancient-vserver \
      --enable-unicode \
      --enable-hwloc \
      --enable-setuid \
      --enable-delayacct \
      --enable-sensors
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
