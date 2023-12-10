# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea-git
_pkgname=redsea
pkgver=v0.20.r24.gc6e6b47
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64)
url="https://github.com/windytan/redsea"
license=(MIT)
provides=('redsea')
conflicts=('redsea')
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp')
makedepends=('git')
source=(
  "$pkgname"::git+https://github.com/windytan/$_pkgname.git
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # use git tag or fall back to number of revisions
    ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
