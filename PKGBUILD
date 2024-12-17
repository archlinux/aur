# Maintainer: Dane Johnson <daneallenjohnson AT protonmail DOT com>

pkgname=guile-minikanren-git
pkgver=2.0r16.364d6b9
pkgrel=1
pkgdesc='A relational programming extension to Scheme'
arch=(any)
license=('MIT')
depends=('guile')
makedepends=('git')
url="http://minikanren.org/"
source=('minikanren::git+https://github.com/webyrd/miniKanren-with-symbolic-constraints.git' 'guileify.sed')
sha256sums=('SKIP' '5f49c31c8a3a4244ca55ed6ca9502e20e5c7e6991d1f73a3f9b3cb8083f338c3')

prepare() {
    cat minikanren/mk-guile.scm minikanren/mk.scm | sed -f guileify.sed > minikanren.scm
}

pkgver() {
  cd minikanren
  printf "2.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    guild compile -o minikanren.go minikanren.scm
}

package() {
    install -Dm644 minikanren.scm "$pkgdir/usr/share/guile/site/3.0/minikanren.scm"
    install -Dm644 minikanren.go "$pkgdir/usr/lib/guile/3.0/site-ccache/minikanren.go"
}
