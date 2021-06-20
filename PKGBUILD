# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
pkgver=r3152.7be06227
pkgrel=1
pkgdesc='Ada Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')
depends=('libgpr')
makedepends=('git' 'gcc-ada' 'gprbuild' 'texlive-bin')
source=('git+https://github.com/AdaCore/gnatcoll-core.git#commit=7be06227856aac9ec3aade5a412ade84a1b41469')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s"                        \
           "$(git rev-list  --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    make setup BUILD=PROD prefix=/usr
    make GPRBUILD_OPTIONS="-R"
    make -C docs html latexpdf
}

package() {
    cd "$srcdir/$pkgname"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make prefix="$pkgdir/usr" install -j1
    
    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
