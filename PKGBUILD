# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Tim Lagnese <tim at inept tech>

pkgname=ada-libfswatch-git
pkgver=r17.00fb794
pkgrel=2

pkgdesc='Ada binding to the libfswatch library'
url='https://github.com/AdaCore/ada_libfswatch'
arch=('x86_64')
license=('GPL3')

depends=('gcc-libs' 'fswatch')
makedepends=('git' 'gprbuild' 'gnatcoll-core')

provides=('ada-libfswatch')

source=(
	'git+https://github.com/AdaCore/ada_libfswatch.git'
	'0001-Use-system-libfswatch-install.patch'
	'0002-Build-dynamic-library.patch'
	'0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch'
)
sha1sums=('SKIP'
          '511ac217679b16c6dc8d1276556fd532fa10b0cf'
          'b08e1c9d415982b1e5388d1fa2b17fe4a1558be8'
          '066d1578f3b6f4c8eece49d2650a79b5a0c084c8')

pkgver() {
    cd "$srcdir/ada_libfswatch"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/ada_libfswatch"
	patch -p1 < "$srcdir/0001-Use-system-libfswatch-install.patch"
	patch -p1 < "$srcdir/0002-Build-dynamic-library.patch"
	patch -p1 < "$srcdir/0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch"
}

build() {
    cd "$srcdir/ada_libfswatch"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make GPRBUILD_FLAGS="-vh -R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
}

package() {
    cd "$srcdir/ada_libfswatch"

	make install DESTDIR="$pkgdir/usr"

    # gprinstall installs a soft link for /usr/lib/libfswatch.so which is already owned by fswatch
    # Remove it
    rm "$pkgdir/usr/lib/libfswatch.so"
}
