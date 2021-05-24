# Maintainer: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Earnestly <zibeon AT googlemail.com>
pkgbase=gprbuild-git
pkgname=(libgpr-git gprbuild-git)
pkgver=r3779.5e603a95
pkgrel=1
pkgdesc="Builder for multi-language systems"
arch=('i686' 'x86_64')
url="https://github.com/AdaCore/gprbuild/"
license=('GPL3')
makedepends=('git' 'gprbuild-bootstrap' 'xmlada')

source=('git+https://github.com/AdaCore/gprbuild.git'
        'git+https://github.com/AdaCore/gprconfig_kb.git'
        'relocatable-build.patch'
        'always-use-host-gprinstall.patch'
        'expose-cargs-and-largs-makefile.patch')
sha1sums=('SKIP'
          'SKIP'
          '91b20bde99cf02410cdb2b74aa1adb014458a9b3'
          '66792ebc73aff76a368bd902adc6a6f181d1d878'
          '85c3e5facda8ce8316955a501ef56086f1c41bc0')

pkgver() {
    cd "$srcdir/${pkgbase%-git}"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgbase%-git}"
    patch -Np1 -i "$srcdir/expose-cargs-and-largs-makefile.patch"
    patch -Np1 -i "$srcdir/relocatable-build.patch"

    # By default, it tries to use the freshly-built gprinstall to install
    # gprbuild, but that requires libgpr, which can't be installed yet. Simply
    # fall back to gprinstall from gprbuild-bootstrap.
    patch -Np1 -i "$srcdir/always-use-host-gprinstall.patch"

    # GPRbuild hard-codes references to /usr/libexec, but ArchLinux packages
    # must use /usr/lib instead.
    sed -i 's/libexec/lib/g' doinstall gprbuild.gpr

    cd "$srcdir/gprconfig_kb"
    sed -i 's/libexec/lib/g' db/{compilers,gnat,linker}.xml
}

build() {
    cd "$srcdir/${pkgbase%-git}"

    export OS=UNIX
    GPRBUILD_OPTIONS="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
    make BUILD=production setup

    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" libgpr.build
    make GPRBUILD_OPTIONS="$GPRBUILD_OPTIONS" build

    # Copy the knowledge database so that gprinstall processes it
    rm -rf share/gprconfig
    cp -ar "$srcdir/gprconfig_kb/db" share/gprconfig
}

package_libgpr-git() {
    pkgdesc="Ada library to handle GPRbuild project files"
    provides=('libgpr')
    conflicts=('libgpr')
    depends=('xmlada')

    cd "$srcdir/${pkgbase%-git}"

    make prefix="$pkgdir/usr" libgpr.install
}

package_gprbuild-git() {
    provides=('gprbuild-bootstrap' 'gprbuild')
    conflicts=('gprbuild-bootstrap' 'gprbuild')
    depends=('libgpr' 'xmlada')

    cd "$srcdir/${pkgbase%-git}"

    make prefix="$pkgdir/usr" install

    # We don't need to distribute the installation script
    rm -f -- "$pkgdir/usr/doinstall"
}
