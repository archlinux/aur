# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgver=2020
_upstream_ver=2020-20200429-19A99
pkgrel=2
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('gprbuild-bootstrap')
conflicts=("$pkgname-git")

_checksum=c799502295baf074ad17b48c50f621879c392c57
source=("$pkgname-$_upstream_ver-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=$pkgname-$_upstream_ver-src.tar.gz"
        'expose-cargs-and-largs-makefile.patch'
        'COPYING.RUNTIME')
sha1sums=("$_checksum"
          '9b65cc99453fd15bdb7c49a32e6f76922ec904bd'
          '44a4a599d98b4ec6d63051103de2fd177f43f67a')

prepare() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make -j1 prefix="$pkgdir/usr" install

    # Install the custom license.
    install -D -m644 \
        "$srcdir/COPYING.RUNTIME" \
        "$pkgdir/usr/share/licenses/${pkgname}/COPYING.RUNTIME"
}
