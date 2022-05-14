# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at irc.libera.chat>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgname=(libgpr gprbuild)
epoch=1
pkgver=22.0.0
pkgrel=2
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3' 'custom')
makedepends=('gprbuild-bootstrap' 'xmlada')

source=(
	"$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"gprconfig_kb-$pkgver.tar.gz::https://github.com/AdaCore/gprconfig_kb/archive/v$pkgver.tar.gz"
        '0001-Makefile-build-relocatable-instead-of-static-binarie.patch'
        '0002-Makefile-always-use-host-gprinstall.patch'
        '0001-compilers.xml-use-gcc-version-to-get-version-number-.patch'
)
sha256sums=('076e2b6ac0c7170753a6499094a6d30a98698aca2551c6796b3a617dd9ffc704'
            'cc19437e0982d9af31e09ad7c42eac6a445dac65336bd53d67ba61f630be7f13'
            '6ebbea41d4b8b516d0646438338fb228ea907600a2ad2c594bab41a7e1c3680c'
            'bcb0887eacce9ae609676c1965425847ab4fb27c5a5689f625c1864caeac8ad3'
            '42c66c412eb2e4949a754d660b04b77395d40d54b26a933ef7c75c5881e94238')

prepare() {
    cd "$srcdir/gprconfig_kb-$pkgver"

    patch -Np1 -i "$srcdir/0001-compilers.xml-use-gcc-version-to-get-version-number-.patch"

    cd "$srcdir/$pkgbase-$pkgver"

    patch -Np1 -i "$srcdir/0001-Makefile-build-relocatable-instead-of-static-binarie.patch"
    patch -Np1 -i "$srcdir/0002-Makefile-always-use-host-gprinstall.patch"

    ln -sfT "$srcdir/gprconfig_kb-$pkgver/db/" "share/gprconfig"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr     \
        "$srcdir/gprconfig_kb-$pkgver/db/compilers.xml" \
        "$srcdir/gprconfig_kb-$pkgver/db/linker.xml"    \
        "$srcdir/gprconfig_kb-$pkgver/db/gnat.xml"
}

build() {
    cd "$srcdir/$pkgbase-$pkgver"

    export OS=UNIX

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
    make BUILD=production setup

    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" libgpr.build
    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" build
}

_install_licenses() {
    cd "$srcdir/$pkgbase-$pkgver"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}

package_libgpr() {
    pkgdesc="Ada library to handle Gnat project files"
    depends=('xmlada')

    # both provide /usr/lib/libgpr.so
    conflicts=('grpc')

    cd "$srcdir/$pkgbase-$pkgver"

    make prefix="$pkgdir/usr" libgpr.install
    _install_licenses
}

package_gprbuild() {
    provides=('gprbuild-bootstrap')
    conflicts=('gprbuild-bootstrap')
    depends=('libgpr' 'xmlada')
    cd "$srcdir/$pkgbase-$pkgver"

    make prefix="$pkgdir/usr" install
    _install_licenses

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}

# vim: set et ts=4:
