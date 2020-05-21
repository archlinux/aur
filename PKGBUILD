# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>
pkgname=xmlada-git
pkgver=r1543.e5bbafe
pkgrel=1
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('git' 'gcc-ada' 'gprbuild-bootstrap')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/AdaCore/xmlada.git'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('SKIP'
          '9b65cc99453fd15bdb7c49a32e6f76922ec904bd')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix=/usr --libexecdir=/lib --enable-shared
    make PROCESSORS="$(nproc)" GPRBUILD_OPTIONS=-R
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1

    install -D -m644 \
        "$srcdir/${pkgname%-git}/COPYING.RUNTIME" \
        "$pkgdir/usr/share/licenses/${pkgname}/COPYING.RUNTIME"
}
