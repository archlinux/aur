# Maintainer: Jack Baines <jackbaines6 at google mail>
pkgname=prevodb-databases-git
pkgver=89173
pkgrel=1
pkgdesc="Dictionary databases for prevodb"
arch=('any')
url="https://revuloj.github.io/"
license=('GPL-2.0-only') # Both sources are GPL2

depends=('prevodb')
makedepends=('git')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
# NOTE: A full depth clone of revo-fonto is 446 MB as of 2023-11-26. The built
# package is much smaller (47 MB).
source=('git+https://github.com/revuloj/revo-fonto.git'
        'git+https://github.com/revuloj/voko-grundo.git')
md5sums=('SKIP'
         'SKIP')

# The package is made from two different sources, so derive a pkgver by adding
# each of their revisions. Either can cause an update.
pkgver() {
   cd "$srcdir/revo-fonto"
   local revo_fonto_revision=$(git rev-list --count HEAD)

   cd "$srcdir/voko-grundo"
   local voko_grundo_revision=$(git rev-list --count HEAD)

   expr $revo_fonto_revision + $voko_grundo_revision
}

build() {
   cd "$srcdir"
   prevodb -s -i revo-fonto -i voko-grundo -o output.db
}

package() {
   cd "$srcdir"
   install -Dm 644 output.db "$pkgdir/usr/share/prevo/prevo.db"
}
