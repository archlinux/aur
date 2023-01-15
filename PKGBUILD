# Original Author: sh1213 <shumer1213 at gmail>

pkgname=cnping-git
pkgver=r172.50efba0
pkgrel=2
pkgdesc="Minimal Graphical IPV4 Ping Tool by CNLohr"
arch=('i686' 'x86_64')
url="https://github.com/cntools/cnping"
license=('custom')
depends=('libxinerama' 'libgl')
makedepends=('git')
source=('git+https://github.com/cntools/cnping.git')
md5sums=('SKIP')

_gitname=cnping

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 cnping "$pkgdir/usr/bin/cnping"
  setcap cap_net_raw+ep "$pkgdir/usr/bin/cnping"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/cnping-git/LICENSE"
}
