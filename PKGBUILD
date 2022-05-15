# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
epoch=1
pkgver=22.0.0
pkgrel=2
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('gprbuild-bootstrap')
conflicts=("$pkgname-git")

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'expose-cargs-and-largs-makefile.patch'
)
sha256sums=('853ed895defd395c0bc96c23a50812168b656b31befc1336f45c5541f2bec06d'
            '8cf1c7a650a698ec9b7b1c71659be82f7f31a37dbdd8d24636c17ebfb0e7b989')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared

    # Rid flags not used by Ada.
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make -j1 prefix="$pkgdir/usr" install

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
