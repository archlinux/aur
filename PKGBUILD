# Maintainer: lmartinez-mirror
pkgname=sfm-git
pkgver=r94.e8a78ff
pkgrel=1
pkgdesc="simple file manager"
arch=('x86_64')
url="https://github.com/afify/sfm"
license=('ISC')
depends=('glibc')
makedepends=('git')
provides=('sfm')
conflicts=('sfm')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  ## Dirty hack to get Arch build flags working
  sed -i 's/CPPFLAGS =/CPPFLAGS \+=/;s/CFLAGS   =/CFLAGS   \+=/;s/LDFLAGS  =/LDFLAGS  \+=/' config.mk
}

build() {
  export CFLAGS="$CFLAGS"
  export CPPFLAGS="$CPPFLAGS"
  export LDFLAGS="$LDFLAGS"

  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install DESTDIR="$pkgdir/" PREFIX=/usr
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
