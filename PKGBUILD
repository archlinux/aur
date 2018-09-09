# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
pkgver=2018
pkgrel=1
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('gcc-ada' 'gprbuild-bootstrap')
provides=("$pkgname")
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
    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/xmlada-gpl-2018-src"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
}
