_pkgbase=autoportforward
pkgname=$_pkgbase-git
pkgver=v0.0.5.r0.gb8059ea
pkgrel=1
pkgdesc="Bidirectional port-forwarding for docker and kubernetes"
url="https://github.com/ruoshan/autoportforward"
arch=('any')
makedepends=(
  'git'
  'go'
  'sed')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/ruoshan/autoportforward.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Strictly here to remove build path from binary
  # and eliminate the makepkg message "WARNING: Package contains reference to $srcdir"
  sed -E -i 's/go build/go build -trimpath/g' "$srcdir/$_pkgbase/build.sh"
}

build() {
  cd "$srcdir/$_pkgbase"
  sh ./build.sh
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm755 apf "$pkgdir/usr/bin/apf"
}
