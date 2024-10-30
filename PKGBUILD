# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea-git
_pkgname=redsea
pkgver=v1.0.1.r18.g2d2700a
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64 aarch64)
url="https://github.com/windytan/redsea"
license=(MIT)
provides=('redsea')
conflicts=('redsea')
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp' 'nlohmann-json')
makedepends=('git' 'meson' 'catch2')
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
  meson setup --prefix /usr build
  meson compile -C build
}

package() {
  cd $pkgname
  DESTDIR=$pkgdir meson install -C build

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
