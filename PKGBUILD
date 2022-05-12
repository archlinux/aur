# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at irc.libera.chat>
# Contributor: Earnestly <zibeon AT googlemail.com>

pkgbase=gprbuild
pkgname=(libgpr gprbuild)
epoch=1
pkgver=22.0.0
pkgrel=1
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3' 'custom')
makedepends=('gprbuild-bootstrap' 'xmlada')

source=(
	"$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"gprconfig_kb-$pkgver.tar.gz::https://github.com/AdaCore/gprconfig_kb/archive/v$pkgver.tar.gz"
        "relocatable-build.patch"
        "always-use-host-gprinstall.patch"
        "0002-compilers.xml-use-gcc-version-to-get-version-number-.patch"
)
sha256sums=('076e2b6ac0c7170753a6499094a6d30a98698aca2551c6796b3a617dd9ffc704'
            'cc19437e0982d9af31e09ad7c42eac6a445dac65336bd53d67ba61f630be7f13'
            'd6479e03e6b6cfb09c133d94e3c47ea5d5e5e756b95554ab3106a679c3d57de4'
            '3fe0fd1df3156c9a8488d98ee6e7e822ae904ce410838661c8fc14c29abe2620'
            '9aa8cd9e522fb8a39b2512698885016db1b7286d8fe87d35bdc92e1bc10b20b7')

prepare() {
    cd "$srcdir/gprconfig_kb-$pkgver"

    patch -Np1 -i "$srcdir/0002-compilers.xml-use-gcc-version-to-get-version-number-.patch"

    cd "$srcdir/$pkgbase-$pkgver"

    patch -Np1 -i "$srcdir/relocatable-build.patch"
    # By default, it tries to use the freshly-built gprinstall to install gprbuild, but that requires libgpr,
    # which can't be installed yet. Simply fall back to gprinstall from gprbuild-bootstrap
    patch -Np1 -i "$srcdir/always-use-host-gprinstall.patch"

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