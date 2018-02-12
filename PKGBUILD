# Maintainer: Etienne Brodu<aur.archlinux ат etnbrd.com>
# Contributor: Quey-Liang Kao<s101062801 ат m101.nthu.edu.tw>
# Contributor: Iwan Timmer <irtimmer ат gmail.com>

_root=github.com
_user=opencontainers
_name=runc
pkgname=${_name}-git
pkgver=v1.0.0.rc4.r217.ga618ab5a
pkgrel=1
pkgdesc="Container CLI tools"
depends=('glibc')
makedepends=('git' 'godep' 'go')
arch=('x86_64' 'i686')
source=("git+https://${_root}/${_user}/${_name}.git")
url="http://runc.io/"
provides=('runc')
conflicts=('runc')
options=('!strip')
license=("APACHE")
sha256sums=('SKIP')

prepare() {
  # setup local gopath
  mkdir -p $srcdir/src/${_root}/${_user}
  ln -s $srcdir/${_name} $srcdir/src/${_root}/${_user}/${_name}
}

build() {
  cd $srcdir/src/${_root}/${_user}/${_name}
  GOPATH="$srcdir" make
}

package() {
  cd "$srcdir/${_name}"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd $srcdir/${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
