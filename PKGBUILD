# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=wdisplays-git
pkgver=r46.dd7e1e2
pkgrel=2
pkgdesc='GUI display configurator for wlroots compositors'
url='https://github.com/cyclopsian/wdisplays'
license=('GPL')
provides=('wdisplays')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gtk3')
makedepends=('git' 'meson')
source=("${pkgname%-git}::git+$url"
        "use-correct-versions.patch")
sha256sums=('SKIP'
            'e7cc9418945f12632fd17b408fdd8f1c0287f31e4bc3d2afab7683a84e8f2fd2')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {  
  cd "${pkgname%-git}"
  git apply "$srcdir/use-correct-versions.patch"
}

build() {
  cd "${pkgname%-git}"
  arch-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
