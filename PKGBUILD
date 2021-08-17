# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada-libfswatch
pkgver=r16.94c0a5f
pkgrel=1
pkgdesc='An Ada binding to the libfswatch library in the fswatch project'
url='https://github.com/AdaCore/ada_libfswatch'
arch=('x86_64')
license=('GPL3' 'custom')

depends=('fswatch' 'gnatcoll-core')
makedepends=('git' 'gcc-ada' 'gprbuild')
source=('git+https://github.com/AdaCore/ada_libfswatch.git#commit=94c0a5f137b88113a791a148b60e5e7d019d6fa1'
        'ada-libfswatch.patch')
sha1sums=('SKIP'
          'cb3ddf5c8e8c5988c2f60111dfc18e132db00617')

pkgver() {
    cd "$srcdir/ada_libfswatch"
    printf "r%s.%s"                     \
        "$(git rev-list  --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/ada_libfswatch"
	git apply $srcdir/ada-libfswatch.patch
}

build() {
    cd "$srcdir/ada_libfswatch"
	make
}

package() {
    cd "$srcdir/ada_libfswatch"

	make install DESTDIR="$pkgdir/usr"

    # 'gprinstall' installs a soft link for '/usr/lib/libfswatch.so' 
    # which is already owned by fswatch, so remove it.
    rm "$pkgdir/usr/lib/libfswatch.so"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/ada-libfswatch/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/ada-libfswatch/COPYING.RUNTIME"
}
