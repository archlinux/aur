# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgver=2018
pkgrel=3
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada>=8.2.1' 'gcc-ada<9.0.0')
makedepends=('gprbuild>=2018')
conflicts=("$pkgname-git")

source=('http://mirrors.cdn.adacore.com/art/5b0819dec7a447df26c27a40'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('6b01f6c7ac9d0766320738bef1d32894b34195e8'
          '9b65cc99453fd15bdb7c49a32e6f76922ec904bd')

prepare() {
    cd "$srcdir/xmlada-gpl-2018-src"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build() {
    cd "$srcdir/xmlada-gpl-2018-src"
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/xmlada-gpl-2018-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make -j1 prefix="$pkgdir/usr" install
}
