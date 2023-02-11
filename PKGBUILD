# Maintainer: int <int [ate] arcor [dot] de>
#
pkgname=tidyp
pkgver="1.04"
pkgrel=2
pkgdesc="Validates and outputs cleaned-up HTML."
arch=('i686' 'x86_64')
url="http://tidyp.com"
license=('custom')
#depends=()
source=("http://github.com/downloads/petdance/tidyp/${pkgname}-${pkgver}.tar.gz"
    # The license is not part of the tidyp-tarball, so grab it from the repository.
    "https://raw.githubusercontent.com/petdance/tidyp/${pkgver}/htmldoc/license.html")
sha512sums=('dc58f8deb5d9878bb76acba015c71e06e09000762e446110df680ba9654fb4848e8fbbb95b9573d0c1a2a267980389cb348b7342967924bccd51ec0db84322b6'
    '56efd9ceae13acaef2afeaa3fb39a333078d4aae5eceb1f0e09615f86db0f7739809f231858c6d8b91cbd659115f213ed2f88044c44f036155434a6561bb8c27')

build() {
    cd "$pkgname-$pkgver"
    # Switch off gcc format-security (-Werror=format-security).
    # /ect/makepkg.conf includes -Werror=format-security in the default $CFLAGS. This breaks the build.
    # There are some places in localize.c where gcc is not able to check the format string.
    CFLAGS="$CFLAGS -Wno-format-security" ./configure --prefix=/usr
    make
}

package() {
    # The license is essentially the same as the tidy-license (including the name),
    # because tidyp is a fork of tidy and the license was not yet adapted to tidyp.
    # I don't fix this upstream-bug here.

    # Install license addition.
    install -D -m644 license.html \
        ${pkgdir}/usr/share/licenses/${pkgname}/license.html

    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

