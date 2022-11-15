# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgname=xmlada
epoch=1
pkgver=23.0.0
pkgrel=1
pkgdesc="An XML parser for Ada95"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/xmlada/"
license=('GPL3' 'custom')
depends=('gcc-ada')
makedepends=('gprbuild-bootstrap')
conflicts=("$pkgname-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'expose-cargs-and-largs-makefile.patch')

sha256sums=('66245a68f2e391c8dc8dc50d6d5f109eb3b371e261d095d2002dff3927dd5253'
            '7543e5fa8f2b0b400b937b0b3bb27b46b263a3cd7b17f00f6f9c6b3905729610')

prepare()
{
    cd "$srcdir/$pkgname-$pkgver"

    patch -Np0 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
}

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr --libexecdir=/lib --enable-shared

    # Rid flags not used by Ada.
    CFLAGS="${CFLAGS//-Wformat}"
    CFLAGS="${CFLAGS//-Werror=format-security}"

    # Make using a single job (-j1) to avoid the same file being compiled at the same time.
    make -j1 GPRBUILD_OPTIONS=-R
}

package()
{
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
