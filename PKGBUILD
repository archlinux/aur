# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
epoch=1
pkgver=21.0.0
pkgrel=2
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('gprbuild-bootstrap')
conflicts=("$pkgname-git")

_checksum=c799502295baf074ad17b48c50f621879c392c57
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'expose-cargs-and-largs-makefile.patch'
)
sha256sums=('923024931f0c57451aa52cb9a3333874646102cb75957f27e3689670f90edc1e'
            '8cf1c7a650a698ec9b7b1c71659be82f7f31a37dbdd8d24636c17ebfb0e7b989')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make -j1 prefix="$pkgdir/usr" install

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING.RUNTIME
}
